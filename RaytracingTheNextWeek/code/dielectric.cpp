#include "dielectric.h"

float schlick(float cosine, float ref_idx) {
    float r0 = (1 - ref_idx) / (1 + ref_idx); // ref_idx = n2/n1
    r0 = r0 * r0;
    return r0 + (1 - r0) * pow((1 - cosine), 5);
}

bool dielectric::scatter(const ray& r_in, const hit_record& rec, vec3& attenuation, ray& scattered) const{
    
    attenuation = albedo;
    
    vec3 outward_normal;
    vec3 reflected = reflect(r_in.direction(), rec.normal);
    vec3 refracted;
    
    float ni_over_nt;
    float reflect_prob;
    float cosine;
    
    // when ray shoot through object back into vacuum,
    // ni_over_nt = ref_idx, surface normal has to be inverted.
    if (dot(r_in.direction(), rec.normal) > 0){
        outward_normal = -rec.normal;
        ni_over_nt = ref_idx;
        cosine = dot(unit_vector(r_in.direction()), rec.normal);
    }
    // when ray shoots into object,
    // ni_over_nt = 1 / ref_idx.
    else{
        outward_normal = rec.normal;
        ni_over_nt = 1.0 / ref_idx;
        cosine = -dot(unit_vector(r_in.direction()), rec.normal);
    }

    // refracted ray exists
    if(refract(r_in.direction(), outward_normal, ni_over_nt, refracted)){
        reflect_prob = schlick(cosine, ref_idx);
    }
    // refracted ray does not exist
    else{
        // total reflection
        reflect_prob = 1.0;
    }
    
    if(rand() % (100) / (float)(100) < reflect_prob) { // xcode: drand48()
        scattered = ray(rec.p, reflected, r_in.time());
    }
    else {
        scattered = ray(rec.p, refracted, r_in.time());
    }
    
    return true;
}
