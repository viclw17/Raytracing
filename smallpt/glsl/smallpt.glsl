/*

This shader is an attempt at porting smallpt to GLSL.

See what it's all about here:
http://www.kevinbeason.com/smallpt/

The code is based in particular on the slides by David Cline.

Some differences:

- For optimization purposes, the code considers there is
  only one light source (see the commented loop)
- Russian roulette and tent filter are not implemented

I spent quite some time pulling my hair over inconsistent
behavior between Chrome and Firefox, Angle and native. I
expect many GLSL related bugs to be lurking, on top of
implementation errors. Please Let me know if you find any.

--
Zavie

*/

// Play with the two following values to change quality.
// You want as many samples as your GPU can bear. :)

// #ifdef GL_ES
// precision mediump float;
// #endif
#define SAMPLES 10
#define MAXDEPTH 4
// #define SAMPLES 8
// #define MAXDEPTH 4

// Not used for now
//#define DEPTH_RUSSIAN 2

#define PI 3.14159265359
#define DIFF 0
#define SPEC 1
#define REFR 2
#define NUM_SPHERES 10//9

//#define LIGHTCOLOR vec3(16.86, 10.76, 8.2)*1.3
//#define WHITECOLOR vec3(.7295, .7355, .729)*0.7
#define BLUECOLOR vec3(.25, .25, .75)
#define REDCOLOR vec3(.75, .25, .25)
#define GRAYCOLOR vec3(.75)
#define WHITECOLOR vec3(1.)

// uniform float time;
// uniform vec2 mouse;
// uniform vec2 resolution;

vec2 resolution = iResolution;
vec2 mouse      = iMouse;
float time      = iGlobalTime;

/////////
float seed = 0.;
float rand() {return fract(sin(seed++)*43758.5453123);}
float hash1() {return fract(sin(seed += 1.0)*43758.5453123);}
vec2 hash2() {return fract(sin(vec2(seed,seed+=1.0))*vec2(43758.5453123,22578.1459123));}
vec3 hash3() {return fract(sin(vec3(seed,seed+=1.0,seed+=2.0))*vec3(43758.5453123,22578.1459123,19642.3490423));}

struct Ray {
  vec3 o, d; // origin, direction
};

// sphere
// radius, position, emissive, color，reflection
// float,  vec3,     vec3,     vec3,  int
struct Sphere {
	float r;      // radius
	vec3 p, e, c; // position, emissive, color
	int refl;
};

// lightSourceVolume
Sphere lightSourceVolume = Sphere(20., vec3(50., 81.6, 81.6), vec3(12.), vec3(0.), DIFF);

// the hard coded scene (some # of spheres)
Sphere spheres[NUM_SPHERES];

void initSpheres() {
    float scale = 0.;//15.;
    // walls
    // radius, position, emissive, color，reflection
    spheres[0] = Sphere(1e5, vec3(-1e5+01., 40.8, 81.6),vec3(0.), REDCOLOR,  DIFF); // left
    spheres[1] = Sphere(1e5, vec3( 1e5+99., 40.8, 81.6),vec3(0.), BLUECOLOR, DIFF); // right
    spheres[2] = Sphere(1e5, vec3(50., 40.8, -1e5),		vec3(0.), GRAYCOLOR, DIFF); // back
    // spheres[3] = Sphere(1e5, vec3(50., 40.8,  1e5+170.),vec3(0.), GRAYCOLOR, DIFF); // front
    spheres[4] = Sphere(1e5, vec3(50., -1e5, 81.6),		vec3(0.), GRAYCOLOR, DIFF); // floor
    spheres[5] = Sphere(1e5, vec3(50.,  1e5+81.6, 81.6),vec3(0.), GRAYCOLOR, DIFF); // ceiling

    // victor
    spheres[6] = Sphere(14., vec3(20., 33.+sin(time+0.)*scale, 50.), vec3(0.), WHITECOLOR, SPEC);
    spheres[7] = Sphere(14., vec3(50., 33.+sin(time+1.)*scale, 50.), vec3(0.), WHITECOLOR, DIFF);
    spheres[8] = Sphere(14., vec3(80., 33.+sin(time+2.)*scale, 50.), vec3(0.), WHITECOLOR, REFR);

    // spheres
    // spheres[6] = Sphere(16.5, vec3(27., 16.5, 47.), vec3(0.), WHITECOLOR, SPEC);
    // spheres[7] = Sphere(16.5, vec3(73., 16.5, 78.), vec3(0.), WHITECOLOR, DIFF);

    // lighting sphere, id=8
    spheres[9] = Sphere(600., vec3(50., 681.33, 81.6), vec3(10.), WHITECOLOR, DIFF);
}

