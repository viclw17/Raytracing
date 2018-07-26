#ifndef LAMBERTIAN_H
#define LAMBERTIAN_H

#include "material.h"

class lambertian : public material {
public:
    lambertian(const vec3& a) : albedo(a) {}

    // make it const!
    vec3 random_in_unit_sphere() const {
        vec3 p;
        do {
            p = 2.0*vec3((rand()%(100)/(float)(100)),
                        (rand()%(100)/(float)(100)),
                        (rand()%(100)/(float)(100)))
                - vec3(1,1,1);
        } while (p.squared_length() >= 1.0);
        return p;
    }

    // virtual bool scatter(const ray& r_in, const hit_record& rec, vec3& attenuation, ray& scattered) const;

    virtual bool scatter(const ray& r_in, const hit_record& rec, vec3& attenuation, ray& scattered) const {
        vec3 target = rec.p + rec.normal + random_in_unit_sphere();
        scattered = ray(rec.p, target - rec.p);
        attenuation = albedo;
        return true;
    }

    vec3 albedo;
};

#endif // LAMBERTIAN_H
