#pragma once

#include "ListElement.h"

// Represents List model
class List
{

public:
	// Constructor
	List();
	~List();
	// Constructor with head initialization
	List(int headValue);
	// Addes value to the start of the List
	void append(int inValue);
	// Addes value to the end of the List
	void push_back(int inValue);
	// Takes mHead int value
	int top() const;
	// Takes mHead int value & Removes mHead from List
	int pop();
	// Gets tail pointer
	ListElement *getTail() const;

private:
	// Note List's head
	ListElement *mHead;
	// Note List's tail
	ListElement *mTail;
	// List length
	int mLenght;

};
