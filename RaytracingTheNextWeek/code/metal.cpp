#include "metal.h"

 bool metal::scatter(const ray& r_in, const hit_record& rec, vec3& attenuation, ray& scattered) const {
     vec3 reflected = reflect(unit_vector(r_in.direction()), rec.normal);
     scattered = ray(rec.p, reflected + fuzz * random_in_unit_sphere(), r_in.time());
     attenuation = albedo;
     return (dot(scattered.direction(), rec.normal) >= 0); // >=
 }
