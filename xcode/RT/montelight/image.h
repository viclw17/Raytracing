//
//  image.h
//  MinimalGI
//
//  Created by Wei Li on 2020-12-20.
//

#ifndef image_h
#define image_h

#include "vector.h"


struct Image {
  unsigned int width, height;
  Vector *pixels, *current;
  unsigned int *samples;
  std::vector<Vector> *raw_samples;
  //
  Image(unsigned int w, unsigned int h) : width(w), height(h) {
    pixels = new Vector[width * height];
    samples = new unsigned int[width * height];
    current = new Vector[width * height];
    //raw_samples = new std::vector<Vector>[width * height];
  }
  Vector getPixel(unsigned int x, unsigned int y) {
    unsigned int index = (height - y - 1) * width + x;
    return current[index];
  }
  void setPixel(unsigned int x, unsigned int y, const Vector &v) {
    unsigned int index = (height - y - 1) * width + x;
    pixels[index] += v;
    samples[index] += 1;
    current[index] = pixels[index] / samples[index];
    //raw_samples[index].push_back(v);
  }
  Vector getSurroundingAverage(int x, int y, int pattern=0) {
    unsigned int index = (height - y - 1) * width + x;
    Vector avg;
    int total;
    for (int dy = -1; dy < 2; ++dy) {
      for (int dx = -1; dx < 2; ++dx) {
        if (pattern == 0 && (dx != 0 && dy != 0)) continue;
        if (pattern == 1 && (dx == 0 || dy == 0)) continue;
        if (dx == 0 && dy == 0) {
          continue;
        }
        if (x + dx < 0 || x + dx > width - 1) continue;
        if (y + dy < 0 || y + dy > height - 1) continue;
        index = (height - (y + dy) - 1) * width + (x + dx);
        avg += current[index];
        total += 1;
      }
    }
    return avg / total;
  }
  inline double toInt(double x) {
    return pow(x, 1 / 2.2f) * 255;
  }
  void save(std::string filePrefix) {
    std::string filename = filePrefix + ".ppm";
    std::ofstream f;
    f.open(filename.c_str(), std::ofstream::out);
    // PPM header: P3 => RGB, width, height, and max RGB value
    f << "P3 " << width << " " << height << " " << 255 << std::endl;
    // For each pixel, write the space separated RGB values
    for (int i=0; i < width * height; i++) {
      auto p = pixels[i] / samples[i];
      unsigned int r = fmin(255, toInt(p.x)), g = fmin(255, toInt(p.y)), b = fmin(255, toInt(p.z));
      f << r << " " << g << " " << b << std::endl;
    }
  }
  void saveHistogram(std::string filePrefix, int maxIters) {
    std::string filename = filePrefix + ".ppm";
    std::ofstream f;
    f.open(filename.c_str(), std::ofstream::out);
    // PPM header: P3 => RGB, width, height, and max RGB value
    f << "P3 " << width << " " << height << " " << 255 << std::endl;
    // For each pixel, write the space separated RGB values
    for (int i=0; i < width * height; i++) {
      auto p = samples[i] / maxIters;
      unsigned int r, g, b;
      r= g = b = fmin(255, 255 * p);
      f << r << " " << g << " " << b << std::endl;
    }
  }
  ~Image() {
    delete[] pixels;
    delete[] samples;
  }
};


#endif /* image_h */
