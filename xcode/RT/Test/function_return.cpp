//
//  function_return.cpp
//  Test
//
//  Created by Wei Li on 2020-12-18.
//

#include <iostream>
using namespace std;

void swap(int &v1, int &v2){
    if(v1==v2) // if the values are already the same, no need to swap, just return
        return;
    int tmp = v2;
    v2 = v1;
    v1 = tmp;
}

/// Failing to provide a return after a loop that contains a return is an error.
/// However, many compilers will not detect such errors.

/// The return value is used to initialize a temporary at the call site, and that temporary is the result of the function call.
/// This function returns a copy of word, or it returns an unnamed temporary string that results from adding word and ending.
string make_plural(size_t ctr, const string &word, const string &ending){
    return (ctr>1) ? word+ending : word;
}

/// return a reference to the shorter of the 2 strings, no copy created.
const string &shortString(const string &s1, const string &s2){
    return s1.size() <= s2.size() ? s1 : s2;
}

///// disaster: this function returns a reference to a local object
const string &manip(){
    string ret;
    if(!ret.empty())
        return ret; // WRONG: returning a reference to a local object!
    else
        return "Empty"; // WRONG: "Empty" is a local temporary string
}

/// Reference Returns Are Lvalues, can be assigned
char &get_val(string &str, string::size_type ix){
    return str[ix];
}

/// recursion
int factorial(int val){
    if (val > 1)
        return factorial(val-1) * val;
    return 1;
}

/// Returning a Pointer to an Array
int arr[10]; // arr is an array of ten ints
int *p1[10]; // p1 is an array of ten pointers
int (*p2)[10] = &arr; // p2 points to an array of ten ints
int (*func(int i))[10];
auto func(int i) -> int(*)[10];

///

int main(){
    //cout << manip() << endl; // undefined value
    
    string s("a value");
    get_val(s, 0) = 'A';
    cout << s << endl;
    
    //shorterString("hi", "bye") = "X"; // error: return value is const
    return 0;
}
