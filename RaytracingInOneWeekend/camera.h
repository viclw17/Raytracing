#ifndef CAMERAH
#define CAMERAH

#define _USE_MATH_DEFINES
#include <math.h>
#include "ray.h"

class camera {
public:
    /*
    Followed the right-handed coordinate system, z is pointing out of screen. So pointing into the screen is the negative z-axis.
    Tranverse the screen from lower_left_corner and use 2 offset vectors along the screen sides to move the ray endpoint across the screen
    */
    /*camera(){
        lower_left_corner = vec3(-2.0,-1.0,-1.0);
        horizontal = vec3(4.0,0.0,0.0);
        vertical = vec3(0.0,2.0,0.0);
        origin = vec3(0.0,0.0,0.0);
    }*/

	camera(vec3 lookfrom, vec3 lookat, vec3 vup, float vfov, float aspect) { // vfov is top to bottom in degrees
		vec3 u, v, w;
		float theta = vfov*M_PI / 180; // convert to radian
		float half_height = tan(theta / 2);
		float half_width = aspect * half_height;
		origin = lookfrom;
		w = unit_vector(lookfrom - lookat); // z, pointing outward
		u = unit_vector(cross(vup, w)); // x
		v = cross(w, u);

		lower_left_corner = origin - half_width*u - half_height*v - w;
		horizontal = 2 * half_width * u;
		vertical = 2 * half_height * v;
	}

    ray get_ray(float u, float v){return ray(origin, lower_left_corner + u*horizontal + v* vertical - origin);}

    vec3 lower_left_corner;
    vec3 horizontal;
    vec3 vertical;
    vec3 origin;
};
#endif
