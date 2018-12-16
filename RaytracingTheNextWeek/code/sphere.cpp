#include "sphere.h"

// 实现父类的虚函数
 bool sphere::hit(const ray& r, float t_min, float t_max, hit_record& rec) const {
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
             rec.mat_ptr = ma; // material
             return true;
         }
         temp = (-b + sqrt(discriminant)) / (2.0*a); // 大根
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

 bool sphere::bounding_box(float t0, float t1, aabb& box) const {
	 box = aabb(center - vec3(radius, radius, radius), center + vec3(radius, radius, radius));
	 return true;
 }