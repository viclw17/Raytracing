#ifndef HITABLELIST_H
#define HITABLELIST_H

#include "hitable.h"

class hitable_list : public hitable{
public:
    hitable_list() {}
    hitable_list(hitable **l, int n) {
        list = l;
        list_size = n;
    }

    bool virtual hit(const ray& r, float t_min, float t_max, hit_record& rec) const;
	bool virtual bounding_box(float t0, float t1, aabb& box) const;

    hitable **list; // list is a pointer to pointer to hitable object
    int list_size;
};
#endif // HITABLELIST_H

