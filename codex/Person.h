#pragma once // Always put this at the top of headers

#include <string>
#include <vector>

using namespace std;

class Person {
public:
    string name;
    float age;

    // Constructor, with an argument passed by reference
    Person(const string& n);

    // Destructor, always make virtual on a base class
    virtual ~Person();

    // Method that cannot be overridden
    void haveBirthday();

    // Method that can be overridden and may not mutate state
    virtual float estimateHeight() const;
};

// Derived class
class Student : public Person {
public:
    // Parameteric type
    vector<int> grades;

    // Constructor
    Student(const string& n);

    virtual float estimateHeight() const;
};
