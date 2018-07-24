# Chapter 3: Rays, a simple camera, and background
原理分析：
光线起点（也就是eye或者camera）固定的情况下，光线的方向向量的变动范围形成光线束。光线束即是eye或者camera看到画面。也就意味着：方向向量的变动范围决定着所能看到画面的范围。另外，光线中每个光子的频率（颜色）决定这画面的内容。

所以，如果我们要通过光线追踪来画图的话，只需要做两件事情：
- 第一步，确定光线的方向向量的变动范围函数t，从而确定画面的范围、大小（一条光线对应这画面上的一个像素点）。
- 第二步，对每一条光线（像素点）设置颜色，（高质量图的每个像素点上可能对应多个采样）从而确定画面上的内容。

如下图，光线的起点为（0，0，0），要求在黑框内作图（即光线和黑框平面的交点落在黑框内）
![](smallpt/RaytracingInOneWeekend/figure-1.png)
Followed the [right-handed coordinate system](https://en.wikipedia.org/wiki/Right-hand_rule), z is pointing out of screen. So pointing into the screen is the negative z-axis.


Tranverse the screen from lower_left_corner and use 2 offset vectors along the screen sides to move the ray endpoint across the screen

所以，交点坐标可以表示为向量：```lower_left_corner + u*horizontal + v*vertical```. 光线的方向向量 = 交点的向量 - 起点向量，由于起点为原点，所以方向向量=交点向量。每个交点的u，v的值即为该像素点在整个画面中的位置。

# Chapter 5: Surface normals and multiple objects
```
float hit_sphere(const vec3&center, float radius, const ray& r){
    vec3 oc = r.orgin() -center;
    float a =oc.dot(r.direction(), r.direction());
    float b = 2.0 *oc.dot(oc, r.direction());
    float c = oc.dot(oc,oc) - radius*radius;
    float discriminant = b*b - 4*a*c;

    if(discriminant < 0){
        return -1.0;
    }
    else{
        return (-b-sqrt(discriminant))/(2.0*a);
    }
}
```
- 判别式<0，没有实根，返回-1。此处为什么返回-1，而不是0呢？
- 首先，这个函数返回的 **函数的根**，若返回0，即根是0，也就是光线的原点，所以有实际的物理意义，容易产生误会；
- 另外，返回-1，有的同志会说，-1也是实根啊，不会产生误解么？不会，因为t<0对于光线来说是没有意义的（即在光线起点的后面，这个是什么鬼？无实际意义）
- “-”表示返回的是较小的那个实根，也就是离光线起点较近的那个交点

```
vec3 color(const ray&r){
   float t = hit_sphere(vec3(0,0,-1), 0.5, r);
    if(t > 0.0){
       vec3 N = unit_vector(r.point_at_parameter(t) - vec3(0,0,-1));
       return 0.5*vec3(N.x()+1, N.y()+1, N.z()+1);
    }
}
```
t>0，表示有具有实际意义的根。r.point_at_parameter(t)通过t的值获得交点P的坐标，P的坐标减去球心的坐标即得到法向量，然后标准化后得到单位法向量，然后将单位法向量映射成色彩表。后面在main函数中对应设置具体的RGB值实现法向量的可视化。

---
回忆一下，一个球是怎么画的呢？

1. 第一步：光线撞上球。找“撞点”
2. 第二步：将“撞点”的像素位置设置为球的颜色。之前采用过两种方式设置颜色：
    1. 简单粗暴，将整个球的颜色设置为红色（return vec3(1, 0, 0)）；
    2. 将球面上每个像素位置的颜色设置为球在该点的单位法向量的色彩表映射值（每个点的法向量都不一样，所以，每个点的颜色被设置得不一样）。

所以，那么，现在怎么画多个球呢？也是先找撞点，再设置颜色。

1. 第一步：找撞点。一条光线和N个球的交点可能有0~2N个。之前画一个球时，我们取的是大于零的较小的那个根（因为只考虑球完全不透明）。所以，现在画多个球，我们取所有交点中大于零最小的那个交点（因为我们向前看，只能看到最近的那个交点，后面所有的交点都被一个球体或者多个球体挡住了。）。
2. 第二步：设置颜色。这个和画一个球时一样，设置为球在该点的单位法向量的色彩表映射值。这样的话，有个问题：球和球的相交边界处，两个球的颜色会不会很接近导致边界模糊呢？不会。因为，虽然交点坐标非常接近，但是球的法向量是等于交点坐标减去球心坐标。从而，每个球在边界点的法向量是不一样的。如果两个球的球心坐标相差较大时，法向量坐标也会相差比较大，颜色也会相差比较大。
    - 设置颜色思路如下：（多个球的各自的颜色和背景颜色）
    - 光线是否撞上球？是：设置为球的颜色；否：设置为背景颜色
    - 如果光线撞上了球。N个球，可能有2N撞点，到底哪一个撞点是有效的呢？可以被最终设置颜色呢？原则是：找出最近的撞点。
    - 怎么找？一个球一个球依次找。每个球可能有2个撞点，选出较近的有效的撞点。
    - 然后，从所有这些每个球的较近的有效的撞点中，选出最近的那个撞点。
