#ifndef CONSTANT_TEXTURE_H
#define CONSTANT_TEXTURE_H
#include "texture.h"

class constant_texture : public texture {
public:
	constant_texture() {}
	constant_texture(vec3 c) : color(c) {}

	// this is a const member function
	virtual vec3 value(float u, float v, const vec3& p) const {
		//test = 1; // bug! expression must be a modifiable lvalue, 
		// 'test' cannot be modified because it is being accessed through a const object (which is the const THIS pointer!)
		test2 = 1; // ok!

		return color;
	}

	vec3 color;
	int test;
	mutable int test2;
};
#endif // CONSTANT_TEXTURE_H

