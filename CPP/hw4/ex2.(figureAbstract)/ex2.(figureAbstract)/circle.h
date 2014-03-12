#include "shape.h"

const double pi = 3.141592653;

class Circle : public Shape
{
public:

	Circle(Point topLeft, Point bottomRight);
	~Circle();

	double perim();
	double area();

private:

	double mRadius;

};