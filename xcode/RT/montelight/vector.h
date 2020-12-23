//
//  vector.h
//  montelight
//
//  Created by Wei Li on 2020-12-20.
//

#ifndef vector_h
#define vector_h

//#include "vector.h"


struct Vector {
  double x, y, z;
  //
  Vector(const Vector &o) : x(o.x), y(o.y), z(o.z) {}
  Vector(double x_=0, double y_=0, double z_=0) : x(x_), y(y_), z(z_) {}
  inline Vector operator+(const Vector &o) const {
    return Vector(x + o.x, y + o.y, z + o.z);
  }
  inline Vector &operator+=(const Vector &rhs) {
    x += rhs.x; y += rhs.y; z += rhs.z;
    return *this;
  }
  inline Vector operator-(const Vector &o) const {
    return Vector(x - o.x, y - o.y, z - o.z);
  }
  inline Vector operator*(const Vector &o) const {
    return Vector(x * o.x, y * o.y, z * o.z);
  }
  inline Vector operator/(double o) const {
    return Vector(x / o, y / o, z / o);
  }
  inline Vector operator*(double o) const {
    return Vector(x * o, y * o, z * o);
  }
  inline double dot(const Vector &o) const {
    return x * o.x + y * o.y + z * o.z;
  }
  inline Vector &norm(){
    return *this = *this * (1 / sqrt(x * x + y * y + z * z));
  }
  inline Vector cross(Vector &o){
    return Vector(y * o.z - z * o.y, z * o.x - x * o.z, x * o.y - y * o.x);
  }
  inline double min() {
    return fmin(x, fmin(y, z));
  }
  inline double max() {
    return fmax(x, fmax(y, z));
  }
  inline Vector &abs() {
    x = fabs(x); y = fabs(y); z = fabs(z);
    return *this;
  }
  inline Vector &clamp() {
    // C++11 lambda function: http://en.cppreference.com/w/cpp/language/lambda
    auto clampDouble = [](double x) {
      if (x < 0) return 0.0;
      if (x > 1) return 1.0;
      return x;
    };
    x = clampDouble(x); y = clampDouble(y); z = clampDouble(z);
    return *this;
  }
};

#endif /* vector_h */
