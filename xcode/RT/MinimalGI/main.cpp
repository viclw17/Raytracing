#include "vec3.h"
#include "vec2.h"
#include "matrix44.h"
#include "math.h"
#include "sphere.h"
#include "light.h"

#include <cstdio>
#include <cstdlib>
#include <memory>
#include <vector>
#include <utility>
#include <cstdint>
#include <iostream>
#include <fstream>
#include <cmath>
#include <sstream>
#include <chrono>

#include <random>

using namespace std;


static const Vec3f kDefaultBackgroundColor = Vec3f(1,0,0);//Vec3f(0.235294, 0.67451, 0.843137);


struct ImageOptions{
    uint32_t width = 640;
    uint32_t height = 480;
    float fov = 90;
    Vec3f backgroundColor = kDefaultBackgroundColor;
    Matrix44f cameraToWorld;
    float bias = 0.001;
    uint32_t maxDepth = 1;
};


enum RayType { kPrimaryRay, kShadowRay };

struct IsectInfo{
    const Object *hitObject = nullptr;
    float tNear = kInfinity;
    Vec2f uv;
    uint32_t index = 0;
};

bool trace(
    const Vec3f &orig, const Vec3f &dir,
    const vector<unique_ptr<Object>> &objects,
    IsectInfo &isect,
    RayType rayType = kPrimaryRay)
{
    isect.hitObject = nullptr;
    for (uint32_t k = 0; k < objects.size(); ++k) {
        float tNear = kInfinity;
        uint32_t index = 0;
        Vec2f uv;
        if (objects[k]->intersect(orig, dir, tNear, index, uv) && tNear < isect.tNear) {
            isect.hitObject = objects[k].get();
            isect.tNear = tNear;
            isect.index = index;
            isect.uv = uv;
        }
    }

    return (isect.hitObject != nullptr);
}


default_random_engine generator;
uniform_real_distribution<float> distribution(0, 1);

#define GI
Vec3f castRay(
    const Vec3f &orig, const Vec3f &dir,
    const vector<unique_ptr<Object>> &objects,
    const vector<unique_ptr<Light>> &lights,
    const ImageOptions &options,
    const uint32_t & depth = 0)
{
    
    if (depth > options.maxDepth) return 0;//options.backgroundColor;
    
    Vec3f hitColor = 0;
    IsectInfo isect;
    
        
    if (trace(orig, dir, objects, isect)) {
        
        // Evaluate surface properties (P, N, texture coordinates, etc.)
        Vec3f hitPoint = orig + dir * isect.tNear;
        Vec3f hitNormal;
        Vec2f hitTexCoordinates;
        isect.hitObject->getSurfaceProperties(hitPoint, dir, isect.index, isect.uv, hitNormal, hitTexCoordinates);
        switch (isect.hitObject->type) {
            
            // Simulate diffuse object
            case kDiffuse:{
                // 1. Compute direct ligthing
                Vec3f directLighting = 0;
                
                // trace toward EACH light source aka casting shadowray
                for (uint32_t i = 0; i < lights.size(); ++i) {
                    Vec3f lightDir, lightIntensity;
                    IsectInfo isectShad;
                    lights[i]->illuminate(hitPoint, lightDir, lightIntensity, isectShad.tNear);
                    // trace toward light source aka shadowray
                    bool shadow_ray_hit = trace(hitPoint + hitNormal * options.bias, -lightDir, objects, isectShad, kShadowRay);
                    if(!shadow_ray_hit) // shadow ray does not hit any object, shadow_ray_hit=false, not in shadow
                        // phong diffuse
                        directLighting = lightIntensity * max(0.f, hitNormal.dotProduct(-lightDir));
                    else{ // in shadow
                        directLighting = Vec3f(0);//Vec3f(1,0,0);
                    }
                }
                
                // Compute indirect ligthing
                
                Vec3f indirectLigthing = 0;
#ifdef GI
                uint32_t N = 4; /// (depth + 1);
                Vec3f Nt, Nb;
                createCoordinateSystem(hitNormal, Nt, Nb);
                
                // lambertian BRDF
                float pdf = 1 / (2 * M_PI);
                
                for (uint32_t n = 0; n < N; ++n) {
                    float r1 = distribution(generator); // // cos(theta) = N dot LightDirection
                    float r2 = distribution(generator);
                    Vec3f sample = uniformSampleHemisphere(r1, r2);
                    Vec3f sampleWorld(
                        sample.x * Nb.x + sample.y * hitNormal.x + sample.z * Nt.x,
                        sample.x * Nb.y + sample.y * hitNormal.y + sample.z * Nt.y,
                        sample.x * Nb.z + sample.y * hitNormal.z + sample.z * Nt.z);
                    
                    // don't forget to apply cosine law (i.e. multiply by cos(theta) = r1).
                    // we should also divide the result by the PDF (1/2*M_PI) but we can do this after
                
                    // Recurse
                    indirectLigthing += r1 * castRay(
                                                     hitPoint + sampleWorld * options.bias,
                                                     sampleWorld, objects, lights, options, depth + 1) / pdf;
                }
                // divide by N
                indirectLigthing /= (float)N;
#endif
                // (indirectDiffuse / (1 / 2 * M_PI) + directDiffuse) * albedo / M_PI
                // (2 * M_PI * indirectDiffuse + directDiffuse) * albedo / M_PI
                // (2 * indirectDiffuse + directDiffuse / M_PI) * albedo
                hitColor += (directLighting / M_PI + 2 * indirectLigthing) * isect.hitObject->albedo;
                break;
            } // switch
            default:
                break;
        }
    }
    else {
        hitColor = 0;
    }
    
    return hitColor;
}


