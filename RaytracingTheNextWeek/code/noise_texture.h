#ifndef NOISE_TEXTURE_H
#define NOISE_TEXTURE_H

#include "texture.h"
#include "perlin.h"

class noise_texture : public texture {
public:
	noise_texture() {}
	virtual vec3 value(float u, float v, const vec3& p) const {
		return vec3(1,1,1)*noise.noise(p);
	}
	perlin noise;
};
#endif