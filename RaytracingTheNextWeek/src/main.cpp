#include <iostream>
#include <fstream>
#include <limits>
#include "bvh.h"
#include "sphere.h"
#include "rect.h"
#include "box.h"
#include "moving_sphere.h"
#include "hitable_list.h"
#include "camera.h"

#include "translate.h"
#include "rotate_y.h"

#include "lambertian.h"
#include "metal.h"
#include "dielectric.h"
#include "diffuse_light.h"
#include "constant_medium.h"

#include "constant_texture.h"
#include "checker_texture.h"
#include "noise_texture.h"
#include "image_texture.h"

#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"

using namespace std;

#define TESTSCENE 12
// 1 // diffuse, blogpost scene
// 2 // metal, book scene
// 3 // metal, blogpost scene
// 4 // dielectric, book scene
// 5 // dielectric, white background, 3 colors, 3 materials, pyramid
// 6 // dielectric, white background, 3 colors, 3 materials
// 7 // blogpost scene, textures
// 8 // blogpost scene, motion blur
// 9 // escher
// 10 // perlin
// 11 // light
// 12 // cornell
#define TESTCAM 4
// 1 // Camera angled
// 2 // Camera facing forward	
// 3 // Camera escher 3 spheres
// 4 // cornell

vec3 color(const ray& r, hitable *world, int depth) {
    hit_record rec;
	// PC - numeric_limits<float>::max()
	// Mac - MAXFLOAT
	// In C++: use std::numeric_limits<float>::max(defined in <limits>).You may still use C's FLT_MAX, but include <cfloat> instead.
	if (world->hit(r, 0.001, numeric_limits<float>::max(), rec))
	{
		ray scattered;
        vec3 attenuation;
		vec3 emitted = rec.mat_ptr->emitted(rec.u, rec.v, rec.p);

        if(depth < 5 && rec.mat_ptr->scatter(r, rec, attenuation, scattered))
			return emitted + attenuation * color(scattered, world, depth + 1);
        else
			return emitted;// vec3(0, 0, 0);
    }
    else 
		// now return all black, need light!
		// return vec3(0, 0, 0);
		return vec3(1,1,1);

		// sky box
        //vec3 unit_direction = unit_vector(r.direction());
        //float t = 0.5*(unit_direction.y()+1.0); // -1~1 --> 0~1
        //return (1.0-t)*vec3(1.0,1.0,1.0) + t*vec3(0.5,0.7,1.0); // lerp
		
		// escher env color
		//return (1.0 - t)*vec3(1.0, 1.0, 1.0) + t * vec3(.81, .81, .8);

		//return (1.0 - t)*vec3(1.0, 1.0, 1.0) + t * vec3(.8, .8, .8);
 
}

// Two spheres scene
hitable *two_spheres_scene() {
	texture *pertext = new noise_texture(5.);
	hitable **list = new hitable*[2];
	//hitable *list[2]; ?
	hitable *two_spheres_scene = new hitable_list(list, 2);
	list[0] = new sphere(vec3(0, -1000, 0), 1000, new lambertian(pertext));
	list[1] = new sphere(vec3(0, 2, 0), 2, new lambertian(pertext));
	
	return two_spheres_scene;
}

hitable* simple_light() {
	texture* pertext = new noise_texture(4.);
	hitable** list = new hitable * [4];
	list[0] = new sphere(vec3(0, -1000, 0), 1000, new lambertian(pertext));
	list[1] = new sphere(vec3(0, 2, 0), 2, new lambertian(pertext));
	list[2] = new sphere(vec3(0, 7, 0), 2, new diffuse_light(new constant_texture(vec3(4,4,4))));
	list[3] = new xy_rect(3,5,1,3,-2, new diffuse_light(new constant_texture(vec3(4, 4, 4))));
	return new hitable_list(list, 4);
}

