//
//  integrator.h
//  whitted-pbrt
//
//  Created by Wei Li on 2020-12-24.
//

#ifndef integrator_h
#define integrator_h

#include "camera.h"
#include "interaction.h"

using namespace std;

class Integrator{
public:
    Integrator(Camera &cam) : camera(cam){}
    void render(const Scene &scene);
    Vec3f castRay(const Ray &ray,
                  const Scene &scene,
                  uint32_t depth,
                  bool test = false);
    
    
    Camera camera;
};


void Integrator::render(const Scene &scene)
{
    Vec3f *framebuffer = new Vec3f[camera.options.width * camera.options.height];
    Vec3f *pix = framebuffer;
        
//    for (uint32_t j = 0; j < camera.options.height; ++j) {
//        for (uint32_t i = 0; i < camera.options.width; ++i) {
    int i = camera.options.width/2;
    int j = camera.options.height/3;
            Ray ray = camera.GenerateRay(i,j);
            
            *(pix++) = castRay(ray, scene, 0);
//        }
//    }

    // save framebuffer to file
    std::ofstream ofs;
    ofs.open("./out.ppm");
    ofs << "P6\n" << camera.options.width << " " << camera.options.height << "\n255\n";
    for (uint32_t i = 0; i < camera.options.height * camera.options.width; ++i) {
        char r = (char)(255 * clamp(0, 1, framebuffer[i].x));
        char g = (char)(255 * clamp(0, 1, framebuffer[i].y));
        char b = (char)(255 * clamp(0, 1, framebuffer[i].z));
        ofs << r << g << b;
    }

    ofs.close();

    delete [] framebuffer;
}


Vec3f Integrator::castRay(const Ray &ray, const Scene &scene, uint32_t depth, bool test)
{
    if (depth > camera.options.maxDepth) {
        return camera.options.backgroundColor;
    }
    
    Vec3f hitColor = camera.options.backgroundColor;
    float tnear = kInfinity;
  
    Shape *hitObject = nullptr;
    SurfaceInteraction isect;
    SurfaceInteraction isectL;

    
    Vec3f lightAmt = Vec3f(0);
    if (scene.Intersect(ray, tnear, &isect, &hitObject)) {
        Vec3f dir = ray.dir;
        Vec3f hitPoint = isect.p;
        Vec3f N = isect.n;
        
//        hitObject->getSurfaceProperties(hitPoint,N);

//        switch (hitObject->materialType) {
//            case REFLECTION_AND_REFRACTION:
//            {
//                Vec3f reflectionDirection = normalize(reflect(dir, N));
//                Vec3f refractionDirection = normalize(refract(dir, N, hitObject->ior));
//                Vec3f reflectionRayOrig = (dotProduct(reflectionDirection, N) < 0) ?
//                    hitPoint - N * camera.options.bias :
//                    hitPoint + N * camera.options.bias;
//                Vec3f refractionRayOrig = (dotProduct(refractionDirection, N) < 0) ?
//                    hitPoint - N * camera.options.bias :
//                    hitPoint + N * camera.options.bias;
//                Ray reflectRay = Ray(reflectionRayOrig, reflectionDirection);
//                Ray refractRay = Ray(refractionRayOrig, refractionDirection);
//
//                Vec3f reflectionColor = castRay(reflectRay, scene, depth + 1, 1);
//                Vec3f refractionColor = castRay(refractRay, scene, depth + 1, 1);
//
//                float kr;
//                fresnel(dir, N, hitObject->ior, kr);
//                hitColor = reflectionColor * kr + refractionColor * (1 - kr);
//                break;
//            }
//            case REFLECTION:
//            {
//                Vec3f reflectionDirection = reflect(dir, N);
//                Vec3f reflectionRayOrig = (dotProduct(reflectionDirection, N) < 0) ?
//                    hitPoint + N * camera.options.bias :
//                    hitPoint - N * camera.options.bias;
//                Ray reflectRay = Ray(reflectionRayOrig, reflectionDirection);
//
//                float kr;
//                fresnel(dir, N, hitObject->ior, kr);
//                hitColor = castRay(reflectRay, scene, depth + 1, 1) * kr;
//                break;
//            }
//            default:
//            {
            
        
                //Vec3f lightAmt = 0, specularColor = 0;
                Vec3f shadowPointOrig = (dotProduct(dir, N) < 0) ?
                    hitPoint + N * camera.options.bias :
                    hitPoint - N * camera.options.bias;
            
                for (uint32_t i = 0; i < scene.lights.size(); i++) {
                    Vec3f lightDir = scene.lights[i]->position - hitPoint;
                    //float lightDistance2 = dotProduct(lightDir, lightDir);
                    lightDir = normalize(lightDir);
                    
                    float LdotN = std::max(0.f, dotProduct(lightDir, N));
//                    cout << N.x << " " << N.y << " " << N.z << " " << endl;
                    
                    Shape *shadowHitObject = nullptr;
                    
                    float tNearShadow = kInfinity;
                    Ray shadowRay = Ray(shadowPointOrig, lightDir);
                    
                    bool inShadow = scene.IntersectL(shadowRay, tNearShadow, &isectL, &shadowHitObject);//  && tNearShadow * tNearShadow < lightDistance2;
                    
                    lightAmt += (1 - inShadow) * scene.lights[i]->intensity * LdotN;
                    
//                    Vec3f reflectionDirection = reflect(-lightDir, N);
//                    specularColor += powf(std::max(0.f, -dotProduct(reflectionDirection, dir)), hitObject->specularExponent) * scene.lights[i]->intensity;
                }
                hitColor = lightAmt  * hitObject->evalDiffuseColor();// * hitObject->Kd;// + specularColor * hitObject->Ks;
//                hitColor = hitObject->evalDiffuseColor();
        
        //                break;
//            }
//        }
    }

    return hitColor;
}

#endif /* integrator_h */
