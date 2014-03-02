#pragma once 

#include "StackElement.h"

class Stack{

public:

	Stack();

	void push(int param);

	int pop();

private:
	// Pointer to the top
	StackElement *top;
};