// Ray–sphere intersection
float sphere_intersect(Sphere s, Ray r) {
    vec3 op = r.o - s.p; // (o-c), o: ray origin, c: sphere center position
    float half_b = dot(r.d, op); // b/2=l(o-c), l: ray direction
    float det = half_b * half_b - dot(op, op) + s.r * s.r;
    // determinant, det=(b/2)^2-(o-c)^2+r^2, simplified because l is unit vector
    float sqrt_det;
    float t; // for solutions
    float epsilon = 1e-3; // maximum error value
    if (det < 0.)
        // ray missed sphere
        return 0.;
    else
        // det >= 0.
        // interseted or tangent
        sqrt_det = sqrt(det);

    // calculate final solution
    // t=-b/2+sqrt(det) or t=-b/2-sqrt(det)
    t = -half_b - sqrt_det;

    // return smaller positive solution
    // 1. if-else style
    if(t>epsilon){
        return t;
    }
    else{
        t = -half_b + sqrt_det;
        if(t>epsilon){
            return t;
        }
        else{
            return 0.; // if both solutions are negative, the sphere is behind the ray
        }
    }
    // 2. more concise ternary operator style
    // return (t = b - det) > epsilon ? t : ((t = b + det) > epsilon ? t : 0.);
}

// Ray-scene intersection
// out arguments, similar to passing by reference!!!
// tbd
int scene_intersect(Ray r, out float t, out Sphere s, int avoid) {
	int id = -1;
	t = 1e5; // draw depth
	s = spheres[0];
	for (int i = 0; i < NUM_SPHERES; ++i) { // loop through all spheres in order
		Sphere S = spheres[i];
		float d = sphere_intersect(S, r); // closest intersection distance
		if (i!=avoid && d!=0. && d<t) {
            t = d;
            id = i;
            s=S;
        }
	}
	return id;
}

//-----------------------------------------------------
// scene
//-----------------------------------------------------
vec3 cosWeightedRandomHemisphereDirection( const vec3 n ) {
    vec2 r = hash2();

    vec3  uu = normalize( cross( n, vec3(0.0,1.0,1.0) ) );
    vec3  vv = cross( uu, n );

    float ra = sqrt(r.y);
    float rx = ra*cos(6.2831*r.x);
    float ry = ra*sin(6.2831*r.x);
    float rz = sqrt( 1.0-r.y );
    vec3  rr = vec3( rx*uu + ry*vv + rz*n );

    return normalize( rr );
}

vec3 randomSphereDirection() {
    vec2 r = hash2()*6.2831;
    vec3 dr=vec3(sin(r.x)*vec2(sin(r.y),cos(r.y)),cos(r.x));
    return dr;
}

vec3 randomHemisphereDirection( const vec3 n ) {
    vec3 dr = randomSphereDirection();
    return dot(dr,n) * dr;
}

// Use normal to create orthonormal coordinate frame (u,v,w)
vec3 jitter(vec3 d, float phi, float sin_a, float cos_a) {
	vec3 w,u,v;

    w = normalize(d);               // w = d is surface normal, the z axis in this new orthonormal basis, left-hand, x-right/y-up/z-out
    u = normalize(cross(w.zyx, w)); // u is perpendicular to w
    // u = normalize(cross(w,abs(w.x)>.1?vec3(0,1,0):vec3(1))); // smallpt
    v = cross(w, u);                // v is perpendicular to w and u

    // Pete Shirley's Graphics Blog
    // http://psgraphics.blogspot.com/2014/11/making-orthonormal-basis-from-unit.html
    // if(w.z < -0.99999){
    //     u = vec3(0,-1,0);
    //     v = vec3(-1,0,0);}
    // w = normalize(d);
    // float a = 1./(1.+w.z);
    // float b = -w.x+w.y*a;
    // u = normalize(vec3(1.-w.x*w.x*a, b, -w.x));
    // v = normalize(vec3(b, 1.-w.y*w.y*a, -w.y));

    vec3 r = (u*cos(phi) +
              v*sin(phi)) * sin_a +
              w*cos_a; // r is random reflection direction
    // r1->phi, r2s->sin_a, sqrt(1.-r2)->cos_a
	return r;
}

