#pragma once 

#include "StackElement.h"

class Stack{

public:

	Stack();

	void push(int param);

	int pop();

	/*
		Get's or modifies value of element on top of the Stack
	*/
	int& topStack();

private:
	// Pointer to the top
	StackElement *top;
};
