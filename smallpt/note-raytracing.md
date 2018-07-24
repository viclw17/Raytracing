# Sampling techniques
- Uniform
- Random
- Jittered
## Random Sampling
Pick a random point within the area being sampled
## Filtering
- Box
    - Simply means all samples are weighted equally
    - For each sample, add ray contribution to the color of the pixel
    - Pixel will likely end up with > 1 intensity
    - Then divide color by num_samples – then clamp to 0 .. 1
- Triangle
    - More difficult than the above, but not terribly (requires samples outside pixel)
- Gaussian
    - Same infrastructure as triangle filter, different math

```c
for(pixels)
    for(num_samples)
        camera.makeRay(ray, x, y) // x and y have been randomly permuted
        bvh.intersect(hit, ray)
        result += shade(...) // +=, not =
result /= num_samples // box filter
image.set(i, j, result);
 ```
# Global Illumination
## Path Tracing
Pure path tracing is the most naïve solution to global illumination – Also the most elegant (my opinion)
### Path tracing for Lambertian shading
- Cast a ray from the camera
- Multiply attenuation by material
    - From that point, cast exactly 1 ray in a random direction
- Repeat step 2 until light source is hitFinal
- color = attenuation * emitted light
### Random reflection direction
### Orthonormal basis
- First, we need to find a set of orthogonormal axes based on the normal. This will be sort of like a “camera”.
- Set the Z axis in our new basis equal to the normal
- Find any X and Y orthogonal to Z and unit length (“orthonormal”)

Remember, cross product returns a vector that is perpendicular to both input vectors

Vector Z = normal;
cross(normal, any vector); //Pick one of (1, 0, 0), (0, 1, 0), (0, 0, 1)

- This result will be perpendicular to the normal
- But what if the vector we pick is parallel to the normal? Result will be zero vector

Choose axis with smallest component in normal
```c
if(N.x < N.y && N.x < N.z)
    { axis = vec(1.0f, 0.0f, 0.0f); }
else if (N.y < N.z)
    { axis = vec(0.0f, 1.0f, 0.0f); }
else
    { axis = vec(0.0f, 0.0f, 1.0f); }
 ```
Last axis is cross product of other two
```c
X = normal.cross(axis).normalize()
Y = normal.cross(x)
```
Now we have a new axis system
- X and Y are tangent to the surface
- Z is normal to the surface

### Hemisphere sampling
http://www.rorydriscoll.com/2009/01/07/better-sampling/
http://l2program.co.uk/900/concentric-disk-sampling
https://blog.thomaspoulet.fr/uniform-sampling-on-unit-hemisphere/

Pick a random vector on the unit hemisphere defined by our new basis
- Option 1:
    - Define the “hemicube” (half cube) on the surface
    - Randomly pick points inside the cube until we get one that is inside the hemisphere
    - Will be uniformly distributed (actually a bad thing)
- Option 2:
    - Randomly pick points on the unit disc
    - Project out to hemisphere
    - Not uniformly distributed (more later)

Pick random point inside the unit disc:
```c
do{
    u = trax_rand();      
    v = trax_rand();
    u *= 2.0f;
    u -= 1.0f;
    v *= 2.0f;
    v -= 1.0f;
    u2 = u * u;
    v2 = v * v;
    }
while((u2 + v2) >= 1.0f);
```
We now have a vector (u, v) on the (X, Y) plane
Need to project up Z axis to make unit length (this will be a point on unit hemisphere)
We know length needs to be 1.0
- w=sqrt(1–u2 –v2)
- refDir=(X*u)+(Y*v)+(normal*w)

### Cosine weighting
This generates samples weighted more heavily towards the **normal**
- Specifically, weighted by the cosine of the angle between the reflected ray and the normal
- Lambertian shading says we should multiply incoming light by cosine of angle
    - With samples cosine-weighted, we don’t need to

