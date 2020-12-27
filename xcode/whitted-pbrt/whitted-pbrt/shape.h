//
//  shape.h
//  whitted-pbrt
//
//  Created by Wei Li on 2020-12-24.
//

#ifndef shape_h
#define shape_h

#include "material.h"
#include "geometry.h"
#include "interaction.h"

class Shape
{
 public:
    Shape() :
        materialType(DIFFUSE_AND_GLOSSY),ior(1.3), Kd(0.8), Ks(0.2), diffuseColor(0.2), specularExponent(25) {}
    virtual ~Shape() {}
    
//    virtual bool intersect(const Ray &, float &, uint32_t &, Vec2f &) const = 0;
    virtual bool intersect(const Ray &, float &, SurfaceInteraction *isect) const = 0;
//    virtual void getSurfaceProperties(const Vec3f &, const Vec3f &, const uint32_t &, const Vec2f &, Vec3f &, Vec2f &) const = 0;
//    virtual void getSurfaceProperties(const Vec3f &point, Vec3f &N) const = 0;
//    virtual Vec3f evalDiffuseColor(const Vec2f &) const { return diffuseColor; }
    virtual Vec3f evalDiffuseColor() const { return diffuseColor; }

    
    // material properties
    MaterialType materialType;
    float ior;
    float Kd, Ks;
    Vec3f diffuseColor;
    float specularExponent;
};

bool solveQuadratic(const float &a, const float &b, const float &c, float &x0, float &x1)
{
    float discr = b * b - 4 * a * c;
    if (discr < 0) return false;
    else if (discr == 0) x0 = x1 = - 0.5 * b / a;
    else {
        float q = (b > 0) ?
            -0.5 * (b + sqrt(discr)) :
            -0.5 * (b - sqrt(discr));
        x0 = q / a;
        x1 = c / q;
    }
    if (x0 > x1) std::swap(x0, x1);
    return true;
}

class Sphere : public Shape{
public:
    Sphere(const Vec3f &c, const float &r) : center(c), radius(r), radius2(r * r) {}
    
    bool intersect(const Ray &ray, float &tnear, SurfaceInteraction *isect) const{
        // analytic solution
        Vec3f L = ray.orig - center;
        float a = dotProduct(ray.dir, ray.dir);
        float b = 2 * dotProduct(ray.dir, L);
        float c = dotProduct(L, L) - radius2;
        float t0, t1;
        if (!solveQuadratic(a, b, c, t0, t1)) return false;
        if (t0 < 0) t0 = t1;
        if (t0 < 0) return false;
        
        tnear = t0;
        
        Vec3f hitPoint = ray.orig + ray.dir * tnear;
        Vec3f normal = normalize(hitPoint- center);
        Vec3f wo = Vec3f(0);
        *isect = SurfaceInteraction(hitPoint, normal, wo);

        return true;
    }
    
//    void getSurfaceProperties(const Vec3f &P, Vec3f &N) const
//    { N = normalize(P - center); }

    Vec3f center;
    float radius, radius2;
    
};

#endif /* shape_h */
