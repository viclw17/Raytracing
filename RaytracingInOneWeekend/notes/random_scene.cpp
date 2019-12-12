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

// Cover image
hitable *random_scene()
{
    int n = 500;
    hitable **list = new hitable *[n + 1];
    /*定义一个包含n+1个元素的数组，数组的每个元素是指向hitable对象的指针。然后将数组的指针赋值给list。所以，list是指针的指针。*/
    list[0] = new sphere(vec3(0, -1000, 0), 1000, new lambertian(vec3(0.5, 0.5, 0.5)));
    /*先创建一个中心在（0，-1000，0）半径为1000的超大漫射球，将其指针保存在list的第一个元素中。*/
    int i = 1;
    for (int a = -11; a < 11; a++)
    {
        for (int b = -11; b < 11; b++)
        {
            /*两个for循环中会产生（11+11）*(11+11)=484个随机小球*/
            float choose_mat = (rand() % (100) / (float)(100));
            /*产生一个（0，1）的随机数，作为设置小球材料的阀值*/
            vec3 center(a + 0.9 * (rand() % (100) / (float)(100)), 0.2,
                        b + 0.9 * (rand() % (100) / (float)(100)));
            /*” a+0.9*(rand()%(100)/(float)(100))”配合[-11,11]产生（-11，11）之间的随机数，而不是[-11,11)之间的22个整数。使得球心的x,z坐标是（-11，11）之间的随机数*/
            if ((center - vec3(4, 0.2, 0)).length() > 0.9)
            {
                /*避免小球的位置和最前面的大球的位置太靠近*/
                if (choose_mat < 0.8)
                { //diffuse
                    /*材料阀值小于0.8，则设置为漫反射球，漫反射球的衰减系数x,y,z都是（0，1）之间的随机数的平方*/
                    list[i++] =
                        new sphere(center, 0.2,
                                   new lambertian(
                                       vec3(
                                           (rand() % (100) / (float)(100)) * (rand() % (100) / (float)(100)),
                                           (rand() % (100) / (float)(100)) * (rand() % (100) / (float)(100)),
                                           (rand() % (100) / (float)(100)) * (rand() % (100) / (float)(100)))));
                }
                else if (choose_mat < 0.95)
                {
                    /*材料阀值大于等于0.8小于0.95，则设置为镜面反射球，镜面反射球的衰减系数x,y,z及模糊系数都是（0，1）之间的随机数加一再除以2*/
                    list[i++] =
                        new sphere(center, 0.2,
                                   new metal(
                                       vec3(
                                           0.5 * (1 + (rand() % (100) / (float)(100))),
                                           0.5 * (1 + (rand() % (100) / (float)(100))),
                                           0.5 * (1 + (rand() % (100) / (float)(100)))),
                                       0.5 * (1 + (rand() % (100) / (float)(100)))));
                }
                else
                {
                    /*材料阀值大于等于0.95，则设置为介质球*/
                    list[i++] = new sphere(center, 0.2, new dielectric(vec3(1, 1, 1), 1.5));
                }
            }
        }
    }
    list[i++] = new sphere(vec3(0, 1, 0), 1.0, new dielectric(vec3(1, 1, 1), 1.5));
    list[i++] = new sphere(vec3(-4, 1, 0), 1.0, new lambertian(vec3(0.4, 0.2, 0.1)));
    list[i++] = new sphere(vec3(4, 1, 0), 1.0, new metal(vec3(0.7, 0.6, 0.5), 0.0));
    /*定义三个大球*/

    return new hitable_list(list, i);
}

world = random_scene();

// Camera cover image
vec3 lookfrom(11, 2, 3);
vec3 lookat(0, 0.6, 0);
float dist_to_focus = (lookfrom - lookat).length();
float aperture = 0.0;
camera cam(lookfrom, lookat, vec3(0, 1, 0), 20, float(nx) / float(ny), aperture, 0.7 * dist_to_focus);