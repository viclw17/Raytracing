#include <math.h>
#include <stdlib.h>
#include <iostream>

// int main(){
//     int N = 1000;
//     int inside_circle = 0;
//     for (int i = 0; i < N; i++){
//         float x = 2 * drand48() - 1;
//         float y = 2 * drand48() - 1;
//         if (x*x + y*y < 1)
//             inside_circle++;
//     }
//     std::cout << "Estimate of PI = " << 4*float(inside_circle)/N << "\n";
// }

int main(){
    int runs = 0;
    int inside_circle = 0;
    while(true){
        runs ++;
        float x = 2 * drand48() - 1;
        float y = 2 * drand48() - 1;
        if (x*x + y*y < 1)
            inside_circle++;
        if (runs % 100000 == 0)
            std::cout << "Estimate of PI = " << 4*float(inside_circle)/runs << "\n";
    }
}

// g++ -c RT-monte-carlo.cpp
// g++ RT-monte-carlo.o
// ./a.exe