// ==Montelight==
// Tegan Brennan, Stephen Merity, Taiyo Wilson
#include <cmath>
#include <string>
#include <iomanip>
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>

#include "vector.h"
#include "shape.h"
#include "image.h"
#include "ray.h"
#include "scene.h"
using namespace std;

// Globals
bool EMITTER_SAMPLING = true;


struct Tracer {
  std::vector<Shape *> scene;
  Tracer(const std::vector<Shape *> &scene_) : scene(scene_) {}
    
    
  std::pair<Shape *, double> getIntersection(const Ray &r) const {
    Shape *hitObj = NULL;
    double closest = 1e20f;
    for (Shape *obj : scene) {
      double distToHit = obj->intersects(r);
      if (distToHit > 0 && distToHit < closest) {
        hitObj = obj;
        closest = distToHit;
      }
    }
    return std::make_pair(hitObj, closest);
  }
    
    
    
  Vector getRadiance(const Ray &r, int depth) {
    // Work out what (if anything) was hit
    auto result = getIntersection(r);
    Shape *hitObj = result.first; // hit obj
      
    // Russian Roulette sampling based on reflectance of material
      double U = drand48();
    if (depth > 4 && (depth > 20 || U > hitObj->color.max())) {
      return 0;
    }
      
    Vector hitPos = r.origin + r.direction * result.second;
    Vector norm = hitObj->getNormal(hitPos);
      
    // Orient the normal according to how the ray struck the object
    if (norm.dot(r.direction) > 0) {
      norm = norm * -1;
    }
      
    // 1. Work out the contribution from directly sampling the emitters
    Vector lightSampling;
//    if (EMITTER_SAMPLING) {
      for (Shape *light : scene) {
        // Skip any objects that don't emit light
        if (light->emit.max() == 0) {
          continue;
        }
        // shadow ray
        Vector lightPos = light->randomPoint();
        Vector lightDirection = (lightPos - hitPos).norm();
        Ray rayToLight = Ray(hitPos, lightDirection);
        auto lightHit = getIntersection(rayToLight);
          
        if (light == lightHit.first) {
          double wi = lightDirection.dot(norm);
          if (wi > 0) {
            double srad = 1.5;
            double cos_a_max = sqrt(1-srad*srad/(hitPos - lightPos).dot(hitPos - lightPos));
            double omega = 2*M_PI*(1-cos_a_max);
            lightSampling += light->emit * wi * omega * M_1_PI; // 1/pi
          }
        }else{
            // in shadow
            //return Vector(1,0,0);
        }
      }
//    }
      
    // 2. Work out contribution from reflected light
    // Diffuse reflection condition:
    // Create orthogonal coordinate system defined by (x=u, y=v, z=norm)
    double angle = 2 * M_PI * drand48();
    double dist_cen = sqrt(drand48());
    Vector u;
    if (fabs(norm.x) > 0.1) {
      u = Vector(0, 1, 0);
    } else {
      u = Vector(1, 0, 0);
    }
    u = u.cross(norm).norm();
    Vector v = norm.cross(u);
      
    // Direction of reflection
    Vector d = (u * cos(angle) * dist_cen + v * sin(angle) * dist_cen + norm * sqrt(1 - dist_cen * dist_cen)).norm();

    // Recurse
    Vector reflected = getRadiance(Ray(hitPos, d), depth + 1);
      
//    if (!EMITTER_SAMPLING || depth == 0) {
//        return hitObj->emit +
//        hitObj->color * lightSampling + hitObj->color * reflected;
//    }else{
        return
      hitObj->color * lightSampling + hitObj->color * reflected;
//    }
  }
};




