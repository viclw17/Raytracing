// Plain Old Data
#include<iostream>
using namespace std;

/*
    float, int, raw C pointers(char*), bool
*/

int main(){
    const char* str = "Hello World";
    int x; // not initialized!
    cout << "&x = " << &x << endl;
    cout << "x = " << x << endl;
    // unintialized pointers will reference arbitrary memory locations

    for(int i = 0; str[i] != '\0'; ++i){
        x += str[i];
        cout << "str[" << i << "] = " << str[i] << " " << int(str[i]) << endl;
    }
    cout << "x = " << x << endl;
    return 0;
}