hitable* cornell_box() {
	hitable** list = new hitable * [8];
	int i = 0;

	material* red = new lambertian(new constant_texture(vec3(0.65, 0.05, 0.05)));
	material* white = new lambertian(new constant_texture(vec3(0.73, 0.73, 0.73)));
	material* green = new lambertian(new constant_texture(vec3(0.12, 0.45, 0.15)));
	material* light = new diffuse_light(new constant_texture(vec3(15, 15, 15)));// old: 15

	// walls
	list[i++] = new flip_normals(new yz_rect(0, 555, 0, 555, 555, green));
	list[i++] = new yz_rect(0, 555, 0, 555, 0, red);
	list[i++] = new xz_rect(163, 393, 177, 382, 554, light); // light, original smaller: 213, 343, 227, 332, 554
	list[i++] = new flip_normals(new xz_rect(0, 555, 0, 555, 555, white));
	list[i++] = new xz_rect(0, 555, 0, 555, 0, white);
	list[i++] = new flip_normals(new xy_rect(0, 555, 0, 555, 555, white));
	// boxes with rotation
	list[i++] = new translate(new rotate_y(new box(vec3(0, 0, 0), vec3(165, 165, 165), white), -18), vec3(130, 0, 65));
	list[i++] = new translate(new rotate_y(new box(vec3(0, 0, 0), vec3(165, 330, 165), white), 15), vec3(265, 0, 295));
	//hitable* b1 = new translate(new rotate_y(new box(vec3(0, 0, 0), vec3(165, 165, 165), white), -18), vec3(130, 0, 65));
	//hitable* b2 = new translate(new rotate_y(new box(vec3(0, 0, 0), vec3(165, 330, 165), white), 15), vec3(265, 0, 295));
	//list[i++] = new constant_medium(b1, 0.01, new constant_texture(vec3(1.0, 1.0, 1.0)));
	//list[i++] = new constant_medium(b2, 0.01, new constant_texture(vec3(0.0, 0.0, 0.0)));

	return new hitable_list(list, i);
}

