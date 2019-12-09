#ifndef HITABLELIST_H
#define HITABLELIST_H

#include "hitable.h"

/* : public hitable表示hitable_list继承hitable。即：sphere为hitable的子类 */
class hitable_list : public hitable{
public:
    hitable_list() {}
    hitable_list(hitable **l, int n) {list = l; list_size = n;}
    bool virtual hit(const ray& r, float t_min, float t_max, hit_record& rec) const;

    hitable **list;
    int list_size;
};
#endif // HITABLELIST_H
