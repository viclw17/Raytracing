#include <memory>
#include <iostream>
#include "Person.h"

using namespace std;

// Standard C++ entry point
int main(const int argc, const char* argv[]){
    // Object on the stack
    Person jim("Jim K.");
    // Reference to an object, here on the stack
    Person& jimAlias(jim); // Person& jimAlias = jim;
    // Pointer to an object in the heap
    Person* turner(new Student("Turner W."));
    // Reference counted pointer to an object in the heap
    shared_ptr<Person> jessica = make_shared<Student>("Jessica H.");

    jim.haveBirthday();
    jimAlias.haveBirthday(); // jim is now 2!
    turner -> haveBirthday();
    jessica -> haveBirthday();

    cout << jim.name << endl;
    cout << "Execution succeeded :)" << endl;

    // Deallocate memory
    delete turner;
    turner = nullptr; // to avoid accidentally referring to the deallocated memory block

    return 0;
}

/* Reference-counted pointer turner is destructed on the stack here, triggering the memory that it references to also be deallocated from the heapbecause there are no more pointers to that object */
