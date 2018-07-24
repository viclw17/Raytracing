#include<iostream>
#include "operator_overload.h"

using namespace std;
int main(){
	person p1(10);
	person p2(20);
	if(p1==p2)
		cout << "the age is equal!" << endl;
    else
        cout << "the age is different" << endl;
	return 0;
}
