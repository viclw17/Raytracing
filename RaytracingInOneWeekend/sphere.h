#ifndef SPHEREH
#define SPHEREH

#include "hitable.h"
#include "material.h"

/* : public hitable表示sphere继承hitable。即：sphere为hitable的子类 */
class sphere : public hitable {
public:
    sphere() {}
    /* 此处为使用 初始化列表(initializer list) 的构造函数来初始化成员变量*/
    sphere(vec3 cen, float r, material *m) : center(cen), radius(r), ma(m) {}// ;???

    /* 必须实现父类的虚函数。在此出声明，后续在sphere.cpp中具体实现 */
    // bool virtual hit(const ray& r, float t_min, float t_max, hit_record& rec) const;
    bool virtual hit(const ray& r, float t_min, float t_max, hit_record& rec) const {
        vec3 oc = r.origin() - center; // A-C
        float a = dot(r.direction(), r.direction());
        float b = 2.0 * dot(oc, r.direction());
        float c = dot(oc,oc) - radius*radius;
        float discriminant = b*b - 4*a*c;
        /*
        判断小根和大根是否在范围内。
        首先判断小根是否在范围内。
        是：保存相关信息，然后直接返回；
        否，判断大根是否在范围内。
        也就是优先选小根，小根不行再考虑大根
        */
        if(discriminant > 0) {
            float temp = (-b - sqrt(discriminant)) / (2.0*a); // 小根
            if(temp < t_max && temp > t_min){
                rec.t = temp;
                rec.p = r.point_at_parameter(rec.t);
                rec.normal = (rec.p - center) / radius;
                rec.mat_ptr = ma;
                return true;
            }
            temp = (-b + sqrt(discriminant)) / (2.0*a);
            if(temp < t_max && temp > t_min) {
                rec.t = temp;
                rec.p = r.point_at_parameter(rec.t);
                rec.normal = (rec.p - center) / radius;
                rec.mat_ptr = ma;
                return true;
            }
        }
        return false;
    }

    // Sphere class 成员变量
    vec3 center;
    float radius;
    material *ma;
};
#endif
