#ifndef LAMBERTIAN_H
#define LAMBERTIAN_H

#include "material.h"

vec3 random_in_unit_sphere();

class lambertian : public material {
public:
    lambertian(const vec3& a) : albedo(a) {} // init with color
    
    // pass in: incident ray ref./hit record ref./attenuation color ref./scattered ray ref.
    //
    virtual bool scatter(const ray& r_in,
                         const hit_record& rec,
                         vec3& attenuation,
                         ray& scattered) const;

    vec3 albedo;
};

#endif // LAMBERTIAN_H
