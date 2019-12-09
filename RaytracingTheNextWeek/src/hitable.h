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
#endif // HITABLE_H
