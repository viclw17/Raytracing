//
//  camera.h
//  whitted-pbrt
//
//  Created by Wei Li on 2020-12-24.
//

#ifndef camera_h
#define camera_h

#include "geometry.h"

struct Options{
    uint32_t width;
    uint32_t height;
    float fov;
    float imageAspectRatio;
    uint8_t maxDepth;
    Vec3f backgroundColor;
    float bias;
};

class Camera{
public:
    Options options;
    Ray GenerateRay(int i, int j);
};


Ray Camera::GenerateRay(int i, int j){
    float scale = tan(deg2rad(options.fov * 0.5));
    float imageAspectRatio = options.width / (float)options.height;
    Vec3f orig(0);
    
    // generate primary ray direction
    float x = (2 * (i + 0.5) / (float)options.width - 1) * imageAspectRatio * scale;
    float y = (1 - 2 * (j + 0.5) / (float)options.height) * scale;
    
    Vec3f dir = normalize(Vec3f(x, y, -1));
    Ray ray(orig, dir);
    return ray;
}

#endif /* camera_h */
