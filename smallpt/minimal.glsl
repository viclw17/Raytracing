vec2 resolution = iResolution;
vec2 mouse      = iMouse;
float time      = iGlobalTime;

#define PI 3.14159265359
#define SUB_SAMPLES 4
#define EPSILON 1e-4
#define RAY_EPSILON 1e-3
#define MAX_DEPTH 3
#define GAMMA 2.2
#define DIFF 0
#define SPEC 1
#define REFR 2

struct Ray{
    vec3 origin;
    vec3 dir;
};
struct Material{
    int refl;
    vec3 emission;
    vec3 color;
    float ior;
};
struct Sphere{
    float radius;
    vec3 pos;
    Material mat;
};
struct Plane{
    vec3 pos;
    vec3 normal;
    Material mat;
};

float seed = 0.;
float rand() { return fract(sin(seed++)*43758.5453123); }

// NOTE(Victor): pass in surface normal, return random reflecting direction vector.
vec3 cosWeightedSampleHemisphere(vec3 n){
    float u1 = rand(), u2 = rand();
    float r = sqrt(u1);
    float theta = 2.*PI*u2; // random angle

    float x = r * cos(theta);
    float y = r * sin(theta);
    float z = sqrt(max(0., 1. - u1));

    vec3 a = n, b;
    if (abs(a.x) <= abs(a.y) && abs(a.x) <= abs(a.z))
		a.x = 1.0;
	else if (abs(a.y) <= abs(a.x) && abs(a.y) <= abs(a.z))
		a.y = 1.0;
	else
		a.z = 1.0;
    a = normalize(cross(n, a));
    b = normalize(cross(n, a));
    return normalize(a * x + b * y + n * z);
}

// NOTE(Victor): http://www.rorydriscoll.com/2009/01/07/better-sampling/
// vec3 UniformSampleHemisphere(){
//     float u1 = rand(), u2 = rand();
//     float r = sqrt(1. - u1*u1);
//     float phi = 2.*PI*u2;
//     return vec3(cos(phi)*r, sin(phi)*r, u1);
// }
// vec3 CosineSampleHemisphere()
// {
//     float u1 = rand(), u2 = rand();
//     float r = sqrt(u1);
//     float theta = 2.*PI*u2;
//     float x = r * cos(theta);
//     float y = r * sin(theta);
//     float z = sqrt(max(0., 1. - u1));
//     return vec3(x, y, z);
// }

// NOTE(Victor): Scene Description
#define NUM_SPHERES 9
#define NUM_PLANES 6
Sphere spheres[NUM_SPHERES];
Plane planes[NUM_PLANES];
void initScene() {
    spheres[0] = Sphere(16.5, vec3(27, 16.5, 47),  Material(DIFF, vec3(0.), vec3(1.), 0.));
    spheres[1] = Sphere(16.5, vec3(73, 16.5, 78),  Material(DIFF, vec3(0.), vec3(.75, 1., .75), 1.5));
    spheres[2] = Sphere(600., vec3(50, 689.3, 50), Material(DIFF, vec3(6.), vec3(0.), 0.));
	planes[0]  = Plane(vec3(0, 0, 0),   vec3(0, 1, 0),  Material(DIFF, vec3(0.), vec3(.75), 0.));
    planes[1]  = Plane(vec3(-7, 0, 0),  vec3(1, 0, 0),  Material(DIFF, vec3(0.), vec3(.75, .25, .25), 0.));
    planes[2]  = Plane(vec3(0, 0, 0),   vec3(0, 0, -1), Material(DIFF, vec3(0.), vec3(.75), 0.));
    planes[3]  = Plane(vec3(107, 0, 0), vec3(-1, 0, 0), Material(DIFF, vec3(0.), vec3(.25, .25, .75), 0.));
    planes[4]  = Plane(vec3(0, 0, 180), vec3(0, 0, 1),  Material(DIFF, vec3(0.), vec3(0.), 0.));
    planes[5]  = Plane(vec3(0, 90, 0),  vec3(0, -1, 0), Material(DIFF, vec3(0.), vec3(.75), 0.));

    // spheres[3] = Sphere(1e5, vec3(-1e5+01., 40.8, 81.6),Material(DIFF, vec3(0.), vec3(.75), 0.)); // left
    // spheres[4] = Sphere(1e5, vec3( 1e5+99., 40.8, 81.6),Material(DIFF, vec3(0.), vec3(.75), 0.)); // right
    // spheres[5] = Sphere(1e5, vec3(50., 40.8, -1e5),		Material(DIFF, vec3(0.), vec3(.75), 0.)); // back
    // // spheres[6] = Sphere(1e5, vec3(50., 40.8,  1e5+170.),Material(DIFF, vec3(0.), vec3(.75), 0.)); // front
    // spheres[7] = Sphere(1e5, vec3(50., -1e5, 81.6),		Material(DIFF, vec3(0.), vec3(.75), 0.)); // floor
    // spheres[8] = Sphere(1e5, vec3(50.,  1e5+81.6, 81.6),Material(DIFF, vec3(0.), vec3(.75), 0.)); // ceiling
}

