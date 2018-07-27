#ifndef HITABLELISTH
#define HITABLELISTH

#include "hitable.h"

/* : public hitable表示hitable_list继承hitable。即：sphere为hitable的子类 */
class hitable_list : public hitable{
public:
    hitable_list() {}
    /* hitable_list是所有能够被光线撞击的物体的列表/集合 */
    hitable_list(hitable **l, int n) {
        list = l;
        list_size = n;
    }

    // bool virtual hit(const ray& r, float t_min, float t_max, hit_record& rec) const;
    bool virtual hit(const ray& r, float t_min, float t_max, hit_record& rec) const {
        hit_record temp_rec;
        bool hit_anything = false;
        double closest_so_far = t_max;
        for(int i = 0; i < list_size; i++){ // list of hitable对象
            if(list[i]->hit(r, t_min, closest_so_far, temp_rec)){
                hit_anything = true;
                closest_so_far = temp_rec.t;
                rec = temp_rec;
            }
        }
        return hit_anything;
        return true;
    }

    hitable **list;
    int list_size;
};
#endif
