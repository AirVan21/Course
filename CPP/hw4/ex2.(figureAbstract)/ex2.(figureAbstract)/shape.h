#pragma once
#include "point.h"

// Represents abstract figure
class Shape
{
public:

	Shape(Point nodeOne, Point nodeTwo);
	~Shape();
	// Perimeter
	virtual double perim() = 0;
	// Square
	virtual double area() = 0;

protected:

	Point mTopLeft;
	Point mBottomRight;
};
