https://docs.microsoft.com/en-us/cpp/error-messages/tool-errors/linker-tools-error-lnk2005?view=vs-2017
```
1>Generating Code...
1>hitable_list.obj : error LNK2005: "class aabb __cdecl surrounding_box(class aabb,class aabb)" (?surrounding_box@@YA?AVaabb@@V1@0@Z) already defined in dielectric.obj
1>lambertian.obj : error LNK2005: "class aabb __cdecl surrounding_box(class aabb,class aabb)" (?surrounding_box@@YA?AVaabb@@V1@0@Z) already defined in dielectric.obj
1>main.obj : error LNK2005: "class aabb __cdecl surrounding_box(class aabb,class aabb)" (?surrounding_box@@YA?AVaabb@@V1@0@Z) already defined in dielectric.obj
1>metal.obj : error LNK2005: "class aabb __cdecl surrounding_box(class aabb,class aabb)" (?surrounding_box@@YA?AVaabb@@V1@0@Z) already defined in dielectric.obj
1>sphere.obj : error LNK2005: "class aabb __cdecl surrounding_box(class aabb,class aabb)" (?surrounding_box@@YA?AVaabb@@V1@0@Z) already defined in dielectric.obj
1>D:\Git\Raytracing\RaytracingTheNextWeek\vs\Raytracer2\Debug\Raytracer2.exe : fatal error LNK1169: one or more multiply defined symbols found
1>Done building project "Raytracer2.vcxproj" -- FAILED.
========== Build: 0 succeeded, 1 failed, 0 up-to-date, 0 skipped ==========
```
The symbol symbol was defined more than once.

This error is followed by fatal error **LNK1169**.

Possible causes and solutions

Generally, this error means you have broken the one definition rule, which allows only one definition for any used template, function, type, or object in a given object file, and only one definition across the entire executable for externally visible objects or functions.

This error can occur when a header file defines a function that isn't inline. If you include this header file in more than one source file, you get multiple definitions of the function in the executable.

Possible solutions include:

- Add the inline keyword to the function:
- Remove the function body from the header file and leave only the declaration, then implement the function in one and only one source file:

```c
aabb surrounding_box(aabb box0, aabb box1) { // inline, or move implementation to cpp, only leave the declaration!
   vec3 small(fmin(box0.min().x(), box1.min().x()),
       fmin(box0.min().y(), box1.min().y()),
       fmin(box0.min().z(), box1.min().z()));

   vec3 big(fmax(box0.max().x(), box1.max().x()),
       fmax(box0.max().y(), box1.max().y()),
       fmax(box0.max().z(), box1.max().z()));
   return aabb(small, big);
}
```
