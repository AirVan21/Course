#include <stdio.h>
#include "triangle.h"
#include "subtriangle.h"
int main() {
	Point pBase1(3, 5);
	Point pBase2(7, 5);
	Point pTop(5, 13);
	Triangle *figure = new Triangle(pBase1, pBase2, pTop);
	std::cout << "Triangle:" << std::endl;
	figure->draw();
	SubTraingle *subfugure = new SubTraingle(pBase1, pBase2, pTop);
	std::cout << "SubTriangle:" << std::endl;
	subfugure->draw();
	return 0;
}