vec3 debug_radiance(Ray r) {
    vec3 acc = vec3(0.);
	vec3 mask = vec3(1.);

    vec3 x, n, nl, d, e, l0, l;
    float cos_a_max, cos_a, sin_a, phi;
    float r1,r2,r2s;
    float omega, E;
	int id = -1; // id of intersected object, -1 is avoid

    for (int depth = 0; depth < MAXDEPTH; ++depth) {
        // 1. do intersection
		float t; // distance to intersection
		Sphere obj; // the hit object
		if ((id = scene_intersect(r, t, obj, id)) < 0) break; // if miss object
        // 2. surface properties
		x = t * r.d + r.o;        // intersecting point position
        // x = x * vec3(0,0,.01);
		n = normalize(x - obj.p); // intersecting point normal
        //When a ray hits a glass surface, the ray tracer must determine
        //if it is entering or exiting glass to compute the refraction ray.
        nl = n * sign(-dot(n, r.d)); // properly oriented surface normal

		if (obj.refl == DIFF) { // diffuse
			e = vec3(0);

			// Normally we would loop over the light sources and
			// cast rays toward them, but since there is only one
			// light source, that is mostly occluded, here goes
			// the ad hoc optimization:
			Sphere s = lightSourceVolume;
			int i = 9;

			l0 = s.p - x;
			cos_a_max = sqrt(1. - clamp(s.r * s.r / dot(l0, l0), 0., 1.)); // cos=sqrt(1-sin^2)
            phi = 2.*PI*rand();
			cos_a = mix(cos_a_max, 1., rand()); // mix!
            sin_a = sqrt(1. - cos_a*cos_a);
			l = jitter(l0, phi, sin_a, cos_a);
            //l = cosWeightedRandomHemisphereDirection(l0); // test
            //l = RandomHemisphereDirection(l0);

            // Shoot shadow ray
            // Check for occlusion with shadow ray
            // i=9 is light source
			if (scene_intersect(Ray(x, l), t, s, id) == 9) { // Ray(x, l), origin, direction
				omega = 2. * PI * (1. - cos_a_max); // Compute 1/probability with respect to solid angle
				e += (s.e * clamp(dot(l, n),0.,1.) * omega) / PI; //Calculate lighting and add to current value
			}
			E = 1.;//float(depth==0);
			acc += mask * obj.e * E + mask * obj.c * e;
			mask *= obj.c;

            r1 = 2.*PI*rand(); // get random angle, (0,2PI)
			r2 = rand();       // get random value, (0,1)
            r2s = sqrt(r2);    // r2 sqrt, get random distance from center
			d = jitter(nl, r1, r2s, sqrt(1. - r2));
            //d = cosWeightedRandomHemisphereDirection(nl); // test
            //d = RandomHemisphereDirection(l0);
            //d = vec3(0,0,0); // test
			r = Ray(x, d); // new ray

		} else if (obj.refl == SPEC) {
			acc += mask * obj.e;
			mask *= obj.c;
			r = Ray(x, reflect(r.d, n)); //Reflected Ray
		} else {
			float a=dot(n,r.d);
            float ddn=abs(a);
			float nc=1.;
            float nt=1.5;
            float nnt=mix(nc/nt, nt/nc, float(a>0.));
			float cos2t=1.-nnt*nnt*(1.-ddn*ddn);
			r = Ray(x, reflect(r.d, n)); //Reflected Ray
			if (cos2t>0.) {
				vec3 tdir = normalize(r.d*nnt + sign(a)*n*(ddn*nnt+sqrt(cos2t))); // Refraction Ray
				float R0=(nt-nc)*(nt-nc)/((nt+nc)*(nt+nc));
				float c = 1.-mix(ddn,dot(tdir, n),float(a>0.));
				float Re=R0+(1.-R0)*c*c*c*c*c;
                float P=.25+.5*Re;
                float RP=Re/P;
                float TP=(1.-Re)/(1.-P);

				if (rand()<P) { mask *= RP; }
				else { mask *= obj.c*TP; r = Ray(x, tdir); }
			}
		}
	}
	return acc;
    // return mask;
    // return x;
    // return n; // surface normal
    // return nl;
    // return d;
    // return e;
    // return vec3(cos_a_max);
    // return vec3(cos_a);
    // return vec3(sin_a);
    // return vec3(phi);
    // return l;
    // return vec3(omega);
    // return r.d;
}

