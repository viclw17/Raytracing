// re-map shadertoy variables
vec2 resolution = iResolution;
vec2 mouse      = iMouse;
float time      = iGlobalTime;

// Two structs are used. Ray structs represent light rays. In this example
// a simple ray struct is used with only two fields. More fields are used in
// more advanced ray tracers.

// Ray represents a ray of light's origin and direction
struct Ray {
	vec3 origin; // Origin
	vec3 direction; // Direction
};

// Sphere represents of centre and radius of a sphere
struct Sphere {
	vec3 center;  // Center
	float radius; // Radius
};

vec4 diffuse(in vec3 surface, in vec3 center, in vec4 color, in vec3 litePos) {
	// Surface normal
	vec3 n = normalize(surface - center);

	// Light direction from surface
	vec3 l = normalize(litePos - surface);

	// The diffuse equation
	return color * max(0.0, dot(n, l));
}

// https://en.wikipedia.org/wiki/Line%E2%80%93sphere_intersection
float intersectSphere(in Ray ray, in Sphere sphere) {
	// Sphere center to ray origin
	vec3 co = ray.origin - sphere.center;

	// The discriminant is negative for a miss, or a postive value
	// used to calcluate the distance
	float discriminant = dot(co, ray.direction) * dot(co, ray.direction)
			- (dot(co, co) - sphere.radius * sphere.radius);

	// If answer is not negative, calculate the origin-surface distance
	if (discriminant >= 0.0)
		return -dot(ray.direction, co) - sqrt(discriminant); //
	else
		return -1.; // Any negative number to indicate no intersect
}

//void mainImage( out vec4 fragColor, in vec2 fragCoord ) {
/*
https://www.shadertoy.com/howto
Image shaders implement the mainImage() function in order to generate the procedural images by computing a color for each pixel.
This function is expected to be called once per pixel, and it is responsability of the host application to provide the right inputs to it and
get the output color from it and assign it to the screen pixel. The prototype is:void mainImage( out vec4 fragColor, in vec2 fragCoord );
where fragCoord contains the pixel coordinates for which the shader needs to compute a color.
The coordinates are in pixel units, ranging from 0.5 to resolution-0.5, over the rendering surface,
where the resolution is passed to the shader through the iResolution uniform (see below).
The resulting color is gathered in fragColor as a four component vector, the last of which is ignored by the client.
The result is gathered as an "out" variable in prevision of future addition of multiple render targets.
*/

// fragColor = gl_FragColor
// fragCoord = gl_FragColor

// function main takes no parameters and returns no values.
void main(){
	/*
	 fragCoord represents the centre of a pixel.
	 For example, a resolution of 800Ã—600, the bottom-left pixel would
	 be (0.5,0.5) and the top-right pixel would be (799.5, 599.5).
	 */

	// Converting all coordinates (x,y) to be in the range [0,1]
	float x = gl_FragCoord.x / iResolution.x; // iResolution.x is width in pixels
	float y = gl_FragCoord.y / iResolution.y; // iResolution.y is height in pixels

	// Now convert from coordinate range [0,1] to [-1,1]
	// This moves pixel (0,0) to the middle of the screen
    // This coordinate system is a common convention
	x = x * 2.0 - 1.0;
	y = y * 2.0 - 1.0;
    y = y * (iResolution.y/iResolution.x);

    // For raytracing, we need a ray - i.e. a direction and a point of origin
    // The direction is the pixel position minus the eye postition,
    // which is normalized.
    // Normailizing makes rayDir a unit of distance (as well as direction)

	// The pixel position in 3D space - i.e. the z value, 0.0, is the plane of the screen.
	vec3 pixelPos = vec3(x, y, 0);

    // The eye position in this example is fixed.
    vec3 eyePos = vec3(0, 0, -4); // Some distance in front of the screen

	// The ray for the raytrace - which is just intersectSphere in this tutorial
	vec3 rayDir = normalize(pixelPos - eyePos);

    Sphere sphere = Sphere(vec3(0.0, 0.0, 7.0), 1.0); // Position and size of sphere

	// Does rayDirUnit ray from ndcEye intersect the sphere?
	float eyeToSphere = intersectSphere(Ray(eyePos, rayDir), sphere);

	// If positive, then we draw a pixel of the sphere
	if (eyeToSphere >= 0.)
	{
		// Choose a diffuse colour
		vec4 diffuseColour =  vec4(0.,1.,1.,1);

		// Choose an ambient colour
		vec4 ambientColour =  vec4(0.2,0.,0.,1);

        // Position of a white light
        vec3 litePos = vec3(3., 0., 0.);

		gl_FragColor = ambientColour + diffuse(eyePos + eyeToSphere * rayDir, sphere.center, diffuseColour, litePos);

	} else
        // Otherwise we draw the colour of the background
		gl_FragColor = vec4(0, 0, 0, 1);
}
