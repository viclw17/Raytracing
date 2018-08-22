#ifndef CAMERAH
#define CAMERAH

#include "ray.h"

vec3 random_in_unit_disk();

class camera {
public:
    /*
    Followed the right-handed coordinate system, z is pointing out of screen.
    So pointing into the screen is the negative z-axis.
    Tranverse the screen from lower_left_corner and use 2 offset vectors
    along the screen sides to move the ray endpoint across the screen
    */
    
    camera(vec3 lookfrom, vec3 lookat, vec3 vup, float vfov, float aspect, float aperture, float focus_dist) { // vfov is top to bottom in degrees
        lens_radius = aperture / 2;
        float theta = vfov*M_PI / 180;
        float half_height = tan(theta / 2);
        float half_width = aspect * half_height;
        origin = lookfrom;
        w = unit_vector(lookfrom - lookat);
        u = unit_vector(cross(vup, w));
        v = cross(w, u);
        lower_left_corner = origin - half_width*focus_dist*u - half_height*focus_dist*v - focus_dist*w;
        horizontal = 2 * half_width*focus_dist*u;
        vertical = 2 * half_height*focus_dist*v;
    }
    
    ray get_ray(float s, float t);
    
    vec3 origin;
    vec3 lower_left_corner;
    vec3 horizontal;
    vec3 vertical;
    vec3 u, v, w;
    float lens_radius;
};
#endif