vec3 background(vec3 dir) {
    //return mix(vec3(0.), vec3(.9), .5 + .5 * dot(dir, vec3(0., 1., 0.)));
    // return texture(iChannel1, dir).rgb;
    return vec3(0.);
}


float intersectSphere(Ray r, Sphere s) {
    vec3 op = r.origin - s.pos;
    float b = dot(op, r.dir);

    float delta = b * b - dot(op, op) + s.radius * s.radius;
	if (delta < 0.)
        return 0.;
    else
        delta = sqrt(delta);

    float t; // get the minimal t
    if ((t = -b - delta) > EPSILON)
        return t;
    else if ((t = -b + delta) > EPSILON)
        return t;
    else
        return 0.;
}

float intersectPlane(Ray r, Plane p) {
    float t = dot(p.pos - r.origin, p.normal) / dot(r.dir, p.normal);
    return mix(0., t, float(t > EPSILON));
}

// NOTE(Victor): pass in ray, output ray length, surface normal, and surface material AT intersecting point.
int intersect(Ray ray, out float t, out vec3 normal, out Material mat){
    int id = -1;
    t = 1e5;
    // sphere intersection
    for(int i=0; i<NUM_SPHERES; i++){
        float d = intersectSphere(ray, spheres[i]);
        if(d!=0. && d<t){
            id = i;
            t = d;
            normal = normalize(ray.origin + ray.dir*t - spheres[i].pos);
            mat = spheres[i].mat;
        }
    }
    // plane intersection
    for (int i = 0; i < NUM_PLANES; i++) {
        float d = intersectPlane(ray, planes[i]);
        if (d != 0. && d < t) {
            id = i;
            t = d;
            normal = planes[i].normal;
            mat = planes[i].mat;
        }
    }

    return id;
}

// 根据相机模型生成初始光线
Ray generateRay(vec2 uv) {
    vec2 p = uv * 2. - 1.;

    vec3 camPos = vec3(50., 40.8, 172.);
	vec3 cz = normalize(vec3(50., 40., 81.6) - camPos);
	vec3 cx = vec3(1., 0., 0.);
	vec3 cy = normalize(cross(cx, cz));
    cx = cross(cz, cy);

    float aspectRatio = iResolution.x / iResolution.y;
    return Ray(camPos, normalize(.5135 * (aspectRatio * p.x * cx + p.y * cy) + cz));
}

vec3 trace(Ray ray){
    vec3 radiance = vec3(0.);
    vec3 reflectance = vec3(1.);
    for(int depth=0; depth<MAX_DEPTH; depth++){
        float t;
        vec3 n;
        Material mat;

        int id = intersect(ray,t,n,mat);

        if(id<0){
            radiance += reflectance * background(ray.dir);
            break;
        }

        radiance += reflectance * mat.emission;
        vec3 color = mat.color;

        float p = max(color.x, max(color.y,color.z));
        // russain roulette
        if(rand()<p)
            color/=p;
        else
            break;

        vec3 nl = n*sign(-dot(n, ray.dir));
        ray.origin += ray.dir*t;

        if(mat.refl == DIFF){
            ray.dir = cosWeightedSampleHemisphere(nl);
            reflectance *= color;
        }

        ray.origin += ray.dir * RAY_EPSILON;
    }
    return radiance;
}

void main(){
    seed = /*time +*/ resolution.y * gl_FragCoord.x/resolution.x + gl_FragCoord.y/resolution.y;
    initScene();
    vec3 color = vec3(0.);
    for (int x = 0; x < SUB_SAMPLES; x++) {
        for (int y = 0; y < SUB_SAMPLES; y++) {
        	// Tent Filter
            float r1 = 2. * rand(), r2 = 2. * rand();
            float dx = mix(sqrt(r1) - 1., 1. - sqrt(2. - r1), float(r1 > 1.));
            float dy = mix(sqrt(r2) - 1., 1. - sqrt(2. - r2), float(r2 > 1.));
            vec2 jitter = vec2(dx, dy);

            // 计算像素内采样点的uv坐标
            vec2 subuv = (gl_FragCoord.xy + jitter) / resolution.xy;

            // 生成相机光线
            Ray camRay = generateRay(subuv);

            // 计算光线对应的辐射度
            color += trace(camRay);
        }
    }

    color /= float(SUB_SAMPLES * SUB_SAMPLES);
    // color /= float(resolution.x*resolution.y);
    // color /= float(SUB_SAMPLES);
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = gl_FragColor.xy / resolution.xy;

    // muiltpass 多次采样算出平均结果
	// color += texture(iChannel0, uv).rgb * float(iFrame);
	// gl_FragColor = vec4(color / float(iFrame + 1), 1.);
    gl_FragColor = vec4(color,1.);
    gl_FragColor = vec4(clamp(pow(color, vec3(1./GAMMA)), 0., 1.), 1.);
}
