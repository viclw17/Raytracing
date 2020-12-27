#include "pbrt.h"

#include "geometry.h"
#include "shape.h"
#include "reflection.h"
#include "light.h"
#include "scene.h"
#include "camera.h"
#include "integrator.h"

int main(int argc, char **argv){


    Sphere *sph0 = new Sphere(Vec3f(0, -101, -12), 100);
    sph0->diffuseColor = Vec3f(0,1,0);
    
    Sphere *sph1 = new Sphere(Vec3f(-1, 0, -12), 2);
//    sph1->materialType = DIFFUSE_AND_GLOSSY;
    sph1->diffuseColor = Vec3f(1,0,0);
    
    Sphere *sph2 = new Sphere(Vec3f(0.5, -0.5, -8), 1.5);
    sph2->diffuseColor = Vec3f(0,0,1);
//    sph2->ior = 1.5;
//    sph2->materialType = REFLECTION_AND_REFRACTION;
    
//    Sphere *sph3 = new Sphere(Vec3f(1, 0, -8), 1.5);
//    sph3->diffuseColor = Vec3f(1);
//    sph3->ior = 1.5;
//    sph3->materialType = REFLECTION;
    
    std::vector<std::unique_ptr<Shape>> objects;
    std::vector<std::unique_ptr<Light>> lights;
    
    Scene s;
    
    // order???
    s.objects.push_back(std::unique_ptr<Sphere>(sph2));
    s.objects.push_back(std::unique_ptr<Sphere>(sph1));
    s.objects.push_back(std::unique_ptr<Sphere>(sph0));
//    s.objects.push_back(std::unique_ptr<Sphere>(sph3));

    s.lights.push_back(std::unique_ptr<Light>(new Light(Vec3f(-20, 70, 20), 0.5)));
    s.lights.push_back(std::unique_ptr<Light>(new Light(Vec3f(30, 50, -12), 1)));
//    lights.push_back(std::unique_ptr<Light>(new Light(Vec3f(30, 50, -12), 5)));

    


    
    Camera camera;
    camera.options.width = 1280;//640;
    camera.options.height = 960;//480;
    camera.options.fov = 50;
    camera.options.backgroundColor = Vec3f(.5);//Vec3f(0.235294, 0.67451, 0.843137);
    camera.options.maxDepth = 5;
    camera.options.bias = 0.00001;
    
    Integrator integrator = Integrator(camera);
    
    // finally, render
    integrator.render(s);

    return 0;
}
