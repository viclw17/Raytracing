#ifndef HITABLE_H
#define HITABLE_H

#include "aabb.h"
//#include <math.h> // M_PI
#include <float.h>

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

class material;

// Record info at hit point.
struct hit_record{
    float t;		// hit point distance parameter for ray
    vec3 p;			// hit point position info, calculated with rec.p = r.point_at_parameter(rec.t);
    vec3 normal;	// hit point normal info for shading
	float u, v;		// uv info for image texturing
    material *mat_ptr;
};

/* hitable这个类表示能够被光线撞上的任何物体。比如球体 */
// The "hitable" abstract class. It has a hit function that takes in a ray, tmin and tmax, and a hit_record structure(a bundle) reference.
class hitable{
public:
    /*
    hit()在此被声明为虚函数，则hitable为抽象类。抽象类的子类中_必须_实现其虚函数。
    纯虚函数是在基类中声明的虚函数，它在基类中没有定义，但要求任何派生类都要定义自己的实现方法。
    在基类中实现纯虚函数的方法是在函数原型后加“=0”
    含有纯虚拟函数的类称为抽象类，它不能生成对象。
    */
    virtual bool hit(const ray& r, float t_min, float t_max, hit_record& rec) const = 0;
	virtual bool bounding_box(float t0, float t1, aabb& box) const = 0;
};

// Utility function.
// Calculate uv on sphere.
static void get_sphere_uv(const vec3& p, float& u, float& v) {
	float phi = atan2(p.z(), p.x());
	float theta = asin(p.y());
	u = 1 - (phi + M_PI) / (2 * M_PI);
	v = (theta + M_PI / 2) / M_PI;
}

// Flip normal of the given hitable object.
class flip_normals : public hitable {
public:
	flip_normals(hitable *p) : ptr(p) {}
	virtual bool hit(const ray& r, float t_min, float t_max, hit_record& rec) const {
		if (ptr->hit(r, t_min, t_max, rec)) {
			rec.normal = -rec.normal;
			return true;
		}
		else
			return false;
	}
	virtual bool bounding_box(float t0, float t1, aabb& box) const {
		return ptr->bounding_box(t0, t1, box);
	}
	hitable *ptr;
};

/*
class translate : public hitable {
public:
	translate(hitable* p, const vec3& displacement) : ptr(p), offset(displacement) {}
	virtual bool hit(const ray& r, float t_min, float t_max, hit_record& rec) const;
	virtual bool bounding_box(float t0, float t1, aabb& box) const;
	hitable* ptr;
	vec3 offset;
};

bool translate::hit(const ray& r, float t_min, float t_max, hit_record& rec) const {
	ray moved_r(r.origin() - offset, r.direction(), r.time());
	if (ptr->hit(moved_r, t_min, t_max, rec)) {
		rec.p += offset;
		return true;
	}
	else
		return false;
}

bool translate::bounding_box(float t0, float t1, aabb& box) const {
	if (ptr->bounding_box(t0, t1, box)) {
		box = aabb(box.min() + offset, box.max() + offset);
		return true;
	}
	else
		return false;
}
*/

/*
class rotate_y : public hitable {
public:
	rotate_y(hitable* p, float angle);

	virtual bool hit(const ray& r, float t_min, float t_max, hit_record& rec) const;

	virtual bool bounding_box(float t0, float t1, aabb& box) const {
		box = bbox; return hasbox;
	}

	hitable* ptr;
	float sin_theta;
	float cos_theta;
	bool hasbox;
	aabb bbox;
};

rotate_y::rotate_y(hitable *p, float angle) : ptr(p) {
	float radians = (M_PI / 180.) * angle;

	sin_theta = sin(radians);
	cos_theta = cos(radians);

	hasbox = ptr->bounding_box(0, 1, bbox);

	vec3 min(FLT_MAX, FLT_MAX, FLT_MAX);
	vec3 max(-FLT_MAX, -FLT_MAX, -FLT_MAX);

	for (int i = 0; i < 2; i++) {
		for (int j = 0; j < 2; j++) {
			for (int k = 0; k < 2; k++) {
				float x = i * bbox.max().x() + (1 - i) * bbox.min().x();
				float y = j * bbox.max().y() + (1 - j) * bbox.min().y();
				float z = k * bbox.max().z() + (1 - k) * bbox.min().z();
				float newx = cos_theta * x + sin_theta * z;
				float newz = -sin_theta * x + cos_theta * z;
				vec3 tester(newx, y, newz);
				for (int c = 0; c < 3; c++)
				{
					if (tester[c] > max[c])
						max[c] = tester[c];
					if (tester[c] < min[c])
						min[c] = tester[c];
				}
			}
		}
	}
	bbox = aabb(min, max);
}

bool rotate_y::hit(const ray& r, float t_min, float t_max, hit_record& rec) const {
	vec3 origin = r.origin();
	vec3 direction = r.direction();

	origin[0] = cos_theta * r.origin()[0] - sin_theta * r.origin()[2];
	origin[2] = sin_theta * r.origin()[0] + cos_theta * r.origin()[2];

	direction[0] = cos_theta * r.direction()[0] - sin_theta * r.direction()[2];
	direction[2] = sin_theta * r.direction()[0] + cos_theta * r.direction()[2];

	ray rotated_r(origin, direction, r.time());

	if (ptr->hit(rotated_r, t_min, t_max, rec)) {
		vec3 p = rec.p;
		vec3 normal = rec.normal;
		p[0] = cos_theta * rec.p[0] + sin_theta * rec.p[2];
		p[2] = -sin_theta * rec.p[0] + cos_theta * rec.p[2];
		normal[0] = cos_theta * rec.normal[0] + sin_theta * rec.normal[2];
		normal[2] = -sin_theta * rec.normal[0] + cos_theta * rec.normal[2];
		rec.p = p;
		rec.normal = normal;
		return true;
	}
	else
		return false;
}*/

#endif // HITABLE_H
