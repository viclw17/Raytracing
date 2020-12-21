//
//  pass_by_ref.cpp
//  Test
//
//  Created by Wei Li on 2020-12-17.
//


#include <iostream>
using namespace std;


void reset(int &i){
    i=0;
}

/// Avoid copies
// s1 s2 can be long to copy
// comparing does not involve changing strings, parameters const
bool is_Shorter(const string &s1, const string &s2){
    return s1.size() < s2.size();
}


/// when we COPY an argument to initialize a parameter, top-level consts are ignored
//const int ci = 42;
//int i = ci; //ok, (const int) to (int)
//int * const p = &i; // pointer itself is const
//*p = 0; //ok, (int) to (int)

/// top-level const indicates that an object itself is const
/// low-level const appears in the base type of compound types such as pointers or references (the pointed/referred type is const)
int i = 0;
int *const p1 = &i; // we can't change the value of p1; const is top-level
const int ci = 42; // we cannot change ci; const is top-level
const int *p2 = &ci; // we can change p2; const is low-level
const int *const p3 = p2; // right-most const is top-level, left-most is not
const int &r = ci; // const in reference types is always low-leve

/// A parameter that has a top-level const is indistinguishable from one without a top-level const:
void fcn(const int i){}
//void fcn(int i){} // Error: Redefinition of 'fcn'
/// On the other hand, we can overload based on whether the parameter is a reference (or pointer) to the const or nonconst version of a given type; such consts are low-level:
void fcn1(const int &i){}
void fcn1(int &i){} //ok


/// Return additional information
string::size_type find_char(const string &s, char c, string::size_type &occurs){
    //s = ""; //not allowed because const
    cout << "call find_char(), const version" << endl;
    auto ret = s.size(); // position of the first occurrence, if any
    occurs = 0; // set the occurrence count parameter
    for (decltype(ret) i = 0; i != s.size(); ++i) {
        if (s[i] == c) {
            if (ret == s.size())
                ret = i;
            ++occurs;
        }
    }
    return ret;
}

string::size_type find_char(string &s, char c, string::size_type &occurs){
    //s = "";
    cout << "call find_char(), non-const version" << endl;
    auto ret = s.size(); // position of the first occurrence, if any
    occurs = 0; // set the occurrence count parameter
    for (decltype(ret) i = 0; i != s.size(); ++i) {
        if (s[i] == c) {
            if (ret == s.size())
                ret = i;
            ++occurs;
        }
    }
    return ret;
}

/// Use Reference to const When Possible
bool is_sentence(const string &s){
    cout << "call is_sentence()" << endl;
    // if there's a single period at the end of s, then s is a sentence
    string::size_type ctr = 0;
    return find_char(s, '.', ctr) == s.size() - 1 && ctr == 1;
}



int main(){
    int j = 42;
    reset(j);
    cout << j << endl;
    
    int i = 42;
    const int *cp = &i; // cannot *cp=43, pointer-to-const
    const int &r = i; // cannot r=43, reference-to-const, AKA "const reference"...
    const int &r2 = 42; //ok
    //int *p = cp; //error
    //int &r3 = r; //error
    //int &r4 = 42; //error: Non-const lvalue reference to type 'int' cannot bind to a temporary of type 'int'

    string::size_type ctr = 0;
    auto index = find_char("Hello World", 'o', ctr);
    /* const */string arg = "Hello World";
    auto index1 = find_char(arg, 'o', ctr);
//    cout << ctr << endl;
//    cout << index << endl;
    is_sentence("Hello World");
    is_sentence(arg);


    return 0;
}
