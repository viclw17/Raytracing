// www.geeksforgeeks.org/when-do-we-use-initializer-list-in-c/
#include<iostream>
using namespace std;

class Point{
private:
    int x;
    int y;
public:
    Point(int i = 0, int j = 0):x(i), y(j){}
    /*  The above use of Initializer list is optional. Equal to:
        Point(int i = 0; int j = 0){
            x = i;
            y = j
        }
    */
    int getX() const {return x;}
    int getY() const {return y;}
};

int main(){
    Point t1(10, 15);
    cout << "x = " << t1.getX() << ", ";
    cout << "y = " << t1.getY() << endl;
    return 0;
}
