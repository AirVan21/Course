#include "circle.h"

Circle::Circle(Point topLeft, Point bottomRight) : Shape(topLeft, bottomRight)
{
	mRadius = (bottomRight.mX - topLeft.mX) / 2;
}

double Circle::area()
{
	return pi * mRadius * mRadius;
}

double Circle::perim()
{
	return 2 * pi * mRadius;
}

Circle::~Circle()
{}
