#ifndef DIELECTRIC_H
#define DIELECTRIC_H

#include "material.h"
#include "metal.h"

bool refract(const vec3& v, const vec3& n, float ni_over_nt, vec3& refracted);

float schlick(float cosine, float ref_idx);

class dielectric : public material {
public:
    dielectric(const vec3& a, float ri) : albedo(a), ref_idx(ri) {}
    
    virtual bool scatter(const ray& r_in, const hit_record& rec, vec3& attenuation, ray& scattered) const;

    vec3 albedo;
    float ref_idx;
};
#endif // DIELECTRIC_H
