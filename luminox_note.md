# Ray class
class Ray {
  public:
    Vec3 origin;
    Vec3 direction;
    float tmin;
    float tmax;

    Ray() {};
    Ray(const Vec3& _origin, const Vec3& _direction) : 
      origin(_origin), 
      direction(_direction), 
      tmin(0.001), 
      tmax(1e9) {};

    Vec3 operator()(float t) const { // operator override
      return (origin + t*direction);
    };
};



# Primitive class
a shape with material; could be a light
it will deal with generic intersect test regardless shape type

btw Shape is abstract, could be sphere or plane - polymorphism!

public:
  std::shared_ptr<Shape> shape;
  std::shared_ptr<Material> material;
  std::shared_ptr<AreaLight> light;

bool hasLight() const {};
bool intersect(const Ray& ray, Hit& res) const {};

bool intersect(const Ray& ray, Hit& res) const {
  Hit tmp;
  if(shape->intersect(ray, tmp)) {
    res = tmp;
    res.hitPrimitive = this;
    return true;
  }
  else {
    return false;
  }
};
^ note:
supply a ref to a **Ray** object, res
supply a ref to a **Hit** object
create a temp Hit object tmp,
if shape->intersect(ray, tmp) passed, tmp Hit will be passed to res Hit



# Hit class
record hit result: ray t, position, normal, and hit primitive object
class Hit {
  public:
    float t; // hit at which distance on the ray?
    Vec3 hitPos;
    Vec3 hitNormal;
    const Primitive* hitPrimitive; // a pointer to the hit primitive

    Hit() {}; 
};




# Shape class
class Shape {
  public:
    virtual bool intersect(const Ray&, Hit& res) const = 0;
    virtual Vec3 sample(const Hit& res, Sampler& sampler, float& pdf_A) const = 0;
};

**Shape** is a pure virtual class/abstract class
intersect() is pure virtual function
sample() is pure virtual

**Sphere : Shape** is implementing the Shape class
Sphere(const Vec3& _center, float _radius)

Sphere :: intersect(const Ray& ray, Hit& res)
is checking intersect result and save hit result in the supplied referenced Hit object 

Sphere :: sample(const Hit& res, Sampler& sampler, float& pdf_A)
supplied with Hit result, a sampler, a pdf_A
return a 

# Material class
request a pointer to a texture object

class Material {
  public:
    std::shared_ptr<Texture> texture;

    Material(const std::shared_ptr<Texture>& _tex) : texture(_tex) {};

    virtual Vec3 sample(const Vec3& wo_local, const Hit& res, Sampler& sampler, Vec3& wi_local, float& pdf_w) const = 0;
    virtual Vec3 BRDF(const Hit& res, const Vec3& wo_local, const Vec3& wi_local) const = 0;
};
class Diffuse : public Material
class Mirror : public Material
class Glass : public Material


# Sampler class
class Sampler { // abstract class
  public:
    virtual float getNext() = 0;
};

class UniformSampler : public Sampler {
  public:
    std::random_device rnd_dev;
    std::mt19937 mt;
    std::uniform_real_distribution<float> dist;

    UniformSampler() {
      mt.seed(rnd_dev()); // get a random seed on object creation
      dist = std::uniform_real_distribution<float>(0, 1);
    };

    float getNext() {
      return dist(mt); // offer seed mt, return a uniform distributed random num btw 0 and 1
    };
};

inline function, include header can just call, no need to call from an object
return a vector on the hemisphere/sphere
inline Vec3 sampleCosineHemisphere(float u, float v, float& pdf) 
inline Vec3 sampleUniformHemisphere(float u, float v, float& pdf) 
inline Vec3 sampleUniformSphere(float u, float v, float& pdf)




# Integrator class
ABC - abstract base class
requires an image object - write ppm
a camera object - Ray ray = camera->getRay(u, v);
a sampler object - get random number
sampler->getNext()

class Integrator {
  public:
    std::shared_ptr<Image> image;
    std::shared_ptr<Camera> camera;
    std::shared_ptr<Sampler> sampler;

    Integrator(
    const std::shared_ptr<Image>& _image, 
    const std::shared_ptr<Camera>& _camera, 
    const std::shared_ptr<Sampler>& _sampler) : 
    image(_image), camera(_camera), sampler(_sampler) {};

    virtual Vec3 integrate(const Ray& ray, const Scene& scene) = 0;
};

class PurePathTracing : public Integrator {
  public:
    int samples;
    int maxDepth;
  PurePathTracing(){}
  Vec3 integrate(const Ray& initRay, const Scene& scene){}
  void render(const Scene& scene){}
};


Vec3 integrate(const Ray& initRay, const Scene& scene) {
  Ray ray = initRay;
  
  Vec3 throughput(1, 1, 1); // T
  Vec3 accumulated_color(0, 0, 0); // L
  float roulette = 1;

  for(int i = 0; i < maxDepth; i++) {

    //Russian Roulette
    if(sampler->getNext() > roulette) {
      break;
    }
    else {
      throughput /= roulette;
      roulette *= 0.99;
    }

    Hit res;
    
    if(scene.intersect(ray, res)) {
    
      //When ray hits arealight
      if(res.hitPrimitive->hasLight()) {
        accumulated_color += throughput * res.hitPrimitive->light->Le();
      }

      //Generate Local Coordinate Vectors
      Vec3 n = res.hitNormal;
      Vec3 s, t;
      orthonormalBasis(n, s, t);
      Vec3 wo = -ray.direction;
      Vec3 wo_local = world2local(wo, s, n, t);

      //BRDF Sampling
      auto mat = res.hitPrimitive->material;
      Vec3 wi_local;
      float pdf_w;
      Vec3 brdf_value = mat->sample(wo_local, res, *sampler, wi_local, pdf_w);

      //Update throughput
      throughput *= brdf_value * absCosTheta(wi_local) / pdf_w;

      //Generate Next Ray
      Vec3 wi = local2world(wi_local, s, n, t);
      ray = Ray(res.hitPos, wi);
    }
    //When ray hits sky
    else {
      accumulated_color += throughput * Vec3(1, 1, 1);
      break;
    }
  }
  return accumulated_color;
};





# Image class
class Image {
  public:
    int width;
    int height;
    Vec3* pixels; // a pointer to a vec3, pixel rgb

    Image(int _width, int _height) : width(_width), height(_height) {
      pixels = new Vec3[width*height]; // new a block of memory to store image pixels
    };
    ~Image() {
      delete[] pixels;
    };

    Vec3 getPixel(int i, int j) const {};
    void setPixel(int i, int j, const Vec3& c) {};
    void addPixel(int i, int j, const Vec3& c) {};
    void divide(float k) {};
    void ppm_output(const std::string& filename) const {};
};

method to divide final pixel by sample amount to avoid blow out
void divide(float k) {
  for(int i = 0; i < height; i++) {
    for(int j = 0; j < width; j++) {
      pixels[j + i*width] /= k;
    }
  }
};

