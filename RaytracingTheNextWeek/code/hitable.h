#ifndef HITABLE_H
#define HITABLE_H

#include "ray.h"

class material;

/* 该结构体记录“撞点”处的信息：离光线起点的距离t、撞点的坐标向量p、撞点出的法向量normal。 */
struct hit_record{
    float t;
    vec3 p;
    vec3 normal;
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
};

#endif // HITABLE_H