int main(int argc, const char *argv[]) {
  /////////////////////////
  // Variables to modify the process or the images
    EMITTER_SAMPLING = false;//true;
    
  int w = 256, h = 256;
  int SNAPSHOT_INTERVAL = 1;
  unsigned int SAMPLES = 4;
    
  bool FOCUS_EFFECT = false;
  double FOCAL_LENGTH = 35;
  double APERTURE_FACTOR = 1; // ratio of original/new aperture (>1: smaller view angle, <1: larger view angle)
  // Initialize the image
  Image img(w, h);
  /////////////////////////
  // Set which scene should be raytraced
  auto &scene = simpleScene;
  Tracer tracer = Tracer(scene);
  /////////////////////////
  // Set up the camera
  double aperture = 0.5135 / APERTURE_FACTOR;
  Vector cx = Vector((w * aperture) / h, 0, 0);
  Vector dir_norm = Vector(0, -0.042612, -1).norm();
  double L = 140;
  double L_new = APERTURE_FACTOR * L;
  double L_diff = L - L_new;
  Vector cam_shift = dir_norm * (L_diff);
  if (L_diff < 0){
    cam_shift = cam_shift * 1.5;
  }
  L = L_new;
  Ray camera = Ray(Vector(50, 52, 295.6) + cam_shift, dir_norm);
  // Cross product gets the vector perpendicular to cx and the "gaze" direction
  Vector cy = (cx.cross(camera.direction)).norm() * aperture;
    
  /////////////////////////
  // Take a set number of samples per pixel
  for (int sample = 0; sample < SAMPLES; ++sample) {
    std::cout << "Taking sample " << sample << "\r" << std::flush;
    if (sample && sample % SNAPSHOT_INTERVAL == 0) {
      std::ostringstream fn;
      fn << std::setfill('0') << std::setw(5) << sample;
      img.save("render_" + fn.str());
    }
    // For each pixel, sample a ray in that direction
    for (int y = 0; y < h; ++y) {
      for (int x = 0; x < w; ++x) {
        /*
        Vector target = img.getPixel(x, y);
        double A = (target - img.getSurroundingAverage(x, y, sample % 2)).abs().max() / (100 / 255.0);
        if (sample > 10 && drand48() > A) {
          continue;
        }
        ++updated;
        */
          
        // Jitter pixel randomly in dx and dy according to the tent filter
        double Ux = 2 * drand48();
        double Uy = 2 * drand48();
        double dx;
        if (Ux < 1) {
          dx = sqrt(Ux) - 1;
        } else {
          dx = 1 - sqrt(2 - Ux);
        }
        double dy;
        if (Uy < 1) {
          dy = sqrt(Uy) - 1;
        } else {
          dy = 1 - sqrt(2 - Uy);
        }
          
        dx=dy=0;
          
        // Calculate the direction of the camera ray
        Vector d = (cx * (((x+dx) / float(w)) - 0.5)) + (cy * (((y+dy) / float(h)) - 0.5)) + camera.direction;
        Ray ray = Ray(camera.origin + d * 140, d.norm());
        // If we're actually using depth of field, we need to modify the camera ray to account for that
        if (FOCUS_EFFECT) {
          // Calculate the focal point
          Vector fp = (camera.origin + d * L) + d.norm() * FOCAL_LENGTH;
          // Get a pixel point and new ray direction to calculate where the rays should intersect
          Vector del_x = (cx * dx * L / float(w));
          Vector del_y = (cy * dy * L / float(h));
          Vector point = camera.origin + d * L;
          point = point + del_x + del_y;
          d = (fp - point).norm();
          ray = Ray(camera.origin + d * L, d.norm());
        }
          
        // Retrieve the radiance of the given hit location (i.e. brightness of the pixel)
        Vector rads = tracer.getRadiance(ray, 0);
        // Clamp the radiance so it is between 0 and 1
        // If we don't do this, antialiasing doesn't work properly on bright lights
        rads.clamp();
        // Add result of sample to image
        img.setPixel(x, y, rads);
      }
    }
  }
  // Save the resulting raytraced image
  img.save("render");
  return 0;
}
