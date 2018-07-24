#ifndef CAMERAH
#define CAMERAH

#include "ray.h"

class camera {
public:
    /*
    Followed the right-handed coordinate system, z is pointing out of screen. So pointing into the screen is the negative z-axis.
    Tranverse the screen from lower_left_corner and use 2 offset vectors along the screen sides to move the ray endpoint across the screen
    */
    camera(){
        lower_left_corner = vec3(-2.0,-1.0,-1.0);
        horizontal = vec3(4.0,0.0,0.0);
        vertical = vec3(0.0,2.0,0.0);
        origin = vec3(0.0,0.0,0.0);
    }

    ray get_ray(float u, float v){return ray(origin, lower_left_corner + u*horizontal + v* vertical - origin);}

    vec3 lower_left_corner;
    vec3 horizontal;
    vec3 vertical;
    vec3 origin;
};
#endif
