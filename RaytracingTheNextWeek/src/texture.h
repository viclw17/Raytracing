#ifndef TEXTURE_H
#define TEXTURE_H

// a big refactoring of colors

// Abstract Base Classes
class texture {
public:
	virtual vec3 value(float u, float v, const vec3& p) const = 0;
	// still need to look into const...

	// 1. const vec3& p ???
	// passing by const reference
	// This option would be good if you wanted to inspect the value in the function 
	// without copying it AND without mutating it.


	// 2. const pure virtual function???
	// virtual is not related to const
	// = 0 is also not related to const
	// here is a const, pure virtual, member function
	// Putting const after a member function indicates that the code inside it will not modify the containing object 
	// (except in the case of mutable members). 
	// More deeply, the purpose of that const is to modify the type of the implicit THIS pointer.

};
#endif //TEXTURE_H