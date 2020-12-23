#ifndef math_h
#define math_h

static const float kInfinity = std::numeric_limits<float>::max();
static const float kEpsilon = 1e-8;
template <> const Matrix44f Matrix44f::kIdentity = Matrix44f();


// Compute the roots of a quadratic equation
bool solveQuadratic(const float &a, const float &b, const float &c, float &x0, float &x1)
{
    float discr = b * b - 4 * a * c;
    if (discr < 0) return false;
    else if (discr == 0) {
        x0 = x1 = - 0.5 * b / a;
    }
    else {
        float q = (b > 0) ?
            -0.5 * (b + sqrt(discr)) :
            -0.5 * (b - sqrt(discr));
        x0 = q / a;
        x1 = c / q;
    }

    return true;
}

void createCoordinateSystem(const Vec3f &N, Vec3f &Nt, Vec3f &Nb)
{
    if (std::fabs(N.x) > std::fabs(N.y))
        Nt = Vec3f(N.z, 0, -N.x) / sqrtf(N.x * N.x + N.z * N.z);
    else
        Nt = Vec3f(0, -N.z, N.y) / sqrtf(N.y * N.y + N.z * N.z);
    Nb = N.crossProduct(Nt);
}

Vec3f uniformSampleHemisphere(const float &r1, const float &r2)
{
    // cos(theta) = u1 = y
    // cos^2(theta) + sin^2(theta) = 1 -> sin(theta) = srtf(1 - cos^2(theta))
    float sinTheta = sqrtf(1 - r1 * r1);
    float phi = 2 * M_PI * r2;
    float x = sinTheta * cosf(phi);
    float z = sinTheta * sinf(phi);
    return Vec3f(x, r1, z);
}

inline
float clamp(const float &lo, const float &hi, const float &v)
{ return std::max(lo, std::min(hi, v)); }

inline
float deg2rad(const float &deg)
{ return deg * M_PI / 180; }

inline
Vec3f mix(const Vec3f &a, const Vec3f& b, const float &mixValue)
{ return a * (1 - mixValue) + b * mixValue; }



Vec3f random_in_unit_disk() {
    Vec3f p;
    do {
        p = 2.0*Vec3f((rand() % (100) / (float)(100)), (rand() % (100) / (float)(100)), 0) - Vec3f(1, 1, 0);
    } while (p.dotProduct(p) >= 1.0);
    return p;
}

Vec3f randomPoint(float radius, Vec3f center) {
  // TODO: Improved methods of random point generation as this is not 100% even
  // See: https://www.jasondavies.com/maps/random-points/
  //
  // Get random spherical coordinates on light
    float theta = drand48() * M_PI;
    float phi = drand48() * 2 * M_PI;
  // Convert to Cartesian and scale by radius
    float dxr = radius * sin(theta) * cos(phi);
    float dyr = radius * sin(theta) * sin(phi);
    float dzr = radius * cos(theta);
  return Vec3f(center.x + dxr, center.y + dyr, center.z + dzr);
}
#endif
