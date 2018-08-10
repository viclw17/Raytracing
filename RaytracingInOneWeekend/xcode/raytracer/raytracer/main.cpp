#include <iostream>
#include <fstream>
#include <limits>

#include "sphere.h"
#include "hitable_list.h"
#include "camera.h"

// materials
#include "lambertian.h"
#include "metal.h"
#include "dielectric.h"

using namespace std;

// r: reference to a Ray object
// world: pointer to a Hitable object
vec3 color(const ray& r, hitable *world, int depth) {
    hit_record rec;
    // the ref. of rec is passed in, numeric_limits<float>::max()
    if(world->hit(r, 0.001, MAXFLOAT, rec)) {
        ray scattered;
        vec3 attenuation;
        if(depth < 50 && rec.mat_ptr->scatter(r, rec, attenuation, scattered)) {
            return attenuation*color(scattered, world, depth+1);
        }
        else {
            return vec3(0,0,0);
        }
    }
    else {
        vec3 unit_direction = unit_vector(r.direction());
        float t = 0.5*(unit_direction.y()+1.0); // -1~1 --> 0~1
        return (1.0-t)*vec3(1.0,1.0,1.0) + t*vec3(0.5,0.7,1.0); // lerp
    }
}

////////////////////////////////////////////////////////////
// old test
// bool hit_sphere(const vec3& center, float radius, const ray& r) {
//     vec3 oc = r.origin() - center;
//     float a = dot(r.direction(), r.direction());
//     float b = 2.0 * dot(oc, r.direction());
//     float c = dot(oc,oc) - radius*radius;
//     float discriminant = b*b - 4*a*c;
//     return (discriminant>0);
// }
//
// vec3 color(const ray& r) {
//     // draw blue sphere
//     if(hit_sphere(vec3(0,0,-1), 0.5, r))
//         return vec3(0,0,1);
//
//     // draw background
//     // vec3 unit_direction = unit_vector(r.direction());
//     // float t = 0.5*(unit_direction.y()+1.0); // -1~1 --> 0~1
//     // return (1.0-t)*vec3(1.0,1.0,1.0) + t*vec3(0.5,0.7,1.0); // lerp
//     return vec3(1.0,1.0,1.0);
// }
////////////////////////////////////////////////////////////

