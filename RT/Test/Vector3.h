//
//  vector.cpp
//  Test
//
//  Created by Wei Li on 2020-12-15.
//
#include <iostream>
using namespace std;
class Vector3{
public:
//    Vector3(){};
    Vector3(){x=y=z=0;}
    Vector3(float x, float y, float z) : x(x),y(y),z(z){}
    
    float x,y,z;
    
    float operator[](int i) const { // will not mutate caller object, called by const object, only READ data members
//        cout << "using float []" << endl;
        //x++; // without const, bad!
        if(i == 0) return x;
        if(i == 1) return y;
        return z;
    }
    float& operator[](int i) { // called by regular object, READ/WRITE data members
        // return by reference, meanning can be assigned to with new value
//        cout << "using float& []" << endl;
        if(i == 0) return x;
        if(i == 1) return y;
        return z;
    }
    
    Vector3 operator+(const Vector3 &v) const { // will not mutate caller object
        return Vector3(x+v.x,y+v.y,z+v.z); // return a copy
    }
    Vector3& operator+=(const Vector3 &v) { // return a reference
        x += v.x; y += v.y; z += v.z;
        return *this;
    }

    Vector3 operator-(const Vector3 &v) const { // will not mutate caller object
        return Vector3(x-v.x,y-v.y,z-v.z); // return a copy
    }
    Vector3& operator-=(const Vector3 &v) { // return a reference
        x -= v.x; y -= v.y; z -= v.z;
        return *this;
    }
    
    Vector3 operator*(float s) const { // will not mutate caller object
        return Vector3(x*s,y*s,z*s); // return a copy
    }
    Vector3& operator*=(float s) { // return a reference
        x *= s; y *= s; z *= s;
        return *this;
    }
    
    Vector3 operator/(float f) const {
        float inv = (float)1 / f;
        return Vector3(x * inv, y * inv, z * inv);
    }
    Vector3 &operator/=(float f) {
        float inv = (float)1 / f;
        x *= inv;
        y *= inv;
        z *= inv;
        return *this;
    }
    
    bool operator==(const Vector3 &v) const {
        return x == v.x && y == v.y && z == v.z;
    }
    bool operator!=(const Vector3 &v) const {
        return x != v.x || y != v.y || z != v.z;
    }
    
    // misc
    Vector3 operator-() const { return Vector3(-x, -y, -z); }
    Vector3 Abs(const Vector3 &v) {
        return Vector3(std::abs(v.x), std::abs(v.y), std::abs(v.z));
    }
    
    // normalization
    float LengthSquared() const { return x * x + y * y + z * z; }
    float Length() const { return sqrt(LengthSquared()); }
    inline Vector3 Normalize(const Vector3 &v) { return v / v.Length(); }
    
    // doc & cross
    inline float Dot(const Vector3 &v1, const Vector3 &v2) { return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z; }
    inline Vector3 Cross(const Vector3 &v1, const Vector3 &v2) {
        float v1x = v1.x, v1y = v1.y, v1z = v1.z;
        float v2x = v2.x, v2y = v2.y, v2z = v2.z;
        return Vector3((v1y * v2z) - (v1z * v2y),
                        (v1z * v2x) - (v1x * v2z),
                        (v1x * v2y) - (v1y * v2x));
    }
    
    void printVector(){
        cout << "("<<x<<","<<y<<","<<z<<")"<<endl;
    }
    
};

/*
int main(){
    Vector3 v1(1,2,3);
    //v1[0] = 42; // using "float& []", mutating v1's data member (int x)
    //cout << v1[0] << endl; // using float& []
    const Vector3 v2(4,5,6);
    //cout << v2[0] << endl; //using "float [] const", if no def, error: No viable overloaded operator[] for type 'const Vector3'
    Vector3 v3(1,2,3);

    (v1+v2).printVector();
    (v1*2).printVector();
    (v1/2).printVector();
    (-v1).printVector();
    
    return 0;
}
 */
