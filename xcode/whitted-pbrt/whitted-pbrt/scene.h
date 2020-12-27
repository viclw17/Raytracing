//
//  scene.h
//  whitted-pbrt
//
//  Created by Wei Li on 2020-12-24.
//

#ifndef scene_h
#define scene_h

#include "pbrt.h"
#include "shape.h"
#include "light.h"
#include "material.h"
#include "interaction.h"

class Scene{
    
public:
//    Scene(std::vector<std::unique_ptr<Shape>> &o, std::vector<std::unique_ptr<Light>> &l) :
//    objects(o),lights(l){}
    
    bool Intersect(const Ray &ray, float &tNear, SurfaceInteraction *isect, Shape **hitObject) const;
    bool IntersectL(const Ray &ray, float &tNear, SurfaceInteraction *isect, Shape **hitObject) const;


    
    std::vector<std::unique_ptr<Shape>> objects;
    
    std::vector<std::unique_ptr<Light>> lights;
    
    
};

bool Scene::Intersect(const Ray &ray, float &tNear, SurfaceInteraction *isect, Shape **hitObject) const {
    *hitObject = nullptr;
    float tNearK = kInfinity;

    for (uint32_t k = 0; k < objects.size(); k++) {
        if (objects[k]->intersect(ray, tNearK, isect) && tNearK < tNear) {
            *hitObject = objects[k].get();
            tNear = tNearK;

        }
    }
    return (*hitObject != nullptr);
}

bool Scene::IntersectL(const Ray &ray, float &tNear, SurfaceInteraction *isect, Shape **hitObject) const {
    *hitObject = nullptr;
    float tNearK = kInfinity;

    for (uint32_t k = 0; k < objects.size(); k++) {
        if (objects[k]->intersect(ray, tNearK, isect) && tNearK < tNear) {
            *hitObject = objects[k].get();
            tNear = tNearK;

        }
    }
    return (*hitObject != nullptr);
}
    

#endif /* scene_h */