////////////////////////////////////////////////////////////
int main() {
    // resolution
    int nx, ny;
//    nx = 100;
//    ny = 50;
//    nx = 800;
//    ny = 400;
//    nx = 400;
//    ny = 200;
//    nx = 1000;
//    ny = 500;
    nx = 200;
    ny = 200;
//    nx = 1000;
//    ny = 1000;

    // msaa
    int ns;
    ns = 1;
//    ns = 20;
//    ns = 50;
//    ns = 100;
//    ns = 1000;

    // create scene
    const int sphere_num = 5;
	//hitable **list = new hitable *[sphere_num];
    hitable *list[sphere_num]; // 一个储存有sphere_num个“指向hitable对象的指针”的数组
    float big_r = 5000.0; // ground sphere
    float z = -1.0; // sphere z position
	hitable *world = new hitable_list(list, sphere_num);
    
	////////////////////////////////////////////////////////////
	// scene defination
	#if TESTSCENE == 1 // diffuse, blogpost scene
    list[0] = new sphere(vec3(0,-(big_r+0.5),z), big_r, new lambertian(new constant_texture(vec3(.5,.5,.5))));
    list[1] = new sphere(vec3(0,0,-1), 0.5, new lambertian(new constant_texture(vec3(0.1,0.2,0.5))));
    list[2] = new sphere(vec3(1,0,-1), 0.5, new lambertian(new constant_texture(vec3(.7,.7,.7))));
    list[3] = new sphere(vec3(-1,0,-1), 0.5, new lambertian(new constant_texture(vec3(1,1,1))));
	
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
    list[3] = new sphere(vec3( 10,z), 0.5, new metal(vec3(0.8,0.3,0.3), 0.5));

	#elif TESTSCENE == 7 // textures
	texture *checker = new checker_texture(
		new constant_texture(vec3(.1, .1, .1)), 
		new constant_texture(vec3(.5, .5, .5)));
	// floor sphere
	list[0] = new sphere(vec3(0, -(big_r + 0.5), z), big_r, new lambertian(checker));
	int nx1 = 1000, ny1 = 500;
	int nx2 = 1024, ny2 = 512;
	int nx3 = 960,  ny3 = 480;
	int nx4 = 2048, ny4 = 1024;
	int nn = 3;
	// unsigned char *data = stbi_load(filename, &x, &y, &n, 0);
	// ... process data if not NULL ...
	// ... x = width, y = height, n = # 8-bit components per pixel ...
	// ... replace '0' with '1'..'4' to force that many components per pixel
	// ... but 'n' will always be the number that it would have been if you said 0
	unsigned char *tex_data1 = stbi_load("../textures/earth.jpg", &nx1, &ny1, &nn, 0); // pass by reference
	unsigned char *tex_data2 = stbi_load("../textures/moon.jpg", &nx2, &ny2, &nn, 0);
	unsigned char *tex_data3 = stbi_load("../textures/mars.jpg", &nx3, &ny3, &nn, 0);
	unsigned char *tex_data4 = stbi_load("../textures/jupiter.jpg", &nx4, &ny4, &nn, 0);
	// image_texture(unsigned char *pixels, int A, int B) : data(pixels), nx(A), ny(B) {}
	material *earth_mat   = new lambertian(new image_texture(tex_data1, nx1, ny1)); // pass by copy
	material *moon_mat    = new lambertian(new image_texture(tex_data2, nx2, ny2));
	material *mars_mat    = new lambertian(new image_texture(tex_data3, nx3, ny3));
	material *jupiter_mat = new lambertian(new image_texture(tex_data4, nx4, ny4));
	list[1] = new sphere(vec3(-.8, 0, z),    0.5, earth_mat);
	list[2] = new sphere(vec3(-.1, -0.3, z), 0.2, moon_mat);
	list[3] = new sphere(vec3(.8, -0.2, z),  0.3, mars_mat);																								   //list[3] = new sphere(vec3(1, 0, z), 0.5, new metal(vec3(0.8, 0.8, 0.8), 0.3)); //0.5
	list[4] = new sphere(vec3(.3, .5, z-1),    1, jupiter_mat);

	#elif TESTSCENE == 8 // dielectric, blogpost scene
	vec3 motion_offset = vec3(0, 0.5*(rand() % (100) / (float)(100)), 0);
	list[0] = new sphere(vec3(0, -(big_r + 0.5), z), big_r, new lambertian(vec3(0.1, 0.2, 0.5)));
	list[1] = new moving_sphere(vec3(0, 0, z), vec3(0, 0, z) + motion_offset, 0.0, 1.0, 0.5, new dielectric(vec3(.9, .9, .9), 1.5));
	list[2] = new moving_sphere(vec3(-1.001, 0, z), vec3(-1.001, 0, z) + motion_offset, 0.0, 1.0, 0.5, new lambertian(vec3(.8, .8, .8)));
	list[3] = new moving_sphere(vec3(1, 0, z), vec3(1, 0, z) + motion_offset, 0.0, 1.0, 0.5, new metal(vec3(0.8, 0.8, 0.8), 0.3));

	#elif TESTSCENE == 9 // escher
	list[0] = new sphere(vec3(0, -(1000 + 0.5), z), 1000, new metal(vec3(0.5, 0.2, 0.2), 0.1));
	list[1] = new sphere(vec3(   0, 0, z), 0.5, new metal(vec3(0.8, 0.8, 0.8), 0.01));
	list[2] = new sphere(vec3(-1.15, 0, z), 0.5, new dielectric(vec3(.9, .9, .9), 1.5));
	list[3] = new sphere(vec3( 1.15, 0, z), 0.5, new lambertian(new constant_texture(vec3(.8, .8, .8))));

	#elif TESTSCENE == 10 // perlin
	world = two_spheres_scene();

	#elif TESTSCENE == 11 // light
	world = simple_light();

	#elif TESTSCENE == 12
	world = cornell_box();
	
	#endif //TESTSCENE

	////////////////////////////////////////////////////////////
    // camera defination
	#if TESTCAM == 1 // Camera angled
    vec3 lookfrom(-2, 1.5, 1);//(3, 3, 2);
    vec3 lookat(-0.2, 0, -1);
    float dist_to_focus = (lookfrom - lookat).length();
	float aperture = 0;// 0.5;
    float vfov = 40;//20
    camera cam(lookfrom, lookat, vec3(0, 1, 0), vfov, float(nx) / float(ny), aperture, dist_to_focus, 0.0, 1.0);

	#elif TESTCAM == 2 // Camera facing forward	
    vec3 lookfrom = vec3(0,1,1.5);
    vec3 lookat = vec3(0, 0, -1);
    float dist_to_focus = (lookfrom - lookat).length();
	float aperture = .01;//0.01;
	float vfov = 40;
    camera cam(lookfrom, lookat, vec3(0, 1, 0), vfov, float(nx) / float(ny), aperture, dist_to_focus, 0.0, 1.0);

	#elif TESTCAM == 3 // Camera escher
	vec3 lookfrom = vec3(0, 3.5, 6);
	vec3 lookat = vec3(0, 0, -1);
	float dist_to_focus = (lookfrom - lookat).length();
	float aperture = .01;//0.01;
	float vfov = 20; // human eye
	camera cam(lookfrom, lookat, vec3(0, 1, 0), vfov, float(nx) / float(ny), aperture, dist_to_focus, 0.0, 1.0);

	#elif TESTCAM == 4 // Camera cornell
	vec3 lookfrom(278, 278, -800);
	vec3 lookat(278, 278, 0);
	float dist_to_focus = 10.0;
	float aperture = 0.0;
	float vfov = 40.0;
	camera cam(lookfrom, lookat, vec3(0, 1, 0), vfov, float(nx) / float(ny), aperture, dist_to_focus, 0.0, 1.0);

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

            // counter++;
            vec3 col(0,0,0);
            for(int s=0; s < ns; s++) {
                float u = float(i + (rand() % (100)) / (float)(100)) / float(nx); // 0~1
                float v = float(j + (rand() % (100)) / (float)(100)) / float(ny); // xcode: drand48()

				ray r = cam.get_ray(u,v); // generate ray per sample
				// vec3 p = r.point_at_parameter(2.0);
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

			ir = fmin(ir,255);
			ig = fmin(ig,255);
			ib = fmin(ib,255);

            outfile << ir << " " << ig << " " << ib << "\n";
        }
    }
    cout << endl;
    cout << "Image output succeeded! :)" << endl;
}
