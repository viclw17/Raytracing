
#ifndef MATERIAL_H
#define MATERIAL_H

#include "hitable.h"
#include "texture.h"

static vec3 reflect(const vec3& v, const vec3& n) {
	return v - 2 * dot(v, n)*n;
}

static bool refract(const vec3& v, const vec3& n, float ni_over_nt, vec3& refracted) {
	vec3 uv = unit_vector(v);
	float dt = dot(uv, n);
	float discriminat = 1.0 - ni_over_nt * ni_over_nt * (1 - dt * dt);
	if (discriminat > 0) {
		refracted = ni_over_nt * (uv - n * dt) - n * sqrt(discriminat);
		return true;
	}
	else
		return false;
}

static vec3 random_in_unit_sphere(){
	vec3 p;
	do {
		vec3 random_vector = vec3(
			rand() % (100) / (float)(100), // xcode: drand48()
			rand() % (100) / (float)(100),
			rand() % (100) / (float)(100));
		p = 2.0 * random_vector - vec3(1, 1, 1);
	} while (p.squared_length() >= 1.0);
	return p;
}

class material {
public:
	virtual bool scatter(const ray& r_in, const hit_record& rec, vec3& attenuation, ray& scattered) const = 0;

	virtual vec3 emitted(float u, float v, const vec3& p) const { 
		return vec3(0,0,0); 
	}

};

#endif // MATERIAL_H
