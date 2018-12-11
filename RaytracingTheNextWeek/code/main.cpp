#include <iostream>
#include <fstream>
#include <limits>
#include "sphere.h"
#include "hitable_list.h"
#include "camera.h"
#include "lambertian.h"
#include "metal.h"
#include "dielectric.h"
using namespace std;

#define TESTSCENE 7
//1 // diffuse, blogpost scene
//2 // metal, book scene
//3 // metal, blogpost scene
//4 // dielectric, book scene
//5 // dielectric, white background, 3 colors, 3 materials, pyramid
//6 // dielectric, white background, 3 colors, 3 materials
//7 // dielectric, blogpost scene
//0 // cover image scene
#define TESTCAM 1
//1 // Camera angled
//2 // Camera facing forward	
//0 // Camera cover image


// r: reference to a Ray object
// world: pointer to a Hitable object
vec3 color(const ray& r, hitable *world, int depth) {
    hit_record rec;
	// PC - numeric_limits<float>::max()
	// Mac - MAXFLOAT
	// In C++: use std::numeric_limits<float>::max(defined in <limits>).You may still use C's FLT_MAX, but include <cfloat> instead.
    if(world->hit(r, 0.001, numeric_limits<float>::max(), rec)) {
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

// Cover image
hitable *random_scene() {
    int n = 500;
    hitable **list = new hitable *[n+1];
    /*定义一个包含n+1个元素的数组，数组的每个元素是指向hitable对象的指针。然后将数组的指针赋值给list。所以，list是指针的指针。*/
    list[0] = new sphere(vec3(0,-1000,0), 1000, new lambertian(vec3(0.5, 0.5, 0.5)));
    /*先创建一个中心在（0，-1000，0）半径为1000的超大漫射球，将其指针保存在list的第一个元素中。*/
    int i = 1;
    for (int a = -11; a < 11; a++) {
        for (int b = -11; b < 11; b++) {
            /*两个for循环中会产生（11+11）*(11+11)=484个随机小球*/
            float choose_mat = (rand()%(100)/(float)(100));
            /*产生一个（0，1）的随机数，作为设置小球材料的阀值*/
            vec3 center(a+0.9*(rand()%(100)/(float)(100)), 0.2,
                        b+0.9*(rand()%(100)/(float)(100)));
            /*” a+0.9*(rand()%(100)/(float)(100))”配合[-11,11]产生（-11，11）之间的随机数，而不是[-11,11)之间的22个整数。使得球心的x,z坐标是（-11，11）之间的随机数*/
            if ((center-vec3(4,0.2,0)).length() > 0.9) {
                /*避免小球的位置和最前面的大球的位置太靠近*/
                if (choose_mat < 0.8) {     //diffuse
                    /*材料阀值小于0.8，则设置为漫反射球，漫反射球的衰减系数x,y,z都是（0，1）之间的随机数的平方*/
                    list[i++] =
                    new sphere(center, 0.2,
                        new lambertian(
                            vec3(
                                (rand()%(100)/(float)(100))*(rand()%(100)/(float)(100)),
                                (rand()%(100)/(float)(100))*(rand()%(100)/(float)(100)),
                                (rand()%(100)/(float)(100))*(rand()%(100)/(float)(100))
                            )
                        )
                    );
                }
                else if (choose_mat < 0.95) {
                    /*材料阀值大于等于0.8小于0.95，则设置为镜面反射球，镜面反射球的衰减系数x,y,z及模糊系数都是（0，1）之间的随机数加一再除以2*/
                    list[i++] =
                    new sphere(center, 0.2,
                        new metal(
                            vec3(
                                0.5*(1+(rand()%(100)/(float)(100))),
                                0.5*(1+(rand()%(100)/(float)(100))),
                                0.5*(1+(rand()%(100)/(float)(100)))),
                            0.5*(1+(rand()%(100)/(float)(100)))));
                }
                else {
                    /*材料阀值大于等于0.95，则设置为介质球*/
                    list[i++] = new sphere(center, 0.2, new dielectric(vec3(1, 1,  1),1.5));
                }
            }
        }
    }
    list[i++] = new sphere(vec3(0, 1, 0), 1.0, new dielectric(vec3(1, 1,  1),1.5));
    list[i++] = new sphere(vec3(-4, 1, 0), 1.0, new lambertian(vec3(0.4, 0.2,  0.1)));
    list[i++] = new sphere(vec3(4, 1, 0), 1.0, new metal(vec3(0.7, 0.6, 0.5),  0.0));
    /*定义三个大球*/

    return new hitable_list(list, i);
    }

////////////////////////////////////////////////////////////
int main() {
	// resolution
	int nx = 100;
	int ny = 50;
	//nx = 200;
	//ny = 100;
	nx = 800;
	ny = 400;
	//nx = 1000;
	//ny = 500;

	// msaa
	int ns = 50;
	//ns = 1;

    // create scene
    int sphere_num = 4;
    hitable *list[4]; // 一个储存有4个“指向hitable对象的指针”的数组
    float big_r = 5000.0; // ground sphere
    float z = -1.0; // sphere z position

	// create world
	hitable *world;
	world = new hitable_list(list, sphere_num);
    
	////////////////////////////////////////////////////////////
	// scene defination
	#if TESTSCENE == 1 // diffuse, blogpost scene
    list[0] = new sphere(vec3(0,-(big_r+0.5),z), big_r, new lambertian(vec3(.5,.5,.5)));
    list[1] = new sphere(vec3(0,0,-1), 0.5, new lambertian(vec3(0.1,0.2,0.5)));
    list[2] = new sphere(vec3(1,0,-1), 0.5, new lambertian(vec3(.7,.7,.7)));
    list[3] = new sphere(vec3(-1,0,-1), 0.5, new lambertian(vec3(1,1,1)));
	
	#elif TESTSCENE == 2 // metal, book scene
    list[0] = new sphere(vec3(0,0,-1), 0.5, new lambertian(vec3(0.8,0.3,0.3)));
    list[1] = new sphere(vec3(0,-100.5,-1), 100, new lambertian(vec3(0.8,0.8,0.0)));
    list[2] = new sphere(vec3(1,0,-1), 0.5, new metal(vec3(0.8,0.6,0.2), 0.5));
    list[3] = new sphere(vec3(-1,0,-1), 0.5, new metal(vec3(0.8,0.8,0.8), 0.0));
    
	#elif TESTSCENE == 3 // metal, blogpost scene
    list[0] = new sphere(vec3(0,-(big_r+0.5),z), big_r, new lambertian(vec3(.5,.5,.5)));
    list[1] = new sphere(vec3(0,0,-1), 0.5, new lambertian(vec3(0.8,0.3,0.3)));
    list[2] = new sphere(vec3(1,0,-1), 0.5, new metal(vec3(0.8,0.6,0.2), 0.5));
    list[3] = new sphere(vec3(-1,0,-1), 0.5, new metal(vec3(0.8,0.8,0.8), 0.0));

	#elif TESTSCENE == 4 // dielectric, book scene
    list[0] = new sphere(vec3(0,0,-1), 0.5, new lambertian(vec3(0.1,0.2,0.5)));
    list[1] = new sphere(vec3(0,-100.5,-1), 100, new lambertian(vec3(0.8,0.8,0.0)));
    list[2] = new sphere(vec3(1,0,-1), 0.5, new metal(vec3(0.8,0.6,0.2), 0.0));
    list[3] = new sphere(vec3(-1,0,-1), 0.5, new dielectric(vec3(1, 1, 1),1.5));
   
	#elif TESTSCENE == 5 // dielectric, white background, 3 colors, 3 materials, pyramid
    list[0] = new sphere(vec3(0,-(big_r+0.5),z), big_r, new lambertian(vec3(1,1,1)));
    list[1] = new sphere(vec3(0,0,z), 0.5, new dielectric(vec3(0.8,0.7,0.5), 1.5));
    list[2] = new sphere(vec3(-.7,0,z-0.5), 0.5, new lambertian(vec3(0.1,0.2,0.5)));
    list[3] = new sphere(vec3( .7,0,z-0.5), 0.5, new metal(vec3(0.8,0.2,0.2), 0.5));

	#elif TESTSCENE == 6 // dielectric, white background, 3 colors, 3 materials
    list[0] = new sphere(vec3(0,-(big_r+0.5),z), big_r, new lambertian(vec3(1,1,1)));
    list[1] = new sphere(vec3(-1,0,z), 0.5, new dielectric(vec3(0.9,0.8,0.5), 1.5));
    list[2] = new sphere(vec3(0,0,z), 0.5, new lambertian(vec3(0.1,0.2,0.5)));
    list[3] = new sphere(vec3( 1,0,z), 0.5, new metal(vec3(0.8,0.3,0.3), 0.5));

	#elif TESTSCENE == 7 // dielectric, blogpost scene
    list[0] = new sphere(vec3(0, -(big_r + 0.5), z), big_r, new lambertian(vec3(0.1, 0.2, 0.5)));
    list[1] = new sphere(vec3(0, 0, z), 0.5, new dielectric(vec3(.9,.9,.9), 1.5));
    list[2] = new sphere(vec3(-1.001, 0, z), 0.5, new lambertian(vec3(.8,.8,.8)));
    list[3] = new sphere(vec3(1, 0, z), 0.5, new metal(vec3(0.8, 0.8, 0.8), 0.3)); //0.5
    //list[4] = new sphere(vec3(0, 0, z), -0.45, new dielectric(vec3(1, 1, 1), 1.5));r

	#elif TESTSCENE == 0 // cover image scene
	world = random_scene();
	
	#endif //TESTSCENE

	////////////////////////////////////////////////////////////
    // camera defination
	#if TESTCAM == 1 // Camera angled
    vec3 lookfrom(-2, 1.5, 1);//(3, 3, 2);
    vec3 lookat(-0.2, 0, -1);
    float dist_to_focus = (lookfrom - lookat).length();
	float aperture = 0.5;
    float theta = 40;//20
    camera cam(lookfrom, lookat, vec3(0, 1, 0), theta, float(nx) / float(ny), aperture, dist_to_focus);

	#elif TESTCAM == 2 // Camera facing forward	
    vec3 lookfrom = vec3(0,1,1.5);
    vec3 lookat = vec3(0, 0, -1);
    float dist_to_focus = (lookfrom - lookat).length();
    float aperture = .01; // 0.5
    float theta = 40;//20
    camera cam(lookfrom, lookat, vec3(0, 1, 0), theta, float(nx) / float(ny), aperture, dist_to_focus);
	
	#elif TESTCAM == 0 // Camera cover image
    vec3 lookfrom(11,2,3);
    vec3 lookat(0,0.6,0);
    float dist_to_focus = (lookfrom - lookat).length();
    float aperture = 0.0;
    camera cam(lookfrom, lookat, vec3(0,1,0), 20, float(nx)/float(ny), aperture,0.7*dist_to_focus);
	
	#endif //TESTCAM

    ////////////////////////////////////////////////////////////
	// image output
	ofstream outfile("test.ppm", ios_base::out);
	outfile << "P3\n" << nx << " " << ny << "\n255\n";
    int total = nx*ny;
    int current = 0;
    int counter = 0;
    cout << "Image outputing ..." << endl;

    for(int j=ny-1; j>=0; j--) {
        for(int i=0; i<nx; i++) {
            counter++;
            vec3 col(0,0,0);
            for(int s=0; s < ns; s++) {
                float u = float(i + rand() % (100) / (float)(100))/float(nx); // 0~1
                float v = float(j + rand() % (100) / (float)(100))/float(ny); // xcode: drand48()
                // float u = float(i) / float(nx);
                // float v = float(j) / float(ny);
                ray r = cam.get_ray(u,v); // generate ray per sample

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

            outfile << ir << " " << ig << " " << ib << "\n";
        }
    }
    cout << endl;
    cout << "Image output succeeded! :)" << endl;
}
