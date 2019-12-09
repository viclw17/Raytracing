#include "lambertian.h"
// http://www.cplusplus.com/reference/cstdlib/rand/
// v1 = rand() % 100;         // v1 in the range 0 to 99
// v2 = rand() % 100 + 1;     // v2 in the range 1 to 100
// v3 = rand() % 30 + 1985;   // v3 in the range 1985-2014
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
