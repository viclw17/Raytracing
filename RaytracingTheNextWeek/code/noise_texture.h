#ifndef NOISE_TEXTURE_H
#define NOISE_TEXTURE_H

#include "texture.h"
#include "perlin.h"

class noise_texture : public texture {
public:
	noise_texture() {}
	noise_texture(float sc) :scale(sc) {}
	virtual vec3 value(float u, float v, const vec3& p) const {
		// return vec3(1.0,1.0,1.0)*perlin_noise.noise(scale*p);
		return vec3(1, 1, 1)*0.5*(1 + perlin_noise.noise(scale * p)); // scale and bias! make sure >0!
	}
	perlin perlin_noise;
	float scale;
};
#endif