#Makefile for "Person" C++ application

PROG = Person
CC = g++
CPPFLAGS = -g -Wall -I /Users/wei_li/Git/Raytracing/codex
#LDFLAGS =
OBJS = main.o Person.o

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
Person.o : Person.h
	$(CC) $(CPPFLAGS) -c Person.cpp
clean:
	rm -f core $(PROG) $(OBJS)
