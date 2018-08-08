#include <string>
#include <iostream>
using namespace std;

void add (int& a, int* b){cout << "Total: " << (a+*b) << endl;};

int main(){
    //////////////////////////////////////////////////
    // Data storage
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

    // L-values, R-values

    //////////////////////////////////////////////////
    // Get values with pointers
    // int a=8, b=16;
    // int* aPtr = &a;
    // int* bPtr = &b;
    // cout << "Addresses of pointers..." << endl ;
    // cout << "aPtr: " << &aPtr << endl ;
    // cout << "bPtr: " << &bPtr << endl << endl ;
    // cout << "Values of pointers..." << endl ;
    // cout << "aPtr: " << aPtr << endl ;
    // cout << "bPtr: " << bPtr << endl << endl ;
    // cout << "Values in addresses pointed to..." << endl ;
    // cout << "a: " << *aPtr << endl ;
    // cout << "b: " << *bPtr << endl << endl ;

    //////////////////////////////////////////////////
    // Pointer arithmetic
    //The name of an array acts like a pointer to its first element.
    // int nums[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 } ;
    // int* ptr = nums;
    // cout << endl << "ptr at: " << ptr << " gets: " << *ptr ;
    // ptr++;
    // cout << endl << "ptr at: " << ptr << " gets: " << *ptr ;
    // ptr -= 1;
    // cout << endl << "ptr at: " << ptr << " gets: " << *ptr ;
    //
    // for (int i=0; i<10; i++){
    //     cout << endl << "Element: " << i;
    //     cout << " Value: " << *ptr;
    //     ptr++;
    // }
    // cout << endl;

    //////////////////////////////////////////////////
    // Pass pointers to functions.

    //////////////////////////////////////////////////
    // Array of pointers.
    // char letters[8] = {'C', '+', '+', ' ', 'F', 'u', 'n', '\0'}; // {}, \0 means the end of the string
    // // a char array; every char must be enclosed in ''
    // // a char array with '\0' <=> a string
    // const char* text = "C++ Fun";
    // // a char pointer, point to the first element of a char array (=string)
    // // string must be enclosed in "", even it is assigned to char pointer
    // const char* term = "Element";
    // const char* lang = "C++";
    // const char* ap1[3] = {"Great ", "Programing ", "Code "};
    // // a char ponter array
    // const char* ap2[3] = {lang, "is ", "Fun"};
    // const char* ap3[3] = {ap2[0], ap2[1], ap1[0]};
    // const char* ap4[3] = {ap1[2], ap2[1], ap2[2]};
    //
    // cout << letters << endl;
    // cout << text << endl;
    // for(int i=0; i<3 ;i++){
    //     cout << term << i << " ";
    //     cout << ap1[i] << " ";
    //     cout << ap2[i] << " ";
    //     cout << ap3[i] << " ";
    //     cout << ap4[i] << endl;
    // }

    //////////////////////////////////////////////////
    // Reference
    // int num;
    // int& rNum = num;
    // rNum = 400;
    // cout << "Value direct: " << num << endl;
    // cout << "Value via ref.: " << rNum << endl;
    // cout << "Address direct: " << &num << endl;
    // cout << "Address via ref.: " << &rNum << endl;
    // rNum *= 2;
    // cout << "Value direct: " << num << endl;
    // cout << "Value via ref.: " << rNum << endl;
    // // all exactly the same!!!

    //////////////////////////////////////////////////
    // Pass Reference to functions.


    //////////////////////////////////////////////////
    // // void add (int& a, int* b){cout << "Total: " << (a+*b) << endl;};
    // int num = 100, sum = 500;
    // int& rNum = num;
    // int* ptr = &num;
    // // void (* fn) (int& a, int* b) = add;
    // cout << "Reference: " << rNum << endl;
    // cout << "Pointer: " << *ptr << endl;
    // ptr = &sum; // change ptr to point address of sum
    // cout << "Pointer now: " << *ptr << endl;
    // add(rNum, ptr);

    return 0;
}
