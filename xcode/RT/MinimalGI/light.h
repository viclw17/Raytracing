//
//  light.h
//  MinimalGI
//
//  Created by Wei Li on 2020-12-21.
//

#ifndef light_h
#define light_h

//#include "math.h"
#include "vec3.h"

// Light base class
class Light{
public:
    Light(const Matrix44f &l2w, const Vec3f &c = 1, const float &i = 1) : lightToWorld(l2w), color(c), intensity(i) {}
    virtual ~Light() {}
    virtual void illuminate(const Vec3f &P, Vec3f &, Vec3f &, float &) const = 0;
    
    Vec3f color;
    float intensity;
    Matrix44f lightToWorld;
};


// Distant light
class DistantLight : public Light{
    Vec3f dir;
public:
    DistantLight(const Matrix44f &l2w, const Vec3f &c = 1, const float &i = 1) : Light(l2w, c, i){
        l2w.multDirMatrix(Vec3f(0, 0, -1), dir);
        dir.normalize(); // in case the matrix scales the light
    }
    
    void illuminate(const Vec3f &P, Vec3f &lightDir, Vec3f &lightIntensity, float &distance) const{
        lightDir = dir;
        lightIntensity = color * intensity;
        distance = kInfinity;
    }
};

#endif /* light_h */
