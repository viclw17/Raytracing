#ifndef PERLIN_H
#define PERLIN_H

#include <math.h> // M_PI

float drand48() {
	return (rand() % (100) / (float)(100));
}

inline float trilinear_interp(float c[2][2][2], float u, float v, float w) {
	float accum = 0;
	for (int i = 0; i < 2; i++)
		for (int j = 0; j < 2; j++) 
			for (int k = 0; k < 2; k++) 
				accum +=
					(i*u + (1 - i)*(1 - u)*
					(j*u + (1 - j)*(1 - v)*
					(k*u + (1 - k)*(1 - w)*c[i][j][k];
	return accum;
}

class perlin {
public:
	float noise(const vec3& p) const {
		float u = p.x() - floor(p.x());
		float v = p.y() - floor(p.y());
		float w = p.z() - floor(p.z());
		int i = int(4 * p.x()) & 255;
		int j = int(4 * p.y()) & 255;
		int k = int(4 * p.z()) & 255;
		// add lerp to smooth out
		//int i = floor(p.x());
		//int j = floor(p.y());
		//int k = floor(p.z());
		return ranfloat[perm_x[i] ^ perm_y[j] ^ perm_z[k]];
	}
	static float *ranfloat;
	static int *perm_x;
	static int *perm_y;
	static int *perm_z;
};

static float* perlin_generate() {
	float * p = new float[256];
	for (int i = 0; i < 256; ++i)
		p[i] = drand48();
	return p;
}

void permute(int *p, int n) {
	for (int i = n - 1; i > 0; i--) {
		int target = int(drand48()*(i + 1));
		int temp = p[i];
		p[i] = p[target];
		p[target] = temp;
	}
	return;
}

static int* perlin_generate_perm() {
	int*p = new int[256];
	for (int i = 0; i < 256; i++)
		p[i] = i;
	permute(p, 256);
	return p;
}

float *perlin::ranfloat = perlin_generate();
int *perlin::perm_x = perlin_generate_perm();
int *perlin::perm_y = perlin_generate_perm();
int *perlin::perm_z = perlin_generate_perm();
#endif