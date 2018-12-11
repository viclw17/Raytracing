#ifndef MOVING_SPHERE_H
#define MOVING_SPHERE_H

#include "hitable.h"
#include "material.h"

class moving_sphere : public hitable {
public:
	moving_sphere() {}

	moving_sphere(vec3 cen0, vec3 cen1, float t0, float t1, float r, material *m) : 
		center0(cen0), center1(cen1), time0(t0), time1(t1), radius(r), mat_ptr(m) {};
	
	bool virtual hit(const ray& r, float tmin, float tmax, hit_record& rec) const;
	
	vec3 center(float time) const;

	vec3 center0, center1;
	float time0, time1;
	float radius;
	material *mat_ptr;
};

vec3 moving_sphere::center(float time) const {
	return center0 + ((time - time0) / (time1 - time0))*(center1 - center0);
}

// replace center with center(r.time())
bool moving_sphere::hit(const ray& r, float t_min, float t_max, hit_record& rec) const {
	vec3 oc = r.origin() - center(r.time()); // A-C
	float a = dot(r.direction(), r.direction());
	float b = 2.0 * dot(oc, r.direction());
	float c = dot(oc, oc) - radius * radius;
	float discriminant = b * b - 4 * a*c;
	/*
	 判断小根和大根是否在范围内。
	 首先判断小根是否在范围内。
	 是：保存相关信息，然后直接返回；
	 否，判断大根是否在范围内。
	 也就是优先选小根，小根不行再考虑大根
	 */
	if (discriminant > 0) {
		float temp = (-b - sqrt(discriminant)) / (2.0*a); // 小根
		if (temp < t_max && temp > t_min) {
			rec.t = temp;
			rec.p = r.point_at_parameter(rec.t);
			rec.normal = (rec.p - center(r.time())) / radius;
			rec.mat_ptr = mat_ptr; // material
			return true;
		}
		temp = (-b + sqrt(discriminant)) / (2.0*a); // 大根
		if (temp < t_max && temp > t_min) {
			rec.t = temp;
			rec.p = r.point_at_parameter(rec.t);
			rec.normal = (rec.p - center(r.time())) / radius;
			rec.mat_ptr = mat_ptr;
			return true;
		}
	}
	return false;
}

#endif MOVING_SPHERE_H