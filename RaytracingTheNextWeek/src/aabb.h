#ifndef AABB_H
#define AABB_H

#include "ray.h"
#include "hitable.h"

inline float ffmin(float a, float b) { return a < b ? a : b; }
inline float ffmax(float a, float b) { return a > b ? a : b; }

class aabb
{
public:
	aabb() {};
	aabb(const vec3& a, const vec3& b) { _min = a; _max = b; }

	// return bounding box pMin and pMax
	vec3 min() const { return _min; }
	vec3 max() const { return _max; }

	// ray-bound intersection, refactored with pbr book
	bool hit(const ray& r, float tmin, float tmax) const {
		// We compute intersection points with each slab in turn, progressively narrowing the parametric interval. 
		// Update interval for ith bounding box slab
		for (int i = 0; i < 3; i++) { // for each slab, 0/1/2
			// p(t) = A + tB
			// plane: x = x0
			// x0 = Ax + t0 * Bx,
			// t0 = (x0 - Ax) / Bx
			float invRayDir = 1 / r.direction()[i];
			float tNear = (_min[i] - r.origin()[i]) * invRayDir;
			float tFar = (_max[i] - r.origin()[i]) * invRayDir;

			// make sure t0 is the smaller of tNear & tFar, t1 is the larger
			float t0 = ffmin(tNear, tFar); // t0 = tNear < tFar ? tNear : tFar;
			float t1 = ffmax(tNear, tFar); // t1 = tNear > tFar ? tNear : tFar;
			
			// if (tNear > tFar) 
			//		std::swap(tNear, tFar);
			// tmin = tNear > t0 ? tNear : t0;
			// tmax = tFar < t1 ? tFar : t1;

			tmin = ffmax(t0, tmin);
			tmax = ffmin(t1, tmax);

			if (tmin >= tmax)
				return false;
		}
		return true;
	}

	// bounding box pMin and pMax
	vec3 _min;
	vec3 _max;
};

 inline aabb surrounding_box(aabb box0, aabb box1) { // inline, or move implementation to cpp, only leave the declaration in header!
	vec3 small(fmin(box0.min().x(), box1.min().x()),
		fmin(box0.min().y(), box1.min().y()),
		fmin(box0.min().z(), box1.min().z()));

	vec3 big(fmax(box0.max().x(), box1.max().x()),
		fmax(box0.max().y(), box1.max().y()),
		fmax(box0.max().z(), box1.max().z()));
	return aabb(small, big);
}
#endif // !AABB_H

