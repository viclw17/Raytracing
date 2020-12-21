//
//  scene.h
//  MinimalGI
//
//  Created by Wei Li on 2020-12-20.
//

#ifndef scene_h
#define scene_h

// Set up our testing scenes
// They're all Cornell box inspired: http://graphics.ucsd.edu/~henrik/images/cbox.html
/////////////////////////
// Scene format: Sphere(position, radius, color, emission)
/////////////////////////
std::vector<Shape *> simpleScene = {
  // Left sphere
  new Sphere(Vector(1e5+1,40.8,81.6), 1e5f, Vector(.75,.25,.25), Vector()),
  // Right sphere
  new Sphere(Vector(-1e5+99,40.8,81.6), 1e5f, Vector(.25,.25,.75), Vector()),
  // Back sphere
  new Sphere(Vector(50,40.8, 1e5), 1e5f, Vector(.75,.75,.75), Vector()),
  // Floor sphere
  new Sphere(Vector(50, 1e5, 81.6), 1e5f, Vector(.75,.75,.75), Vector()),
  // Roof sphere
  new Sphere(Vector(50,-1e5+81.6,81.6), 1e5f, Vector(.75,.75,.75), Vector()),
  // Traditional mirror sphere
  new Sphere(Vector(27,16.5,47), 16.5f, Vector(1,1,1) * 0.799, Vector()),
  // Traditional glass sphere
  new Sphere(Vector(73,16.5,78), 16.5f, Vector(1,1,1) * 0.799, Vector()),
  // Light source
  //new Sphere(Vector(50,681.6-.27,81.6), 600, Vector(1,1,1) * 0.5, Vector(12,12,12))
  new Sphere(Vector(50,65.1,81.6), 8.5, Vector(), Vector(4,4,4) * 100) // Small = 1.5, Large = 8.5
};
/////////////////////////
std::vector<Shape *> complexScene = {
  new Sphere(Vector(1e5+1,40.8,81.6), 1e5f, Vector(.75,.25,.25), Vector()), // Left
  new Sphere(Vector(-1e5+99,40.8,81.6), 1e5f, Vector(.25,.25,.75), Vector()), // Right
  new Sphere(Vector(50,40.8, 1e5), 1e5f, Vector(.75,.75,.75), Vector()), // Back
  new Sphere(Vector(50, 1e5, 81.6), 1e5f, Vector(.75,.75,.75), Vector()), //Bottom
  new Sphere(Vector(50,-1e5+81.6,81.6), 1e5f, Vector(.75,.75,.75), Vector()), // Top
  new Sphere(Vector(20,16.5,40), 16.5f, Vector(1,1,1) * 0.799, Vector()),
  new Sphere(Vector(50,16.5,80), 16.5f, Vector(1,1,1) * 0.799, Vector()),
  new Sphere(Vector(75,16.5,120), 16.5f, Vector(1,1,1) * 0.799, Vector()),
  new Sphere(Vector(50,65.1,40), 1.5, Vector(), Vector(4,4,4) * 100), // Light
  new Sphere(Vector(50,65.1,120), 1.5, Vector(), Vector(4,4,4) * 100), // Light
};
//

#endif /* scene_h */
