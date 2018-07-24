#define T_MAX 10e31
#define TOLERANCE 0.00001
#define BOUNCE_COUNT 4

// victor
#define SAMPLES 4
// float seed = 0.;
// float rand() {return fract(sin(seed++)*43758.5453123);}
float iTime = iGlobalTime;

struct material
{
    vec3 albedo;
    vec3 emission;
    float specular;
};

struct sphere
{
    vec3 p;
    float r;
    material mat;
};

struct plane
{
    vec3 p;
    vec3 n;
    material mat;
};

struct disk
{
    vec3 p;
    vec3 n;
    float r;
    material mat;
};

float hash(float x){return fract(sin(219.151*x)*9012.15);}

// NOTE(chen): fizzer's lambert no tangent distribution: http://www.amietia.com/lambertnotangent.html
vec3 lambertNoTangent(in vec3 normal, in vec2 uv)
{
   float theta = 6.283185 * uv.x;
   uv.y = 2.0 * uv.y - 1.0;
   vec3 spherePoint =
        vec3(sqrt(1.0 - uv.y * uv.y) * vec2(cos(theta), sin(theta)), uv.y);
   return normalize(normal + spherePoint);
}

// NOTE(chen): I know this is horrible ... If you have any better ways, let me know
vec3 random_ray(vec3 n, vec4 seed)
{
    vec2 uv = vec2(
        hash(51.5*seed.x + 15.6*seed.y + 37.1*seed.z + 13.7*seed.w + 15.1*iTime),
        hash(19.6*seed.x + 91.1*seed.y + 15.1*seed.z + 21.1*seed.w + 7.8*iTime));

    uv = vec2(
        hash(51.5*seed.x + 15.6*seed.y + 37.1*seed.z + 13.7*seed.w + 15.1),
        hash(19.6*seed.x + 91.1*seed.y + 15.1*seed.z + 21.1*seed.w + 7.8));

    return lambertNoTangent(n, uv);
}

#define SPHERE_COUNT 3
#define PLANE_COUNT 6
#define DISK_COUNT 1

sphere spheres[SPHERE_COUNT];
plane planes[PLANE_COUNT];
disk disks[DISK_COUNT];

vec3 sky_col = vec3(0);

void init_scene()
{
    spheres[0] = sphere(vec3(-0.9, 0.5, 2), 0.5,
                material(vec3(0.95), vec3(0), 0.0));
    spheres[1] = sphere(vec3(0.9, 0.5, 1), 0.5,
                material(vec3(0.95), vec3(0), 0.0));
    spheres[2] = sphere(vec3(0, 1.5, 3.3), 0.5,
                material(vec3(0.95), vec3(0), 0.98));

    planes[0] = plane(vec3(0), vec3(0,1,0),
                material(vec3(0.95), vec3(0), 0.0));
    planes[1] = plane(vec3(-1.5, 0, 0), vec3(1,0,0),
                material(vec3(0.95, 0, 0), vec3(0), 0.0));
    planes[2] = plane(vec3(1.5, 0, 0), vec3(-1,0,0),
                material(vec3(0, 0.95, 0), vec3(0), 0.0));
    planes[3] = plane(vec3(0, 3, 0), vec3(0,-1,0),
                material(vec3(0.95), vec3(0), 0.0));
    planes[4] = plane(vec3(0, 0, 4), vec3(0,0,-1),
                material(vec3(0.95), vec3(0), 0.0));
    planes[5] = plane(vec3(0, 0, -2.5), vec3(0,0,1),
                material(vec3(0.95), vec3(0), 0.0));

    disks[0] = disk(vec3(0, 2.99, 2), vec3(0, -1, 0), 0.9,
                material(vec3(0.95), vec3(3), 0.0));
}

