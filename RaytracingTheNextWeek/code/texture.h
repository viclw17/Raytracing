#ifndef TEXTURE_H
#define TEXTURE_H
//#include "vec3.h"

// a big refactoring of colors
class texture {
public:
	virtual vec3 value(float u, float v, const vec3& p) const = 0;
	// still need to look into const...
};
#endif //TEXTURE_H