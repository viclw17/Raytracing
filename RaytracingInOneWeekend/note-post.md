# Draw with Ray
## Simple Camera Model
The variation of the camera ray directions (one per pixel) form a volume" - the **view frustum** , and every ray provides a color value to its pixel to form the final image on a **clipping plane**.

<img src="https://www.techjay.com/wp-content/uploads/2017/10/film-projector-lens-and-light-footage-024706786_prevstill.jpeg" width="320"  style="display:block; margin:auto;">
<br>

<img src="http://www.falloutsoftware.com/tutorials/gl/perspective-transform-visual-diagram-opengl-3d-to-2d.png" width="320"  style="display:block; margin:auto;">
<br>

So to draw an image with raytracing, we need to:
1. Set a range of the directions of the camera rays. This define the size of the screen.
2. Set color value for the pixel of every rays. (for higher rendering quality we can shoot multiple rays per pixel and average the coloration for that pixel.)

In order to respect the convention of a **right-handed coordinate system**, the negative z-axis is pointing into the screen.
>For right-handed coordinates your right thumb points along the Z axis in the positive direction and the curl of your fingers represents a motion from the first or X axis to the second or Y axis. When viewed from the top or Z axis the system is counter-clockwise.

<img src="https://upload.wikimedia.org/wikipedia/commons/e/e2/Cartesian_coordinate_system_handedness.svg" width="320"  style="display:block; margin:auto;">
<div style="text-align:center">
Left-handed coordinates on the left Right-handed coordinates on the right.
</div>
<br>

Here we set the near clipping plane at -1 on the z-axis, and define the size of the screen with range from -2 to 2 on x-axis , and from -1 to 1 on y-axis.

```c
vec3 lower_left_corner(-2.0, -1.0, -1.0);
vec3 horizontal(4.0, 0.0, 0.0); // horizontal range
vec3 vertical(0.0, 2.0, 0.0);   // vertical range
vec3 origin(0.0, 0.0, 0.0);
```
And we can build the camera rays with **camera position** and the **pixel positions** on the clipping plane. After we have the rays, we can use it to trace the scene and produce color values to draw the final image.

https://img-blog.csdn.net/20170113235527142?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbGliaW5nX3plbmc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center

```c
// pixel amount on x and y axis
int nx = 200;
int ny = 100;

for (int j = ny-1; j >= 0; j--)
{
    for (int i = 0; i < nx; i++)
    {
        float u = float(i) / float(nx);
        float v = float(j) / float(ny);
        ray r(origin, lower_left_corner + u*horizontal + v*vertical);
        vec3 col = color(r);
        int ir = int (255.99*col[0]);
        int ig = int (255.99*col[1]);
        int ib = int (255.99*col[2]);
    }
}
```

---

```c
bool hit_sphere(const vec3& center, float radius, const ray& r){
    vec3 oc = r.origin() - center;
    float a = dot(r.direction(), r.direction());
    float b = 2.0 * dot(oc, r.direction());
    float c = dot(oc,oc) - radius*radius;
    float discriminant = b*b - 4*a*c;
    return (discriminant>0);
}

vec3 color(const ray& r){
    if(hit_sphere(vec3(0,0,-1), 0.5, r))
        return vec3(1,0,0);
    vec3 unit_direction = unit_vector(r.direction());
    t = 0.5*(unit_direction.y()+1.0); // -1~1 --> 0~1
    return (1.0-t)*vec3(1.0,1.0,1.0) + t*vec3(0.5,0.7,1.0); // lerp
}

int main()
{
    int nx = 200;
    int ny = 100;

    std::cout << "P3\n" << nx << " " << ny << "\n255\n";

    vec3 lower_left_corner(-2.0, -1.0, -1.0);
    vec3 horizontal(4.0, 0.0, 0.0);
    vec3 vertical(0.0, 2.0, 0.0);
    vec3 origin(0.0, 0.0, 0.0);

    for (int j = ny-1; j >= 0; j--)
    {
        for (int i = 0; i < nx; i++)
        {
            float u = float(i) / float(nx);
            float v = float(j) / float(ny);
            ray r(origin, lower_left_corner + u*horizontal + v*vertical);
            vec3 col = color(r);
            int ir = int (255.99*col[0]);
            int ig = int (255.99*col[1]);
            int ib = int (255.99*col[2]);
            std::cout << ir << " " << ig << " " << ib << "\n";
        }
    }
}
```
## Blend Mode
```blended_value = (1-t)*start_value + t*end_value```
https://en.wikipedia.org/wiki/Blend_modes

# Multisampling Antialiasing
