# Whitted Ray Tracer
No GI

This integrator accurately computes reflected and transmitted light from specular surfaces like glass, mirrors, and water, 
although it doesn’t account for other types of indirect lighting effects like light bouncing off a wall and illuminating a room. 

⟨WhittedIntegrator Declarations⟩ ≡
class WhittedIntegrator : public SamplerIntegrator { 
public:
    ⟨WhittedIntegrator Public Methods⟩ 
private:
    ⟨WhittedIntegrator Private Data⟩ 
};

## Classes

### Vec3f
#### Constructors
1. all zero
2. Vec3f(x)
3. Vec3f(x,y,z)
#### Functions
mult - scaler or vector
subtract
add
Compound Assignment Operators +=
negate
#### Friend function
friend Vec3f operator * (const float &r, const Vec3f &v)
scaler * vector
IO function

Vec3f normalize(const Vec3f &v)
float dotProduct(const Vec3f &a, const Vec3f &b)
Vec3f crossProduct(const Vec3f &a, const Vec3f &b)
float clamp(const float &lo, const float &hi, const float &v)
float deg2rad(const float &deg)
Vec3f mix(const Vec3f &a, const Vec3f& b, const float &mixValue)


### Light
position
intensity


### Object
abstract base class
#### Pure Virtual Functions
virtual bool intersect(const Vec3f &, const Vec3f &, float &, uint32_t &, Vec2f &) const = 0;
virtual void getSurfaceProperties(const Vec3f &, const Vec3f &, const uint32_t &, const Vec2f &, Vec3f &, Vec2f &) const = 0;
#### Virtual
virtual Vec3f evalDiffuseColor(const Vec2f &) const { return diffuseColor; }
#### data
material type
ior
kd,ks
diffuse color
spec exp

bool solveQuadratic(const float &a, const float &b, const float &c, float &x0, float &x1)



## Material Type Enum


## Image Info 
struct Options
{
    uint32_t width;
    uint32_t height;
    float fov;
    float imageAspectRatio;
    uint8_t maxDepth;
    Vec3f backgroundColor;
    float bias;
};