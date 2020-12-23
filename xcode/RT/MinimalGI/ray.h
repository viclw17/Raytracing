//
//  ray.h
//  MinimalGI
//
//  Created by Wei Li on 2020-12-21.
//

#ifndef ray_h
#define ray_h

#include "vec3.h"

class Ray{
public:
    Ray();
    Ray(const Vec3f &o, const Vec3f &d) : o(o), d(d){};
    
    Vec3f o,d;
};


#endif /* ray_h */
