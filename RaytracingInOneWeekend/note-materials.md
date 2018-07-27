abstract material class
- produce a scattered ray (absorbed the incident ray)
- if scattered, how much ray attenuated

material will tell us how rays interact with the surface
hit_record is just a way to stuff a bunch of arguments into a struct so we can send them as a group

背景颜色和1中是一样的画法：将“（原始）光线的方向向量的标准向量的某一坐标（x、y、z都可以）”变换到（0，1）内，然后用变换后的值对两个固定颜色值进行插值，得到的结果便作为当前（原始）光线对应位置的颜色值。

球的颜色：（注意啦~）和背景颜色的画法非常类似，只是不是基于原始光线，而是基于“最后一次反射的反射光线”，另外再乘以每次反射系数的累计乘积。将“最后一次反射的反射光线的方向向量的标准向量的某一坐标（x、y、z都可以）”变换到（0，1）内，然后用变换后的值对两个固定颜色值进行插值，（再乘以每次反射系数的累计乘积）得到的结果便作为当前（原始）光线对应位置的颜色值。物理意义即是：原始光线和漫射材料球交点处呈现的颜色是最后一次反射光线“采集”的背景颜色经过（多次）随机的反射衰减后的颜色。

总结一下设置颜色的几种方法：

法1，设置固定颜色；

法2，原始光线的方向向量的映射；

法3，交点处法向量的映射；

法4，反射光线的方向向量的映射；
