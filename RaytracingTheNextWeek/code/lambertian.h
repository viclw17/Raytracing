#ifndef LAMBERTIAN_H
#define LAMBERTIAN_H

#include "material.h"

class lambertian : public material {
public:
    //lambertian(const vec3& a) : albedo(a) {} // old, init with color
	// Now we can make textured materials by replacing the vec3 color with a texture pointer
	lambertian(texture *a) :albedo(a) {}

    virtual bool scatter(const ray& r_in, const hit_record& rec, vec3& attenuation, ray& scattered) const;
	// 1. const ray& r_in, const hit_record& rec ???
	// passing by const reference
	// This option would be good if you wanted to inspect the value in the function 
	// without copying it AND without mutating it.

	// 2. const virtual function???
	// const has nothing to do with virtual, here just means this is a const (virtual) member function!

    //vec3 albedo;
	texture *albedo;
};

#endif // LAMBERTIAN_H
