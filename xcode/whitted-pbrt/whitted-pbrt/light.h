//
//  Light.h
//  whitted-pbrt
//
//  Created by Wei Li on 2020-12-24.
//

#ifndef Light_h
#define Light_h

#include "pbrt.h"

class Light
{
public:
    Light(const Vec3f &p, const Vec3f &i) : position(p), intensity(i) {}
    Vec3f position;
    Vec3f intensity;
    
};



#endif /* Light_h */
