//
//  ray.h
//  montelight
//
//  Created by Wei Li on 2020-12-20.
//

#ifndef ray_h
#define ray_h

#include "vector.h"

struct Ray {
  Vector origin, direction;
  Ray(const Vector &o_, const Vector &d_) : origin(o_), direction(d_) {}
};

#endif /* ray_h */
