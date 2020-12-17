victor$ g++ -c main.cpp lambertian.cpp metal.cpp dielectric.cpp camera.cpp sphere.cpp hitable_list.cpp
victor$ g++ main.o lambertian.o metal.o dielectric.o camera.o sphere.o hitable_list.o
victor$ g++ -c main.cpp

g++ main.cpp lambertian.cpp metal.cpp dielectric.cpp camera.cpp sphere.cpp hitable_list.cpp -o main.exe

victor$ clang++ -c main.cpp lambertian.cpp metal.cpp dielectric.cpp camera.cpp sphere.cpp hitable_list.cpp
victor$ clang++ main.o lambertian.o metal.o dielectric.o camera.o sphere.o hitable_list.o -o test

The command clang is for C, and the command clang++ is for C++.
https://stackoverflow.com/questions/9148488/how-do-i-compile-c-with-clang