# Sampling
_[Source](https://support.solidangle.com/display/A5AFHUG/Sampling)_
<img src="https://support.solidangle.com/download/attachments/35457925/image2013-11-29%2011%3A7%3A24.png?version=1&modificationDate=1385719338000&api=v2" width="480"  style="display:block; margin:auto;">

---
# Reddit
"Sampling on a shape" means picking a random point inside that shape. Generally you want to do this so that the random points you pick are, on average, spread evenly over the area or volume of the shape, so that no part of the shape is more likely to have a point picked inside of it.

Sampling is done when you want to estimate something that you can't calculate exactly. Basically it means "do it a bunch of times and look at the average".

It's like if you wanted to know the average sunlight in your garden. You can't know the exact answer, but you could still measure the sun in a bunch of places around the yard, and take the average of your measurements. But you don't want to bias your estimate, for example, by taking more measurements under the shade of a tree or a trellis, and fewer in the sunshine of your lawn-- this would skew the average. So you try and take your measurements evenly around the yard.

One way you could do this is by taking measurements exactly one foot apart. That would be pretty good (much better than measuring only once, say, by the birdbath), but imagine now that you have a trellis over your patio, and the slats are exactly one foot apart. If your first measurement is in shade, the so will the second one, and the third, and so on. Even if the patio is in 80% sun, by mistake you put all your patio measurements in the shade of a slat (because the spacing of your measurements lines up with the spacing of the slats), and so would wrongly conclude that your patio is completely shadowed.

That's why you would want to add randomness to your sample positions-- You want to eliminate the possibility that your measurements line up with any meaningful patterns and cancel them out or exaggerate them. So you want a pattern that is random, but evenly distributed. If your yard was a rectangle, then you would want to choose your measurement locations by "sampling on the rectangle". If your yard was a circle, then you would choose by "sampling on the circle".

This example-- figuring out the fraction of a region in shadow-- is directly analogous to the calculations necessary to compute lighting in a physically-based render.

---






# Path Tracing
The integral (the $\int_{\Omega}$ at the front and the $\mathrm{d}\omega_i$ at the back) just means that we are going to take the result of everything between those two symbols, and **add them up for every point in a hemisphere**, multiplying each value by the fractional size of the point’s area for the hemisphere. The hemisphere we are talking about is the positive hemisphere surrounding the normal of the surface we are looking at.

One of the reasons things get harder at this point is that there are an infinite number of points on the hemisphere.

Let’s ignore the integral for a second and talk about the rest of the equation. In other words, lets consider only one of the points on the hemisphere for now.

- $f(\omega_i, \omega_o)$ – This is the “Bidirectional reflectance distribution function”, otherwise known as the BRDF. It describes how much light is reflected towards the view direction, of the light coming in from the point on the hemisphere we are considering.
- $L_i(\omega_i)$ – This is how much light is coming in from the point on the hemisphere we are considering.
- $(\omega_i \cdot n)$ – This is the cosine of the angle between the point on the hemisphere we are considering and the surface normal, gotten via a dot product. What this term means is that as the light direction gets more perpendicular to the normal, light is reflected less and less. This is based on the actual behavior of light and you can read more about it here if you want to: Wikipedia: Lambert’s Cosine Law.

So what this means is that for a specific point on the hemisphere, we find out how much light is coming in from that direction, multiply it by how much the **BRDF** says light should be reflected towards the view direction from that direction, and then **apply Lambert’s cosine law** to make light dimmer as the light direction gets more perpendicular with the surface normal (more parallel with the surface).

Bringing the integral back into the mix, we have to **sum up** the results of that process for each of the infinite points on the hemisphere, **multiplying** each value by the fractional size of the point’s area for the hemisphere. When we’ve done that, we have our answer, and have our final pixel color.

This is where **Monte Carlo integration** comes in. Since we can’t really sum the infinite points, multiplied by their area (which is infinitely small), we are instead going to take a lot of random samples of the hemisphere and average them together. The more samples we take, the closer we get to the actual correct value. Not too hard right?

Now that we have the problem of the infinite points on the hemisphere solved, we actually have a second infinity to deal with.

The light incoming from a specific direction (a point on the hemisphere) is just the amount of light leaving a different object from that direction. So, to find out how much light is coming in from that direction, you have to find what object is in that direction, and calculate how much light is leaving that direction for that object. The problem is, the amount of light leaving that direction for that object is in fact calculated using the rendering equation, so it in turn is based on light leaving a different object and so on. It continues like this, possibly infinitely, and even possibly in loops, where light bounces between objects over and over (like putting two mirrors facing eachother). We have possibly infinite recursion!

The way this is dealt with in path tracers is to just limit the maximum amount of bounces that are considered. Higher numbers of bounces gives diminishing returns in general, so usually it’s just the first couple of bounces that really make a difference. For instance, the images at the top of this post were made using 5 bounces.

## The Algorithm
Now that we know how the rendering equation works, and what we need to do to solve it, let’s write up the algorithm that we perform for each pixel on the screen.

1. First, we calculate the camera ray for the pixel.
2. If the camera ray doesn’t hit an object, the pixel is black.
3. If the camera ray does hit an object, the pixel’s color is determined by how much light that object is emitting and reflecting down the camera ray.
4. To figure out how much light that is, we choose a random direction in the hemisphere of that object’s normal and recurse.
5. At each stage of the recursion, we return: ```EmittedLight + 2 * RecursiveLight * Dot(Normal, RandomHemisphereAngle) * SurfaceDiffuseColor```.
6. If we ever reach the maximum number of bounces, we return black for the RecursiveLight value.

We do the above multiple times **per pixel** and average the results together. The more times we do the process (the more samples we have), the closer the result gets to the correct answer.

By the way, the multiplication by 2 in step five is a byproduct of some math that comes out of integrating the BRDF. Check the links i mentioned at the top of the post for more info, or you can at least verify that I’m not making it up by seeing that wikipedia says the same thing. There is also some nice psuedo code there! [Wikipedia: Path Tracing: Algorithm](https://en.wikipedia.org/wiki/Path_tracing#Algorithm)

```c
Color TracePath(Ray r, depth) {
    if (depth == MaxDepth) {
      return Black;  // Bounced enough times.
    }

    r.FindNearestObject();
    if (r.hitSomething == false) {
      return Black;  // Nothing was hit.
    }

    Material m = r.thingHit->material;
    Color emittance = m.emittance;

    // Pick a random direction from here and keep going.
    Ray newRay;
    newRay.origin = r.pointWhereObjWasHit;
    newRay.direction = RandomUnitVectorInHemisphereOf(r.normalWhereObjWasHit);  // This is NOT a cosine-weighted distribution!
    // Probability of the newRay
    const float p = 1/(2*M_PI);

    // Compute the BRDF for this ray (assuming Lambertian reflection)
    float cos_theta = DotProduct(newRay.direction, r.normalWhereObjWasHit);
    Color BRDF = m.reflectance / M_PI ;

    Color incoming = TracePath(newRay, depth + 1);

    // Apply the Rendering Equation here.
    return emittance + (BRDF * incoming * cos_theta / p);
  }
```

## Calculating Camera Rays
There are many ways to calculate camera rays, but here’s the method I used.

In this post we are going to path trace using a pin hole camera. In a future post we’ll switch to using a lens to get interesting lens effects like depth of field.

To generate rays for our pin hole camera, we’ll need an eye position, a target position that the eye is looking at, and an imaginary grid of pixels between the eye and the target.

This imaginary grid of pixels is what is going to be displayed on the screen, and may be thought of as the “near plane”. If anything gets between the eye and the near plane it won’t be visible.

To calculate a ray for a pixel, we get the direction from the eye to the pixel’s location on the grid and normalize that. That gives us the ray’s direction. The ray’s starting position is just the pixel’s location on that imaginary grid.

<img src="https://www.scratchapixel.com/images/upload/ray-tracing-camera/ray1.png" width="240" style="display:block; margin:auto;">
<div style="text-align:center">
<a href="https://www.scratchapixel.com/lessons/3d-basic-rendering/ray-tracing-generating-camera-rays">click for source</a>
</div>
<br>
I’ll explain how to do this below, but keep in mind that the example code also does this process, in case reading the code is easier than reading a description of the math used.

First we need to figure out the orientation of the camera:

1. Calculate the camera’s **forward direction** by normalizing (Target – Eye).
2. To calculate the camera’s **right vector**, cross product the forward vector with (0,1,0).
3. To calculate the camera’s **up vector**, cross product the forward vector with the right vector.

Note that the above assumes that there is no roll (z axis rotation) on the camera, and that it isn’t looking directly up.

Next we need to figure out the size of our near plane on the camera’s x and y axis. To calculate this, we have to define both a near plane distance (I use 0.1 in the sample code) as well as a horizontal and vertical field of view (I use a FOV of 40 degrees both horizontally and vertically, and make a square image, in the sample code).

You can get the size of the window on each axis then like this:

1. WindowRight = tangent(HorizontalFOV / 2) * NearDistance
2. WindowTop = tangent(VerticalFOV / 2) * NearDistance

**Note that we divide the field of view by 2 on each axis because we are going to treat the center of the near plane as (0,0). This centers the near plane on the camera.**

Next we need to figure out where our pixel’s location is in world space, when it is at pixel location (x,y):

1. Starting at the camera’s position, move along the camera’s forward vector by whatever your **near plane distance** is (I use a value of 0.1). This gets us to the center of the imaginary pixel grid.
2. Next we need to figure out what percentage on the X and Y axis our pixel is. This will tell us what percentage on the near plane it will be. We divide x by ScreenWidth and y by ScreenHeight. We then put these percentages in a [-1,1] space by multiplying the percentages by 2 and subtracting 1. We will call these values u and v, which equate to the x and y axis of the screen.
3. Starting at the center of the pixel grid that we found, we are going to move along the camera’s right vector a distance of u and the camera’s up vector a distance of v.

We now have our pixel’s location in the world.

Lastly, this is how we calculate the ray’s position and direction:

1. RayDir = normalize(PixelWorld – Eye)
2. RayStart = PixelWorld

We now have a ray for our pixel and can start solving eg ray vs triangle equations to see what objects in the scene our ray intersects with.

That’s basically all there is to path tracing at a high level. Next up I want to talk about some practical details of path tracing.
