#ifndef SPHERE_H
#define SPHERE_H

#include "hitable.h"
#include "material.h"

#include <math.h> // M_PI

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

/* : public hitable表示sphere继承hitable。即：sphere为hitable的子类 */
class sphere : public hitable {
public:
    sphere() {}
    /* 此处为使用 初始化列表(initializer list) 的构造函数来初始化成员变量*/
    sphere(vec3 cen, float r, material *m) : center(cen), radius(r), ma(m) {}

	// utility function
	void get_sphere_uv(const vec3& p, float& u, float& v);

    /* 必须实现父类的虚函数。在此出声明，后续在sphere.cpp中具体实现 */
    bool virtual hit(const ray& r, float t_min, float t_max, hit_record& rec) const;
	bool virtual bounding_box(float t0, float t1, aabb& box) const;

    vec3 center;
    float radius;
    material *ma;
};
#endif // SPHERE_H
