#ifndef LAMBERTIAN_H
#define LAMBERTIAN_H

#include "material.h"

vec3 random_in_unit_sphere() {
    vec3 p;
    do{
		float random = rand() % (100) / (float)(100); // drand48()
        p = 2.0*vec3(random, random, random) - vec3(1,1,1);
    } while (p.squared_length() >= 1.0);
    return p;
}

class lambertian : public material {
public:
    lambertian(const vec3& a) : albedo(a) {} // init with color

    // pass in:
    // incident ray ref./hit record ref./attenuation color ref./scattered ray ref.
    virtual bool scatter(const ray& r_in, const hit_record& rec, vec3& attenuation, ray& scattered) const {
        vec3 target = rec.p + rec.normal + random_in_unit_sphere();
        scattered = ray(rec.p, target - rec.p);
        attenuation = albedo;
        return true;
    }

    vec3 albedo;
};

#endif // LAMBERTIAN_H
