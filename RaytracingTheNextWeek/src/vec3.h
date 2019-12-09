#include <math.h>
#include <stdlib.h>
#include <iostream>

class vec3 {
public:
    // 构造函数
    vec3() {}
    vec3(float e0, float e1, float e2) {e[0] = e0; e[1] = e1; e[2] = e2;}

    inline float x() const { //常成员函数, 它不改变对象的成员变量. 也不能调用类中任何非const成员函数。
        return e[0]; // 成员变量
    }
    inline float y() const {return e[1];}
    inline float z() const {return e[2];}
    inline float r() const {return e[0];}
    inline float g() const {return e[1];}
    inline float b() const {return e[2];}

    // 操作符重载 operator overload
    // const（右边这个）：表示该函数不修改类对象。
    // const（左边这个）：表示函数返回不可被修改，此处表示返回的vec3对象的引用不可被修改。P.S.当函数返回引用类型时，没有复制返回值。相反，返回的是对象本身。
    inline const vec3& operator+() const {return *this;}
    inline vec3 operator-() const {return vec3(-e[0], -e[1], -e[2]);}
    inline float  operator[](int i) const {return e[i];}
    inline float& operator[](int i) {return e[i];}

    /*
    &（右边这个）：形参是引用类型。当把参数声明为引用时，传递的是形参本身。此时不需要将形参的值拷贝（赋值）给实参，可以直接操纵形参。和指针类似。
    const：修饰函数参数。表示函数体中不能修改参数的值（包括参数本身的值或者参数其中包含的值）
    &（左边这个）：函数返回引用类型。当函数返回引用类型时，没有复制返回值。相反，返回的是对象本身。
    */
    inline vec3& operator+=(const vec3 &v2);
    inline vec3& operator-=(const vec3 &v2);
    inline vec3& operator*=(const vec3 &v2);
    inline vec3& operator/=(const vec3 &v2);
    inline vec3& operator*=(const float t);
    inline vec3& operator/=(const float t);

    inline float length() const {
        return sqrt(e[0]*e[0]+e[1]*e[1]+e[2]*e[2]);
    }
    inline float squared_length() const {
        return e[0]*e[0]+e[1]*e[1]+e[2]*e[2];
    }
    inline void make_unit_vector();

    // 成员变量
    float e[3];
};

/*
成员函数可以在类体中直接定义。也可以在类体中只写成员函数的声明，而在类的外面进行函数定义。
注意：在类体中直接定义函数时，不需要在函数名前面加上类名，因为函数属于哪一个类是不言而喻的。
但成员函数在类外定义时，必须在函数名前面加上类名，予以限定(qualifed)，" :: "是作用域限定符(field qualifier)或称作用域运算符，用它声明函数是属于哪个类的。如果在作用域运算符“::”的前面没有类名，或者函数名前面既无类名又无作用域运算符“::”，如 ::display( ) 或 display( ) 则表示display函数不属于任何类，这个函数不是成员函数，而是全局函数，即非成员函数的一般普通函数。
*/
inline std::istream& operator>>(std::istream &is, vec3 &t){
    is >> t.e[0] >> t.e[1] >> t.e[2];
    return is;
}

inline std::ostream& operator<<(std::ostream &os, const vec3 &t){
    os << t.e[0] << " " << t.e[1] << " " << t.e[2];
    return os;
}

inline void vec3::make_unit_vector(){
    float k = 1.0 / sqrt(e[0]*e[0]+e[1]*e[1]+e[2]*e[2]);
    e[0] *= k; e[1] *= k; e[2] *= k;
}

// 全局函数
inline vec3 operator+(const vec3 &v1, const vec3 &v2){
    return vec3(
        v1.e[0]+v2.e[0],
        v1.e[1]+v2.e[1],
        v1.e[2]+v2.e[2]);
}
inline vec3 operator-(const vec3 &v1, const vec3 &v2){
    return vec3(
        v1.e[0]-v2.e[0],
        v1.e[1]-v2.e[1],
        v1.e[2]-v2.e[2]);
}
inline vec3 operator*(const vec3 &v1, const vec3 &v2){
    return vec3(
        v1.e[0]*v2.e[0],
        v1.e[1]*v2.e[1],
        v1.e[2]*v2.e[2]);
}
inline vec3 operator/(const vec3 &v1, const vec3 &v2){
    return vec3(
        v1.e[0]/v2.e[0],
        v1.e[1]/v2.e[1],
        v1.e[2]/v2.e[2]);
}
inline vec3 operator*(float t, const vec3 &v){
    return vec3(
        t*v.e[0],
        t*v.e[1],
        t*v.e[2]);
}
inline vec3 operator/(vec3 v, float t){ // vec3 v ???
    return vec3(
        v.e[0]/t,
        v.e[1]/t,
        v.e[2]/t);
}
inline vec3 operator*(const vec3 &v, float t){ // const vec3 &v ???
    return vec3(
        t*v.e[0],
        t*v.e[1],
        t*v.e[2]);
}
inline float dot(const vec3 &v1, const vec3 &v2){
    return v1.e[0]*v2.e[0]+v1.e[1]*v2.e[1]+v1.e[2]*v2.e[2];
}
inline vec3 cross(const vec3 &v1, const vec3 &v2){
    return vec3((v1.e[1]*v2.e[2]-v1.e[2]*v2.e[1]),
               -(v1.e[0]*v2.e[2]-v1.e[2]*v2.e[0]),
                (v1.e[0]*v2.e[1]-v1.e[1]*v2.e[0]));
}

inline vec3& vec3::operator+=(const vec3 &v){
    e[0] += v.e[0];
    e[1] += v.e[1];
    e[2] += v.e[2];
    return *this;
}

inline vec3& vec3::operator*=(const vec3 &v){
    e[0] *= v.e[0];
    e[1] *= v.e[1];
    e[2] *= v.e[2];
    return *this;
}

inline vec3& vec3::operator/=(const vec3 &v){
    e[0] /= v.e[0];
    e[1] /= v.e[1];
    e[2] /= v.e[2];
    return *this;
}

inline vec3& vec3::operator-=(const vec3 &v){
    e[0] -= v.e[0];
    e[1] -= v.e[1];
    e[2] -= v.e[2];
    return *this;
}

inline vec3& vec3::operator*=(const float t){
    e[0] *= t;
    e[1] *= t;
    e[2] *= t;
    return *this;
}

inline vec3& vec3::operator/=(const float t){
    float k = 1.0/t;
    e[0] *= k;
    e[1] *= k;
    e[2] *= k;
    return *this;
}

// 全局函数
inline vec3 unit_vector(vec3 v){
    return v / v.length();
}
