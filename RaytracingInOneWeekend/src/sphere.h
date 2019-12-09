#ifndef SPHERE_H
#define SPHERE_H

#include "hitable.h"
#include "material.h"

using namespace std;
/* : public hitable表示sphere继承hitable。即：sphere为hitable的子类 */
class sphere : public hitable {
public:
    sphere() {}
    /* 此处为使用 初始化列表(initializer list) 的构造函数来初始化成员变量*/
    sphere(vec3 cen, float r, material *m) : center(cen), radius(r), ma(m) {}
    /* 必须实现父类的虚函数。在此出声明，后续在sphere.cpp中具体实现 */
    bool virtual hit(const ray& r, float t_min, float t_max, hit_record& rec) const;

    vec3 center;
    float radius;
    material *ma;
};
#endif // SPHERE_H
