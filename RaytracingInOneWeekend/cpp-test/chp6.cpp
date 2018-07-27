#include <string>
#include <iostream>
using namespace std;
int main(){
    // int num = 100;
    // double sum = 0.0123456789;
    // string text = "C++ Fun";

    // test on l-value r-value
    // " error: lvalue required as left operand of assignment"
    // 200 = num ;
    // 5.5 = sum ;
    // "Bad assignments" = text ;

    // cout << "Integer variable starts at: " << &num << endl ;
    // cout << "Double variable starts at: " << &sum << endl ;
    // cout << "String variable starts at: " << &text << endl ;

    //////////////////////////////////////////////////
    int a=8, b=16;
    int* aPtr = &a;
    int* bPtr = &b;
    cout << "Addresses of pointers..." << endl ;
    cout << "aPtr: " << &aPtr << endl ;
    cout << "bPtr: " << &bPtr << endl << endl ;
    cout << "Values of pointers..." << endl ;
    cout << "aPtr: " << aPtr << endl ;
    cout << "bPtr: " << bPtr << endl << endl ;
    cout << "Values in addresses pointed to..." << endl ;
    cout << "a: " << *aPtr << endl ;
    cout << "b: " << *bPtr << endl << endl ;

    //The name of an array acts like a pointer to its first element.
    int nums[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 } ;
    int* ptr = nums;
    cout << endl << "ptr at: " << ptr << " gets: " << *ptr ;
    ptr++;
    cout << endl << "ptr at: " << ptr << " gets: " << *ptr ;
    ptr -= 1;
    cout << endl << "ptr at: " << ptr << " gets: " << *ptr ;

    for (int i=0; i<10; i++){
        cout << endl << "Element: " << i;
        cout << " Value: " << *ptr;
        ptr++;
    }
    cout << endl;

}
