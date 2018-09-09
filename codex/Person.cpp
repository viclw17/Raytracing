#include <math.h>
#include <algorithm>
#include "Person.h"

using namespace std;

// Initializing members before the constructor body
Person::Person(const string& n) :
    name(n),
    age(0.0f) {

    }

Person::~Person() {}

void Person::haveBirthday() {
    age += 1.0f;
}

float Person::estimateHeight() const {
    return sqrt(age*4.0f+0.5f);
}

Student::Student(const string& n) :
    Person(n) {}

float Student::estimateHeight() const {
    // Immutable local variable
    const float f(Person::estimateHeight()); // Invoke parent's method
    return max(f, 1.5f);
}
