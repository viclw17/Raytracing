#include "lambertian.h"

 vec3 random_in_unit_sphere(){
     vec3 p;
     do{
		 vec3 random_vector = vec3(
			 rand() % (100) / (float)(100), // xcode: drand48()
			 rand() % (100) / (float)(100),
			 rand() % (100) / (float)(100));
		 p = 2.0 * random_vector - vec3(1, 1, 1);
     } while (p.squared_length() >= 1.0);
     return p;
 }

 bool lambertian::scatter(const ray& r_in, const hit_record& rec, vec3& attenuation, ray& scattered) const {
     vec3 target = rec.p + rec.normal + random_in_unit_sphere();
     scattered = ray(rec.p, target - rec.p);
     attenuation = albedo;
     return true;
 }
