//
//  main.cpp
//  Test
//
//  Created by Wei Li on 2020-12-16.
//

#include <iostream>
#include <fstream>
#include "Vector3.h"
using namespace std;

///TODO:
///1. Processing bar class
///2. Image class


int main() {
    // resolution
    int nx = 100;
    int ny = 50;
    
    int ns = 1;

    // image output
    ofstream outfile("test.ppm", ios_base::out);
    outfile << "P3\n" << nx << " " << ny << "\n255\n";
    int total = nx*ny;
    int current = 0;
    int counter = 0;
    cout << "Image outputing ..." << endl;

    Vector3 col;
    for(int j=ny-1; j>=0; j--) {
        for(int i=0; i<nx; i++) {
//            counter++;
            float u = float(i) / float(nx);
            float v = float(j) / float(ny);
            col.x = u;
            col.y = v;

//            int mod = counter / (total / 10);
//            if (current != mod) {
//                current = mod;
//                cout << "*";
//            }


            int ir = int(255.99*col[0]);
            int ig = int(255.99*col[1]);
            int ib = int(255.99*col[2]);
//
            outfile << ir << " " << ig << " " << ib << "\n";
//            outfile << 255 << " " << 0 << " " << 0 << "\n";
        }
    }
    cout << endl;
    cout << "Image output succeeded! :)" << endl;
}
