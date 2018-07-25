#include <iostream>
#include <fstream>
#include <limits>
// #include "vec3.h"
// #include "ray.h" // including vec3.h
#include "sphere.h"
#include "hitable_list.h" // including hitable.h which includes ray.h
#include "camera.h"
#include "float.h"

using namespace std;

/*
Sphere: dot((p-c),(p-c))=R*R --> any point p that satisfies this equation is on the sphere. Ray: p(t) = A + t*B
dot((p(t)-c),(p(t)-c))=R*R
dot(A + t*B - c),(A + t*B - c))=R*R
t*t*dot(B,B) + 2*t*dot(B,A-C) + dot(A-C,A-C) - R*R = 0
a = dot(B,B)
b = 2*dot(B,A-C)
c = dot(A-C,A-C) - R*R
*/
// 注意hit_sphere()函数的返回值类型由bool变成float
// now all moved into sphere.cpp
/*
float hit_sphere(const vec3& center, float radius, const ray& r){
    vec3 oc = r.origin() - center; // A-C
    float a = dot(r.direction(), r.direction());
    float b = 2.0 * dot(oc, r.direction());
    float c = dot(oc,oc) - radius*radius;
    float discriminant = b*b - 4*a*c;
    // return (discriminant>0);
    if(discriminant < 0){
        return -1.0;
    }
    else{
        return (-b - sqrt(discriminant)) / (2.0*a);
    }
}
*/

// the core of a raytracer is to send rays through pixels and compute what color is seen in the direction of those rays. This is of the form calculate which ray goes from the eye to a pixel, compute what that ray intersects, and compute a color for that intersection point.
// now all rewritten for multiple objects
/*
vec3 color(const ray& r){
    // if(hit_sphere(vec3(0,0,-1), 0.5, r))
    //     return vec3(1,0,0);
    float t = hit_sphere(vec3(0,0,-1), 0.5, r);
    if(t > 0.0){
        vec3 N = unit_vector(r.point_at_parameter(t) - vec3(0,0,-1));
        return 0.5 * (N+vec3(1.0,1.0,1.0));//vec3(N.x()+1, N.y()+1, N.z()+1);
    }
    // background
    vec3 unit_direction = unit_vector(r.direction());
    t = 0.5*(unit_direction.y()+1.0); // -1~1 --> 0~1
    return (1.0-t)*vec3(1.0,1.0,1.0) + t*vec3(0.5,0.7,1.0); // lerp
    // blended_value = (1-t)*start_value + t*end_value
}
*/
vec3 random_in_unit_sphere(){
    vec3 p;
    do{
        p = 2.0*vec3(drand48(), drand48(), drand48()) - vec3(1,1,1);
    } while (p.squared_length() >= 1.0);
    return p;
}

// vec3 color(const ray& r, hitable *world){
//     hit_record rec;
//     if(world->hit(r, 0.001, MAXFLOAT, rec)){ // the ref. of rec is passed in, (numeric_limits<float>::max)()
//         vec3 target = rec.p + rec.normal + random_in_unit_sphere();
//         // return 0.5*vec3(rec.normal.x()+1, rec.normal.y()+1, rec.normal.z()+1); // draw normal coloration
//         return 0.5*color(ray(rec.p, target-rec.p), world);
//     }
//     else{
//         // background
//         vec3 unit_direction = unit_vector(r.direction());
//         float t = 0.5*(unit_direction.y()+1.0); // -1~1 --> 0~1
//         return (1.0-t)*vec3(1.0,1.0,1.0) + t*vec3(0.5,0.7,1.0); // lerp
//     }
// }

bool hit_sphere(const vec3& center, float radius, const ray& r) {
    vec3 oc = r.origin() - center;
    float a = dot(r.direction(), r.direction());
    float b = 2.0 * dot(oc, r.direction());
    float c = dot(oc,oc) - radius*radius;
    float discriminant = b*b - 4*a*c;
    return (discriminant>0);
}

vec3 color(const ray& r) {
    // draw blue sphere
    if(hit_sphere(vec3(0,0,-1), 0.5, r))
        return vec3(0,0,1);

    // draw background
    vec3 unit_direction = unit_vector(r.direction());
    float t = 0.5*(unit_direction.y()+1.0); // -1~1 --> 0~1
    return (1.0-t)*vec3(1.0,1.0,1.0) + t*vec3(0.5,0.7,1.0); // lerp
}

int main(){
    int nx = 800;
    int ny = 400;
    int ns = 100; /* 每个像素点区域采样ns次，此处ns=100 */

    // 将结果输出到文件
    ofstream outfile("test.ppm", ios_base::out);
    outfile << "P3\n" << nx << " " << ny << "\n255\n";
    //std::cout << "P3\n" << nx << " " << ny << "\n255\n";

    hitable *list[2]; // 一个储存有2个“指向hitable对象的指针”的数组
    list[0] = new sphere(vec3(0,0,-1), 0.5);
    list[1] = new sphere(vec3(0,-100.5,-1), 100);
    hitable *world = new hitable_list(list, 2); // world是一个指向hitable对象的指针变量

    camera cam;

    for(int j=ny-1; j>=0; j--){
        for(int i=0; i<nx; i++){
            vec3 col(0,0,0);
            // new changes for antialiasing(multi-sampling per pixel)
            for(int s=0; s < ns; s++){
                float u = float(i + drand48())/float(nx); // 0~1
                float v = float(j + drand48())/float(ny);
                // float u = float(i) / float(nx);
                // float v = float(j) / float(ny);
                ray r = cam.get_ray(u,v); // generate ray per sample

                // vec3 p = r.point_at_parameter(1.0);
                // p = unit_vector(p);
                // col = vec3(p.z(),p.z(),p.z());
                col += color(r);

                // col += color(r, world); // 根据光线对每一个像素点上色
            }

            /*
            将这个像素点区域的所有ns个随机采样点的颜色累加值除以ns获得其平均值，作为这个像素点区域最终的像素值。
            */
            col /= float(ns);

            // gamma correction
            //col = vec3(sqrt(col[0]), sqrt(col[1]), sqrt(col[2]));

            int ir = int(255.99*col[0]);
            int ig = int(255.99*col[1]);
            int ib = int(255.99*col[2]);

            outfile   << ir << " " << ig << " " << ib << "\n";
            //std::cout << ir << " " << ig << " " << ib << "\n";
        }
    }
    cout << "Image output succeeded! :)" << "\n";
}
