#include "material.h"
#include "metal.h"
//#include "log.h"

bool refract(const vec3& v, const vec3& n, float ni_over_nt, vec3& refracted) {
    // 该函数计算折射光线的方向向量。
    // ni_over_nt为入射介质的折射指数和折射介质的折射指数的比值
    vec3 uv = unit_vector(v);
    float dt = dot(uv, n);
    float discriminat = 1.0 - ni_over_nt * ni_over_nt * (1-dt*dt);
    if(discriminat > 0){
        refracted = ni_over_nt * (uv-n*dt) - n*sqrt(discriminat);
        return true;
    }
    else
        // 根号里面的内容小于零，说明折射光线的方向向量无实根，即没有折射光线，即出现全反射。
        return false;
}

float schlick(float cosine, float ref_idx) {
    /*这个函数是实现Schlick's approximation。其中ref_idx=n2/n1*/
    float r0 = (1-ref_idx) / (1+ref_idx);
    r0 = r0*r0;
    return r0 + (1-r0)*pow((1-cosine),5);
}

class dielectric : public material {
public:
    dielectric(float ri) : ref_idx(ri) {}
    
//    virtual bool scatter(const ray& r_in, const hit_record& rec, vec3& attenuation, ray& scattered) const;
    
    bool scatter(const ray& r_in,
                 const hit_record& rec,
                 vec3& attenuation,
                 ray& scattered
                 ) const {
        
        vec3 outward_normal;
        // reflected
        vec3 reflected = reflect(r_in.direction(), rec.normal);
        // ni_over_nt为入射介质的折射指数和折射介质的折射指数的比值
        float ni_over_nt;
        attenuation = vec3(1.0,1.0,1.0);
        vec3 refracted;
        float reflect_prob;
        float cosine;
        // 光线是从球体内部射入空气
        // 所以，入射时的法向量和球的法向量方向相反；
        // 注意，ref_idx是指光密介质的折射指数和光疏介质的折射指数的比值，
        // 此时入射介质是光密介质，折射介质是光疏介质，所以ni_over_nt = ref_idx
        if (dot(r_in.direction(), rec.normal) > 0){
            outward_normal = -rec.normal;
            ni_over_nt = ref_idx;
            cosine = ref_idx * dot(r_in.direction(), rec.normal) /r_in.direction().length();
        }
        // 光线是从空气射入球体气
        // 所以，入射时的法向量和球的法向量方向同向；
        // 注意，ref_idx是指光密介质的折射指数和光疏介质的折射指数的比值，
        // 此时入射介质是光疏介质，折射介质是光密介质，所以ni_over_nt = 1.0/ref_idx
        else{
            outward_normal = rec.normal;
            ni_over_nt = 1.0 / ref_idx;
            cosine = -dot(r_in.direction(), rec.normal) / r_in.direction().length();
        }
        
        if(refract(r_in.direction(), outward_normal, ni_over_nt, refracted)){
            // scattered = ray(rec.p, refracted); // refracted
            reflect_prob = schlick(cosine, ref_idx);
        }
        // 出现全反射
        else{
            scattered = ray(rec.p, reflected); // reflected
            // return false;
            reflect_prob = 1.0;
        }
        
        if(drand48() < reflect_prob) {
            scattered = ray(rec.p, reflected);
        }
        else {
            scattered = ray(rec.p, refracted);
        }
        return true;
    }

    float ref_idx;
};
