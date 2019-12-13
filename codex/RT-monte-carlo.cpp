#include <math.h>
#include <stdlib.h>
#include <iostream>
using namespace std;



// int main(){
//     int N = 10000;
//     int inside_circle = 0;
//     for (int i = 0; i < N; i++){
//         float x = 2 * drand48() - 1;
//         float y = 2 * drand48() - 1;
//         if (x*x + y*y < 1)
//             inside_circle++;
//     }
//     std::cout << "Estimate of PI = " << 4*float(inside_circle)/N << "\n";
// }

// int main(){
//     int runs = 0;    
//     int inside_circle = 0;
//     while(true){
//         runs ++;
//         float x = 2 * drand48() - 1; // 0-1 -> -1-1
//         float y = 2 * drand48() - 1;
//         if (x*x + y*y < 1)
//             inside_circle++;
//         if (runs % 100000 == 0)
//             std::cout << "Estimate of PI = " << 4*float(inside_circle)/runs << "\n";
//     }
// }

// g++ -c RT-monte-carlo.cpp
// g++ RT-monte-carlo.o
// ./a.exe

// int main(){
//     int inside_circle = 0;
//     int inside_circle_stratified = 0;
//     int sqrt_N = 1000;
//     for(int i=0; i<sqrt_N; i++){
//         for(int j=0; j<sqrt_N; j++){
//             float x = 2 * drand48() - 1;
//             float y = 2 * drand48() - 1;
//             if (x*x + y*y < 1)
//                 inside_circle++;
//             x = 2*((i+drand48()) / sqrt_N) - 1;
//             y = 2*((j+drand48()) / sqrt_N) - 1;
//             if (x*x + y*y < 1)
//                 inside_circle_stratified++;
//         }
//     }
//     cout << "Regular est = " <<
//     4*float(inside_circle)/(sqrt_N*sqrt_N) << "\n";
//     cout << "Stratified est = " <<
//     4*float(inside_circle_stratified)/(sqrt_N*sqrt_N) << "\n";
// }

int main(){
    int N = 10000;
    float sum;
    for(int i=0; i<N; i++){
        float x = 2*drand48();
        sum += x*x;
    }
    cout << 2*sum/N << endl;
    cout << float(8)/3;
}