int main() {
    int nx = 200;
    int ny = 100;
    nx = 800;
    ny = 400;
    int ns = 100;

    ofstream outfile("test.ppm", ios_base::out);
    outfile << "P3\n" << nx << " " << ny << "\n255\n";
    //std::cout << "P3\n" << nx << " " << ny << "\n255\n";

    int sphere_num = 5;
    hitable *list[sphere_num]; // 一个储存有4个“指向hitable对象的指针”的数组
    
    float big_r = 5000.0;
    float z = -1.0;
    
    // metal
//    list[0] = new sphere(vec3(0,0,-1), 0.5, new lambertian(vec3(0.8,0.3,0.3)));
//    list[1] = new sphere(vec3(0,-100.5,-1), 100, new lambertian(vec3(0.8,0.8,0.0)));
//    list[2] = new sphere(vec3(1,0,-1), 0.5, new metal(vec3(0.8,0.6,0.2), 0.5));
//    list[3] = new sphere(vec3(-1,0,-1), 0.5, new metal(vec3(0.8,0.8,0.8), 0.0));
    
//    list[0] = new sphere(vec3(0,-(big_r+0.5),z), big_r, new lambertian(vec3(1,1,1)));
//    list[1] = new sphere(vec3(-1.1,0,-1.5), 0.5, new metal(vec3(0.8,0.3,0.3), 0.3));
//    list[2] = new sphere(vec3(0,0,-1.4), 0.5, new metal(vec3(0.8,0.8,0.8), 0.0));
//    list[3] = new sphere(vec3(1.1,0,-1.5), 0.5, new lambertian(vec3(0.8,0.6,0.2)));
    
    // dielectric
//    list[0] = new sphere(vec3(0,0,-1), 0.5, new lambertian(vec3(0.1,0.2,0.5)));
//    list[1] = new sphere(vec3(0,-100.5,-1), 100, new lambertian(vec3(0.8,0.8,0.0)));
//    list[2] = new sphere(vec3(1,0,-1), 0.5, new metal(vec3(0.8,0.6,0.2), 0.0));
//    list[3] = new sphere(vec3(-1,0,-1), 0.5, new dielectric(1.5));
    
    // center 3 spheres
//    list[0] = new sphere(vec3(0,-(big_r+0.5),z), big_r, new lambertian(vec3(1,1,1)));
//    list[1] = new sphere(vec3(0,0,z), 0.5, new dielectric(vec3(0.8,0.7,0.5), 1.5));
//    list[2] = new sphere(vec3(-.7,0,z-0.5), 0.5, new lambertian(vec3(0.1,0.2,0.5)));
//    list[3] = new sphere(vec3( .7,0,z-0.5), 0.5, new metal(vec3(0.8,0.2,0.2), 0.5));
    
    // 3 colors
//    list[0] = new sphere(vec3(0,-(big_r+0.5),z), big_r, new lambertian(vec3(1,1,1)));
//    list[1] = new sphere(vec3(-1,0,z), 0.5, new dielectric(vec3(0.9,0.8,0.5), 1.5));
//    list[2] = new sphere(vec3(0,0,z), 0.5, new lambertian(vec3(0.1,0.2,0.5)));
//    list[3] = new sphere(vec3( 1,0,z), 0.5, new metal(vec3(0.8,0.3,0.3), 0.5));
    
    // blue white
    list[0] = new sphere(vec3(0,-(big_r+0.5),z), big_r, new lambertian(vec3(1,1,1)));
    list[1] = new sphere(vec3(-1,0,z), 0.5, new dielectric(vec3(1,1,1), 1.5));
    list[2] = new sphere(vec3(0,0,z), 0.5, new lambertian(vec3(0.1,0.2,0.5)));
    list[3] = new sphere(vec3( 1,0,z), 0.5, new metal(vec3(0.8,0.8,0.8), 0.5));
    list[4] = new sphere(vec3(-1,0,z), -0.45, new dielectric(vec3(1,1,1), 1.5));
    
    // greyscale
//    list[0] = new sphere(vec3(0,-(big_r+0.5),z), big_r, new lambertian(vec3(1,1,1)));
//    list[1] = new sphere(vec3(0,0,z), 0.5, new dielectric(vec3(.8,.8,.8), 1.5));
//    list[2] = new sphere(vec3(-1.1,0,z), 0.5, new lambertian(vec3(.5,.5,.5)));
//    list[3] = new sphere(vec3( 1.1,0,z), 0.5, new metal(vec3(.8,.8,.8), 0.5));

    // world是一个指向hitable对象的指针变量
    hitable *world = new hitable_list(list, sphere_num);
    
//    camera cam;
    camera cam(vec3(-2, 2, 1), vec3(0, 0, -1), vec3(0, 1, 0), 40, float(nx) / float(ny));
    
    int total = nx*ny;
    int current = 0;
    int counter = 0;
    cout << "Image outputing ..." << endl;
    
    for(int j=ny-1; j>=0; j--) {
        for(int i=0; i<nx; i++) {
            counter++;
            vec3 col(0,0,0);
            for(int s=0; s < ns; s++) {
                float u = float(i + drand48())/float(nx); // 0~1
                float v = float(j + drand48())/float(ny);
                // float u = float(i) / float(nx);
                // float v = float(j) / float(ny);
                ray r = cam.get_ray(u,v); // generate ray per sample

                // old test
                // vec3 p = r.point_at_parameter(1.0);
                // p = unit_vector(p);
                // col = vec3(p.z(),p.z(),p.z());
                // col += color(r);

                col += color(r, world, 0);
            }
            
            int mod = counter / (total / 10);
            
            if (current != mod) {
                current = mod;
                cout << "*";
            }

            col /= float(ns);

            // gamma correction
            col = vec3(sqrt(col[0]), sqrt(col[1]), sqrt(col[2]));

            int ir = int(255.99*col[0]);
            int ig = int(255.99*col[1]);
            int ib = int(255.99*col[2]);

            outfile   << ir << " " << ig << " " << ib << "\n";
            //std::cout << ir << " " << ig << " " << ib << "\n";
        }
    }
    cout << endl;
    cout << "Image output succeeded! :)" << endl;
}
