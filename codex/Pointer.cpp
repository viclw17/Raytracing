#include<iostream>
using namespace std;

int main(){
    int* x = new int();
    cout << x << endl;
    cout << *x << endl;
    delete x;
    x = nullptr;
    // cout << x << endl;
    // cout << *x << endl;
    // Null pointer dereference
    // "Segmentation fault: 11"

    string* s = new string("hello");
    // the following is the same as (*s).substr(3);
    s -> substr(3);
    delete s;
    s = nullptr;

    return 0;
}
