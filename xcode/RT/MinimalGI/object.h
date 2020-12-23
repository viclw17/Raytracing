//
//  object.h
//  MinimalGI
//
//  Created by Wei Li on 2020-12-21.
//

#ifndef object_h
#define object_h

//#include "math.h"
//#include "vec3.h"

enum MaterialType { kDiffuse };


class Object{
 public:
    // Setting up the object-to-world and world-to-object matrix
    Object(const Matrix44f &o2w) : objectToWorld(o2w), worldToObject(o2w.inverse()) {}
    virtual ~Object() {}
    virtual bool intersect(const Vec3f &, const Vec3f &, float &, uint32_t &, Vec2f &) const = 0;
    virtual void getSurfaceProperties(const Vec3f &, const Vec3f &, const uint32_t &, const Vec2f &, Vec3f &, Vec2f &) const = 0;
    
    Matrix44f objectToWorld, worldToObject;
    MaterialType type = kDiffuse;
    Vec3f albedo = 0.18;
    float Kd = 0.8; // phong model diffuse weight
    float Ks = 0.2; // phong model specular weight
    float n = 10;   // phong specular exponent
};




#endif /* object_h */
