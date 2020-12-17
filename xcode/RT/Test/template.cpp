//
//  template.cpp
//  Test
//
//  Created by Wei Li on 2020-12-15.
//
#include <string>
#include <iostream>
using namespace std;

template <class T>
T maximum(T t1, T t2) {
    if(t1>t2){
        return t1;
    }
    return t2;
}

template <class T>
class Vector {
    int nSize;
    int nWriteIndex;
    int nReadIndex;
    T* array;
    
public:
    Vector(int nArraySize){
        nSize = nArraySize;
        array = new T[nArraySize];
        reset();
    }
    int size() {return nWriteIndex;}
    void reset() {nWriteIndex = 0; nReadIndex = 0;}
    void add(T object){
        if(nWriteIndex < nSize){
            array[nWriteIndex++] = object;
        }
    }
    T get(){
        return array[nReadIndex++];
    }
};

void intFn(){
    Vector<int> integers(10);
    // add values to the vector
    cout << "Give me a series integer values to add to a vector\n" << "(Enter a negative number to terminate):" << endl;
    for(;;) {
        int n;
        cin  >> n;
        if (n < 0) break;
        integers.add(n);
    }
    cout << "\nHere are the numbers you entered" << endl;
    for(int i = 0; i < integers.size(); i++){
        cout << i << ":" << integers.get() << endl;
    }
}

class Name{
public:
    Name(char* n = ""): name(n) {}
    string display() {return name; }
protected:
    string name;
};

void nameFn(){
    // create a vector
    Vector<Name> names(10);
    // add values to the vector
    cout << "Enter names\n" << "(Enter an ‘x’ to quit):" << endl;
    for(;;){
    char buffer[80];
        do{
            cin.getline(buffer, 80);
        } while(strlen(buffer) == 0);
        if (strcmp(buffer, "x") == 0) {
            break;
        }
    names.add(Name(buffer));
    }
    cout << "\nHere are the names you entered" << endl;
    for(int i = 0; i < names.size(); i++){
        Name name = names.get();
        cout << i << ":" << name.display() << endl;
    }
}
    
    

int main(){
    cout << maximum(1,2) << endl;
    cout << maximum(1.5,2.5) << endl;
    
    nameFn();
    
    return 0;
}
