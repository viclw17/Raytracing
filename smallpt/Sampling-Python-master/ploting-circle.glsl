vec2 resolution = iResolution;
vec2 mouse      = iMouse;
float time      = iGlobalTime;

float timeScale = 3.;
float zoomOut = 5.;
const int iteration = 50;
float seed = 0.;

#define PI 3.14159265359

float rand() {
  return fract(sin(seed++)*43758.5453123);
}

vec2 random_spherical(vec2 uv) {
    // Correct Range [0;pi] [-pi;pi]
    float theta = uv.x * rand();
    float phi = (uv.y * rand() * 2.) - rand();
    // Switch to cartesian coordinates
    float x = sin(theta) * cos(phi);
    float y = cos(theta) * cos(phi);
    return vec2(x,y);
}

float grid(in float step, in float position, in float pixelWidth) {
    #define ALTERNATIONS 10.0
    float   m           = mod(position, step),
            distance    = min(m, step - m),
            intensity   = clamp(0.75 * pixelWidth / distance, 0.0, 1.0),
            alternation = mod(floor((position + 0.5 * step) / step), ALTERNATIONS);

    return intensity * (1.0 - (min(alternation, ALTERNATIONS - alternation) / (0.6 * ALTERNATIONS)));
}

vec3 mandelbrot(vec2 c) {
    const float B = 16.;
    float l = 0.0;
    vec2  z = vec2(0.0);
    for( int i=0; i<iteration; i++ )
    {
        // 1. z = z*z + c
        // z = vec2( z.x*z.x - z.y*z.y, 2.0*z.x*z.y ) + c;
        // 2. Shortcut
        z = mat2(z,-z.y,z.x) * z + c;
        if( dot(z,z)>(B*B) ) break;
        l += 1.0;
    }
    return vec3(l/(float(iteration)));
}

vec4 circle(vec2 uv, vec2 pos, float radius, vec3 color) {
	float d = length(pos - uv) - radius;
    // d= abs(d); // -1 is also white in color!!!
	float t = clamp(d, 0.0, 1.0); //d<0 is clamped to 0
    // return vec4(t);
	return vec4(color, 1.-t); // t=0 --> inside circle
}

vec2 ConcentricDiskSampling(vec2 p, float r){
    // Draw two uniform random numbers in the range [0,1)
    float R1 = p.x;//RAND(0,1);
    float R2 = p.y;//RAND(0,1);

    // Map these values to polar space (phi,radius)
    float phi = R1 * 2.*PI;
    float radius = R2 * r;

    // Map (phi,radius) in polar space to (x,y) in Cartesian space
    float x = cos(phi) * radius;
    float y = sin(phi) * radius;

    return vec2(x,y);
}


void main() {
    // Calculate & Normalize UV coordianates
    vec2 uv_normalized;
    // vec2 uv = gl_FragCoord.xy/iResolution.xy - .5 -.5;
    // uv.x *= iResolution.x / iResolution.y;
    // (0,1)
    // uv_normalized = ( gl_FragCoord.xy - .5*iResolution.xy ) / iResolution.y; // simplified
    uv_normalized = 2. * gl_FragCoord.xy / iResolution.xy - 1.;

    vec4 color;

    vec2 uv_raw = gl_FragCoord.xy;
	vec2 center = vec2(sin(time)*.5+.5,cos(time)*.5+.5)*iResolution.xy;
    center = mouse*resolution.xy;
    center = vec2(0);
	float radius = .1*iResolution.y;
	vec4 layer1 = vec4(0);
	vec4 layer2 = circle(uv_raw, center, radius, vec3(1,0,0));
    color = mix(layer1, layer2, layer2.a);
    // color = vec4(,0,1);
    // color = vec4(mandelbrot(uv_normalized*zoomOut),1);





    float   viewSize    = 5.,
            centerX     = 0.,
            left        = -viewSize + centerX,
            right       =  viewSize + centerX,
            top         =  viewSize,
            bottom      = -viewSize;
    // convert fragment's pixel position to graph space location
    float   locationX   = left   + (right - left) * gl_FragCoord.x / iResolution.x,
            locationY   = bottom + (top - bottom) * gl_FragCoord.y / iResolution.y;
            locationX  *= iResolution.x / iResolution.y;
    // calculate width of a pixel in graph space
    float   pixelWidth  = (right - left) / iResolution.x;

    float   gridColor   = 0.5 * grid(1.0, locationY, pixelWidth) +
                          0.5 * grid(1.0, locationX, pixelWidth);





    gl_FragColor = color+vec4(0,gridColor,gridColor,1);
}
