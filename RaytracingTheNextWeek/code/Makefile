#Makefile for "Raytracer" C++ application

PROG = Raytracer
CC = g++
CPPFLAGS = -g -Wall -I RaytracingInOneWeekend/xcode/raytracer/raytracer
#LDFLAGS =
OBJS = main.o camera.o hitable_list.o dielectric.o lambertian.o metal.o sphere.o

#-c : compiles .cpp files to .o but not link
#-g : generates debugging information that is used by "gdb-based" debuggers
#-Wall : directs g++ to give warnings
#-I<dir> : adds directory to the list of directories searched for include files
#-o : specifies the name of the program to be linked together
#-L<dir> : adds...for library files (string, STL Vector...)
#-l<libname>

#target : prerequisites
#	command
#	...

$(PROG) : $(OBJS)
	$(CC) -o $(PROG) $(OBJS)
main.o :
	$(CC) $(CPPFLAGS) -c main.cpp
# vec3.o :
# 	$(CC) $(CPPFLAGS) -c vec3.h
# ray.o :
# 	$(CC) $(CPPFLAGS) -c ray.h
# hitable.o :
# 	$(CC) $(CPPFLAGS) -c hitable.h
# material.o :
# 	$(CC) $(CPPFLAGS) -c material.h
camera.o : camera.h ray.h vec3.h
	$(CC) $(CPPFLAGS) -c camera.cpp
dielectric.o : dielectric.h
	$(CC) $(CPPFLAGS) -c dielectric.cpp
lambertian.o : lambertian.h material.h
	$(CC) $(CPPFLAGS) -c lambertian.cpp
metal.o : metal.h
	$(CC) $(CPPFLAGS) -c metal.cpp
hitable_list.o : hitable_list.h hitable.h
	$(CC) $(CPPFLAGS) -c hitable_list.cpp
sphere.o : sphere.h
	$(CC) $(CPPFLAGS) -c sphere.cpp

clean:
	rm -f core $(PROG) $(OBJS) *.ppm
