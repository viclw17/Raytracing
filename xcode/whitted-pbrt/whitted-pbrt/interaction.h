//
//  interaction.h
//  whitted-pbrt
//
//  Created by Wei Li on 2020-12-25.
//

#ifndef interaction_h
#define interaction_h

#include "geometry.h"

class Interaction{
public:
    Interaction(){}
    Interaction(const Vec3f &p, const Vec3f &n, const Vec3f &wo) : p(p),wo(wo),n(n){}
//    Ray SpawnRay(const Vec3f &d) const {
//            Vec3f o = p;
//            return Ray(o, d);
//        }
    Vec3f p;
    Vec3f n;
    Vec3f wo;
};

class SurfaceInteraction{//} : public Interaction{
public:
    SurfaceInteraction() {}
//    SurfaceInteraction(const Vec3f &p, const Vec3f &n, const Vec3f &wo) : Interaction(p,wo,n){}
    SurfaceInteraction(const Vec3f &p, const Vec3f &n, const Vec3f &wo) : p(p),wo(wo),n(n){}
    Vec3f p;
    Vec3f n;
    Vec3f wo;
};

#endif /* interaction_h */