vec3 pathtrace(in vec3 ro, in vec3 rd, int sample_i)
{
    vec3 col = vec3(0);
    vec3 atten = vec3(1);
    vec3 next_n;
    // depth
    for (int bounce_i = 0; bounce_i < BOUNCE_COUNT; ++bounce_i)
    {
        float min_t = T_MAX;
        material mat;
        // trace sphere
        for (int sphere_i = 0; sphere_i < SPHERE_COUNT; ++sphere_i)
        {
            vec3 p = spheres[sphere_i].p;
            float r = spheres[sphere_i].r;

            float a = dot(rd, rd);
            float b = 2.0 * dot(ro - p, rd);
            float c = dot(ro - p, ro - p) - r*r;
            float denom = 2.0 * a;
            float sqrt_term = b*b - 4.0*a*c;

            if (denom != 0.0 && sqrt_term >= 0.0)
            {
                float t1 = (-b + sqrt(sqrt_term)) / denom;
                float t2 = (-b - sqrt(sqrt_term)) / denom;

                float t = min(t1, t2);
                if (t > TOLERANCE && min_t > t)
                {
                    min_t = t;
                    next_n = normalize(ro + t*rd - p);
                    mat = spheres[sphere_i].mat;
                }
            }
        }
        // trace plane
        for (int plane_i = 0; plane_i < PLANE_COUNT; ++plane_i)
        {
            vec3 p = planes[plane_i].p;
            vec3 n = planes[plane_i].n;

            float t = dot(p - ro, n) / dot(rd, n);
            if (t > TOLERANCE && min_t > t)
            {
                min_t = t;
                next_n = n;
                mat = planes[plane_i].mat;
            }
        }
        // trace disk
        for (int disk_i = 0; disk_i < DISK_COUNT; ++disk_i)
        {
            vec3 p = disks[disk_i].p;
            vec3 n = disks[disk_i].n;
            float r = disks[disk_i].r;

            float t = dot(p - ro, n) / dot(rd, n);
            if (length(ro + t*rd - p) <= r &&
                t > TOLERANCE && min_t > t)
            {
                min_t = t;
                next_n = n;
                mat = disks[disk_i].mat;
            }
        }

        if (min_t > TOLERANCE && min_t != T_MAX)
    	{
            col = col + atten * mat.emission;
            atten *= mat.albedo;

            ro = ro + min_t*rd;
            rd = mix(random_ray(next_n, vec4(ro, sample_i * BOUNCE_COUNT + bounce_i)), reflect(rd, next_n), mat.specular);
    	}
        else
        {
            col += atten * sky_col;
            break;
        }
    }

    return col;
}

void main(void)
{
    vec2 uv = gl_FragCoord.xy / iResolution.xy;
    //vec3 prev_col = texture(iChannel0, uv).rgb;

    uv = 2.0 * uv - 1.0;
    uv.x /= iResolution.y / iResolution.x;

    // camera
    vec3 ro = vec3(0, 1, -2);
    vec3 at = vec3(0, 1, 0);
    vec3 cam_z = normalize(at - ro);
    vec3 cam_x = normalize(cross(vec3(0,1,0), cam_z));
    vec3 cam_y = cross(cam_z, cam_x);
    vec3 rd = normalize(uv.x * cam_x + uv.y * cam_y + 2.0 * cam_z);

    init_scene();

    vec3 col;

    for (int i = 0; i < SAMPLES; ++i)
    {
        //jitter the sampler each time to do poor man's multisample
        vec2 pixel_size = (1.0 / iResolution.xy);
        pixel_size.x /= iResolution.y / iResolution.x;

        vec2 uv_jitter;

        // uv_jitter = pixel_size * (-1.0 + 2.0 * vec2(hash(91.5*uv.x + 15.6*uv.y + 15.1*iTime), hash(11.6*uv.x + 91.1*uv.y + 17.8*iTime)));

        uv_jitter = pixel_size * (-1.0 + 2.0 * vec2(hash(91.5*uv.x + 15.6*uv.y + 15.1), hash(11.6*uv.x + 91.1*uv.y + 17.8)));

        uv += uv_jitter;

        // col += pathtrace(ro, rd, 0);
        col += pathtrace(ro, rd, i);
    }

    // //original
    // //jitter the sampler each time to do poor man's multisample
    // vec2 pixel_size = (1.0 / iResolution.xy);
    // pixel_size.x /= iResolution.y / iResolution.x;
    // vec2 uv_jitter = pixel_size * (-1.0 + 2.0 * vec2(hash(91.5*uv.x + 15.6*uv.y + 15.1*iTime), hash(11.6*uv.x + 91.1*uv.y + 17.8*iTime)));
    // uv_jitter = pixel_size * (-1.0 + 2.0 * vec2(hash(91.5*uv.x + 15.6*uv.y + 15.1), hash(11.6*uv.x + 91.1*uv.y + 17.8)));
    // uv += uv_jitter;

    // col += pathtrace(ro, rd, 0);

    col /= float(SAMPLES); // box filter

    // // multi pass
    // int frame_count = iFrame + 1;
    // float prev_weight = float(iFrame) / float(frame_count);
    // float curr_weight = 1.0 - prev_weight;
    // fragColor = vec4(prev_weight * prev_col + curr_weight * col, 1);

    col = 1.0-exp(-3.0*col); // hand-tuned exposure rate
    col = pow(col, vec3(1.0 / 2.2)); // gamma correction
    gl_FragColor = vec4(col,1);
}

// void mainImage( out vec4 fragColor, in vec2 fragCoord )
// {
//     vec2 uv = fragCoord/iResolution.xy;
//     vec3 col = texture(iChannel0, uv).rgb;
//
//     col = 1.0-exp(-3.0*col); // hand-tuned exposure rate
//     col = pow(col, vec3(1.0 / 2.2)); // gamma correction
//     fragColor = vec4(col,1.0);
// }