vec3 radiance(Ray r) {
	vec3 acc = vec3(0.);
	vec3 mask = vec3(1.);
	int id = -1; // id of intersected object, -1 is avoid
	for (int depth = 0; depth < MAXDEPTH; ++depth) {
		float t; // distance to intersect
		Sphere obj;
		if ((id = scene_intersect(r, t, obj, id)) < 0) break; // if id<0, break loop
		vec3 x = t * r.d + r.o; // hit point position
		vec3 n = normalize(x - obj.p); // hit normal
        vec3 nl = n * sign(-dot(n, r.d));

		//vec3 f = obj.c;
		//float p = dot(f, vec3(1.2126, 0.7152, 0.0722));
		//if (depth > DEPTH_RUSSIAN || p == 0.) if (rand() < p) f /= p; else { acc += mask * obj.e * E; break; }

		if (obj.refl == DIFF) {
			float r2 = rand();
			vec3 d = jitter(nl, 2.*PI*rand(), sqrt(r2), sqrt(1. - r2));
			vec3 e = vec3(0);
			//for (int i = 0; i < NUM_SPHERES; ++i)
			// {
				// Sphere s = sphere(i);
				// if (dot(s.e, vec3(1.)) == 0.) continue;

				// Normally we would loop over the light sources and
				// cast rays toward them, but since there is only one
				// light source, that is mostly occluded, here goes
				// the ad hoc optimization:
				Sphere s = lightSourceVolume;
    			int i = 8;

				vec3 l0 = s.p - x;
				float cos_a_max = sqrt(1. - clamp(s.r * s.r / dot(l0, l0), 0., 1.));
				float cosa = mix(cos_a_max, 1., rand());
				vec3 l = jitter(l0, 2.*PI*rand(), sqrt(1. - cosa*cosa), cosa);

				if (scene_intersect(Ray(x, l), t, s, id) == i) { // Ray(x, l), origin, direction
					float omega = 2. * PI * (1. - cos_a_max); // PI from cancelling
					e += (s.e * clamp(dot(l, n),0.,1.) * omega) / PI;
				}
			// }
			float E = 1.;//float(depth==0);
			acc += mask * obj.e * E + mask * obj.c * e;
			mask *= obj.c;
			r = Ray(x, d);

		} else if (obj.refl == SPEC) {
			acc += mask * obj.e;
			mask *= obj.c;
			r = Ray(x, reflect(r.d, n));
		} else {
			float a=dot(n,r.d), ddn=abs(a);
			float nc=1., nt=1.5, nnt=mix(nc/nt, nt/nc, float(a>0.));
			float cos2t=1.-nnt*nnt*(1.-ddn*ddn);
			r = Ray(x, reflect(r.d, n));
			if (cos2t>0.) {
				vec3 tdir = normalize(r.d*nnt + sign(a)*n*(ddn*nnt+sqrt(cos2t)));
				float R0=(nt-nc)*(nt-nc)/((nt+nc)*(nt+nc)),
					c = 1.-mix(ddn,dot(tdir, n),float(a>0.));
				float Re=R0+(1.-R0)*c*c*c*c*c,P=.25+.5*Re,RP=Re/P,TP=(1.-Re)/(1.-P);
				if (rand()<P) { mask *= RP; }
				else { mask *= obj.c*TP; r = Ray(x, tdir); }
			}
		}
	}
	return acc;
}

// for(pixels)
void main(void) {
	initSpheres();

	// seed = time + resolution.y * gl_FragCoord.x / resolution.x + gl_FragCoord.y / resolution.y;
    seed = resolution.y * gl_FragCoord.x / resolution.x + gl_FragCoord.y / resolution.y;
    // seed = time;

    // normalize uv: gl_FragCoord.xy / resolution.xy (0~1,0~1)
    // centralize uv: 2. * gl_FragCoord.xy / resolution.xy - 1 (-1~1,-1~1)
	vec2 uv;
    uv = 2. * gl_FragCoord.xy / resolution.xy - 1.;

    // Set up camera coordinates
	vec3 camPos; // left-right, up-down, in-out
    camPos =  vec3((2. * (mouse.xy==vec2(0.0)?.5*resolution.xy:mouse.xy*resolution.xy) / resolution.xy - 1.) * vec2(48., 40.) + vec2(50., 40.8), 169.);
    // camPos = vec3(50,40,180);
    // camPos = vec3(50,40,160);
    // Calculate the camera’s forward direction by normalizing (Target – Eye)
    vec3 target;
    target = camPos - vec3(0,0,1);
	vec3 cz = normalize(target - camPos);
    cz = normalize(vec3(50., 40., 81.6) - camPos); // old
    // camera’s right vector
	vec3 cx = vec3(1.,0.,0.);
    // camera’s up vector
	vec3 cy = normalize(cross(cx, cz));
    // cx = cross(cz, cy);

	vec3 color = vec3(0.);
    float ratio = resolution.x/resolution.y;
    Ray ray;

    // samling per pixel
	for (int i = 0; i < SAMPLES; ++i)
    {
        ray = Ray(
            camPos,
            normalize(.53135 * (uv.x*cx*ratio + uv.y*cy) + cz));
        // color += radiance(ray);
        color += debug_radiance(ray);
    }
    color = color/float(SAMPLES); // result /= num_samples // box filter

	gl_FragColor = vec4(pow(clamp(color, 0., 1.), vec3(1./2.2)), 1.); // gamma
    // gl_FragColor = vec4(color,1); // pure color
    // gl_FragColor = vec4(vec3(rand()),1); // noise
    // gl_FragColor = vec4(uv,0,1); // uv
}
