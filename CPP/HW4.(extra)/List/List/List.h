#pragma once

#include "ListElement.h"

// Represents List model
class List
{

public:
	// Constructor
	List();
	// Addes value to the start of the List
	void append(int inValue);
	// Addes value to the end of the List
	void push_back(int inValue);
	// Takes mHead int value
	int top() const;
	// Takes mHead int value & Removes mHead from List
	int pop();
	// Gets tail pointer
	ListElement *getTail();
	// Gets head pointer
	ListElement *getHead();
	// Gets mLenght
	int getLength() const;
	// Sets mLenght
	void setLength(int newLength);
	// Reverts list
	void revert();

private:
	// Note List's head
	ListElement *mHead;
	// Note List's tail
	ListElement *mTail;
	// List length
	int mLength;

};