// The main render function. This where we iterate over all pixels in the image, generate
// primary rays and cast these rays into the scene. The content of the framebuffer is
// saved to a file.

void render(
    const ImageOptions &options,
    const vector<unique_ptr<Object>> &objects,
    const vector<unique_ptr<Light>> &lights)
{
    
    unique_ptr<Vec3f []> framebuffer(new Vec3f[options.width * options.height]);
    Vec3f *pix = framebuffer.get();
    float scale = tan(deg2rad(options.fov * 0.5));
    float imageAspectRatio = options.width / (float)options.height;
    Vec3f orig;
    options.cameraToWorld.multVecMatrix(Vec3f(0), orig);
    auto timeStart = chrono::high_resolution_clock::now();
    
    int ns = 4;
    
    for (int j = 0; j < options.height; ++j) {
        for (int i = 0; i < options.width; ++i) {
            Vec3f col = 0; //LOL
            for(int s=0; s < ns; s++) {
                // generate primary ray direction
                float x = (2 * (i + 0.5) / (float)options.width - 1) * imageAspectRatio * scale;
                float y = (1 - 2 * (j + 0.5) / (float)options.height) * scale;
                Vec3f dir;
                    
                x += (rand() % (100) / (float)(100))/1000.;
                y += (rand() % (100) / (float)(100))/1000.;
                    
                
                options.cameraToWorld.multDirMatrix(Vec3f(x, y, -1), dir);
                dir.normalize();

                col += castRay(orig, dir, objects, lights, options);
            }
            *(pix++) = col/float(ns);
        }
        fprintf(stderr, "\r%3d%c", uint32_t(j / (float)options.height * 100), '%');
    }
    
    auto timeEnd = chrono::high_resolution_clock::now();
    auto passedTime = chrono::duration<double, milli>(timeEnd - timeStart).count();
    fprintf(stderr, "\rDone: %.2f (sec)\n", passedTime / 1000);
    
    // save framebuffer to file
    float gamma = 1;
    ofstream ofs;
    ofs.open("out.ppm");
    ofs << "P6\n" << options.width << " " << options.height << "\n255\n";
    for (uint32_t i = 0; i < options.height * options.width; ++i) {
        char r = (char)(255 * clamp(0, 1, powf(framebuffer[i].x, 1/gamma)));
        char g = (char)(255 * clamp(0, 1, powf(framebuffer[i].y, 1/gamma)));
        char b = (char)(255 * clamp(0, 1, powf(framebuffer[i].z, 1/gamma)));
        ofs << r << g << b;
    }
    ofs.close();
}


// In the main function of the program, we create the scene (create objects and lights)
// as well as set the options for the render (image widht and height, maximum recursion
// depth, field-of-view, etc.). We then call the render function().

int main(int argc, char **argv)
{
    vector<unique_ptr<Object>> objects;
    vector<unique_ptr<Light>> lights;
    ImageOptions options;
    options.fov = 39.89;
    options.width = 512;
    options.height = 512;
    options.cameraToWorld = Matrix44f(0.965926, 0, -0.258819, 0, 0.0066019, 0.999675, 0.0246386, 0, 0.258735, -0.0255078, 0.965612, 0, 0.764985, 0.791882, 5.868275, 1);
    
    
    Matrix44f xformSphere;
    xformSphere[3][1] = 1;
    Matrix44f xformSphere1;
    xformSphere1[3][0] = -2; // x
    xformSphere1[3][1] = .5; // y
    Matrix44f xformSphere2;
    xformSphere2[3][1] = -1000;
    Sphere *sph = new Sphere(xformSphere, 1);
    Sphere *sph1 = new Sphere(xformSphere1, .5);
    Sphere *sph2 = new Sphere(xformSphere2, 1000);
    sph->albedo = Vec3f(.2,0,0);
    sph2->albedo = Vec3f(.2);
    objects.push_back(unique_ptr<Object>(sph));
    objects.push_back(unique_ptr<Object>(sph1));
    objects.push_back(unique_ptr<Object>(sph2));

    Matrix44f l2w(0.916445, -0.218118, 0.335488, 0,
                  0.204618, -0.465058, -0.861309, 0,
                  0.343889, 0.857989, -0.381569, 0,
                  0, 0, 0, 1);
    lights.push_back(unique_ptr<Light>(new DistantLight(l2w, 1, 16)));
//    lights.push_back(std::unique_ptr<Light>(new PointLight(l2w, 1, 200 00)));

    
    render(options, objects, lights);

    return 0;
}
