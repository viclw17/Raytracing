class Point3 {
public:
    float x,y,z;
};

class Triangle {
private:
    Point3 m_vertex[3];

public:
    Triangle(const Point3& P0, const Point3& P1, const Point3& P2);
    const Point3& vertex(int i) const;
};

class TriangleList {
public:
    Array<Point3> vertexArray;
    Triangle triangle(int t) const {
        return Triangle(
            vertexArray[t*3],
            vertexArray[t*3+1],
            vertexArray[t*3+2]);
    }
    int size() const {
        return vertexArray.size() / 3;
    }
};

class IndexedTriangleList {
public:
    Array<Point3> vertexArray;
    Array<int>    indexArray;

    // Initialization
    Triangle triangle(int t) const {
        return Triangle(
            vertexArray[indexArray[t*3]],
            vertexArray[indexArray[t*3+1]],
            vertexArray[indexArray[t*3+2]]);
    }
    int size() const {
        return indexArray.size() / 3;
    }
};
