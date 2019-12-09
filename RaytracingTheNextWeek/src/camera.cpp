#include "camera.h"

vec3 random_in_unit_disk() {
    vec3 p;
    do {
        p = 2.0*vec3((rand() % (100) / (float)(100)), (rand() % (100) / (float)(100)), 0) - vec3(1, 1, 0);
    } while (dot(p, p) >= 1.0);
    return p;
}

// add time to construct ray
ray camera::get_ray(float s, float t) {
    vec3 rd = lens_radius*random_in_unit_disk();
    vec3 offset = u * rd.x() + v * rd.y();
	float time = time0 + (rand() % (100) / (float)(100)) * (time1 - time0);
    return ray(
		origin + offset, 
		lower_left_corner + s*horizontal + t*vertical - origin - offset,
		time);
}
