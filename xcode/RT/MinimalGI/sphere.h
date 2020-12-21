//
//  sphere.h
//  MinimalGI
//
//  Created by Wei Li on 2020-12-21.
//

#ifndef sphere_h
#define sphere_h

//#include "math.h"
//#include "vec3.h"
#include "object.h"

// [comment]
// Sphere class. A sphere type object
// [/comment]
class Sphere : public Object
{
public:
    Sphere(const Matrix44f &o2w, const float &r) : Object(o2w), radius(r), radius2(r *r)
    { o2w.multVecMatrix(Vec3f(0), center); }
    // [comment]
    // Ray-sphere intersection test
    // [/comment]
    bool intersect(
        const Vec3f &orig,
        const Vec3f &dir,
        float &tNear,
        uint32_t &triIndex, // not used for sphere
        Vec2f &uv) const    // not used for sphere
    {
        float t0, t1; // solutions for t if the ray intersects
        // analytic solution
        Vec3f L = orig - center;
        float a = dir.dotProduct(dir);
        float b = 2 * dir.dotProduct(L);
        float c = L.dotProduct(L) - radius2;
        if (!solveQuadratic(a, b, c, t0, t1)) return false;

        if (t0 > t1) std::swap(t0, t1);

        if (t0 < 0) {
            t0 = t1; // if t0 is negative, let's use t1 instead
            if (t0 < 0) return false; // both t0 and t1 are negative
        }

        tNear = t0;

        return true;
    }
    // [comment]
    // Set surface data such as normal and texture coordinates at a given point on the surface
    // [/comment]
    void getSurfaceProperties(
        const Vec3f &hitPoint,
        const Vec3f &viewDirection,
        const uint32_t &triIndex,
        const Vec2f &uv,
        Vec3f &hitNormal,
        Vec2f &hitTextureCoordinates) const
    {
        hitNormal = hitPoint - center;
        hitNormal.normalize();
        // In this particular case, the normal is simular to a point on a unit sphere
        // centred around the origin. We can thus use the normal coordinates to compute
        // the spherical coordinates of Phit.
        // atan2 returns a value in the range [-pi, pi] and we need to remap it to range [0, 1]
        // acosf returns a value in the range [0, pi] and we also need to remap it to the range [0, 1]
//        hitTextureCoordinates.x = (1 + atan2(hitNormal.z, hitNormal.x) / M_PI) * 0.5;
//        hitTextureCoordinates.y = acosf(hitNormal.y) / M_PI;
    }
    float radius, radius2;
    Vec3f center;
};



#endif /* sphere_h */
