//
//  const_pointer.cpp
//  Test
//
//  Created by Wei Li on 2020-12-14.
//

#include <iostream>
using namespace::std;

int main(){
    int a = 10;
    int b = 11;
    const int * ptr1 = &a;
    ptr1 = &b;
    //*ptr1 = 11; // fail, int is a const
    
    int * const ptr2 = &a;
    //ptr2 = &b; // fail, ptr2 is A const pointer
    *ptr2 = 11;
    cout << *ptr1 << endl;
    cout << *ptr2 << endl;
    return 0;
}

