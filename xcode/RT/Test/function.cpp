//
//  function.cpp
//  Test
//
//  Created by Wei Li on 2020-12-16.
//

#include <iostream>
using namespace std;

void passByValue(int arg){
    cout << "arg = " << arg << " address = " << &arg << " (pass by value)" << endl;
    arg = 42;
    cout << "arg = " << arg << " address = " << &arg << " (pass by value)" << endl;
}

void passByPointer(int* arg){
    cout << "arg = " << *arg << " address = " << arg << " (pass by pointer)" << endl;
    *arg = 42;
    cout << "arg = " << *arg << " address = " << arg << " (pass by pointer)" << endl;
}

// C++ provides a shorthand for passing arguments by address — a shorthand that enables you to avoid having to hassle with pointers.
// (implicit pointer, no need to hassle with &(address-of) or *(dereference))
// Notice that reference is not an actual type. Thus, the function’s full name is fn(int) and not fn(int&).
void passByRef(int& arg){
    cout << "arg = " << arg << " address = " << &arg << " (pass by ref)" << endl;
    arg = 42;
    cout << "arg = " << arg << " address = " << &arg << " (pass by ref)" << endl;
}

int returnByValue(){
    int temp = 100;
    return temp;
}

// When function returns a reference it means it returns a implicit pointer.
int& returnByRef(){
    int temp = 100;
    return temp;
}

int vals[] = {1,2,3,4,5};
int& setValues( int i ) {
   return vals[i];   // return a reference to the ith element
}

int main(){
    int a = 1;
    cout << "a = " << a << " address = " << &a << endl;
//    cout << vals[0] << endl;
//    setValues(0) = 111;
//    cout << vals[0] << endl;
    
//    passByValue(a);
//    passByPointer(&a);
    passByRef(a); // no need &
    cout << "a = " << a << " address = " << &a << endl;

}
