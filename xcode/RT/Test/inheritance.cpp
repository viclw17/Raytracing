//
//  inheritance.cpp
//  Test
//
//  Created by Wei Li on 2020-12-14.
//

#include <iostream>
#include <string>
using namespace std;


class BaseClass {
public:
    virtual bool scatter() const = 0;
    int bc_id = 42;
};

class Class1 : public BaseClass{
public:
    bool scatter() const {
        cout << "scatter called" << endl;
        // c1_id = 42; // fail, scatter() is const
        return true;
    }
    int c1_id = 21;
};

const int MAXNAMESIZE = 40;
class Student{
public:
    // To make a member function polymorphic, the programmer must flag the function with the C++ keyword virtual
    virtual float calcTuition(){
        cout << "in student calc" << endl;
        return 0;
    }
//    float calcTuition(){
//        cout << "in student calc" << endl;
//        return 0;
//    }
    Student(char *pName = "no name") : average(0.0){
        strncpy(name, pName, MAXNAMESIZE);
        name[MAXNAMESIZE-1] = '\0';
        cout << "construct student " << name << endl;
    }
protected:
    char name[MAXNAMESIZE];
    float average;
};

class Advisor{};
class GradStudent : public Student{
public:
    float calcTuition(){
        cout << "in grad calc" << endl;
        return 0;
    }
    GradStudent(char *pName, Advisor& adv, float g=0.0):Student(pName),advisor(adv), grade(g){
        cout << "construct grad student " << pName << endl;

    }
    
private:
    Advisor advisor;
    float grade;
};

void fn(Student& x){
    x.calcTuition();
}

int main(){
    Class1 c1;
    cout << c1.bc_id << endl;
    cout << c1.c1_id << endl;
    
    // The capability of deciding at runtime which of several overloaded member functions to call based on the runtime type is called polymorphism, or late binding.
    // Deciding which overloaded to call at compile time is called early binding.
    Student s;
    fn(s);
    
    Advisor adv;
    GradStudent gs("qwer", adv, 1.5);
    fn(gs);
    
    return 0;
}
