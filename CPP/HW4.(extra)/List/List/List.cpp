#include "List.h"

List::List() :
	mHead(nullptr),
	mTail(nullptr),
	mLength(0)
{}

void List::append(int inValue)
{
	ListElement *updateHead = new ListElement(inValue);
	if (mLength == 0) {
		mHead = updateHead;
		mTail = updateHead;
	}
	else {
		updateHead->setNext(mHead);
		mHead = updateHead;
	}
	mLength++;
}

void List::push_back(int inValue)
{
	ListElement *updateTail = new ListElement(inValue);
	if (mLength == 0) {
		mHead = updateTail;
		mTail = updateTail;
	}
	else {
		mTail->setNext(updateTail);
		mTail = updateTail;
	}
	mLength++;
}

int List::pop() 
{
	// throw exception
	ListElement *newHead = mHead->getNext();
	int answer = mHead->getValue();
	delete mHead;
	mLength--;
	mHead = newHead;
	return answer;
}

int List::top() const
{
	return mHead->getValue();
}

ListElement *List::getTail() 
{
	return mTail;
}

ListElement *List::getHead() 
{
	return mHead;
}

int List::getLength() const
{
	return mLength;
}

void List::setLength(int newLenght)
{
	mLength = newLenght;
}
// Before revert List : x, y, z, w
// After revert  List : w, z, y, x 
void List::revert()
{
	// "Write" List in the end
	ListElement *lastModified = mTail;
	ListElement *step;
	// for all elements befor tail
	for (int i = 1; i < mLength; i++) {
		step = mHead;
		// Gets pre lastModified value
		while (step->getNext() != lastModified) {
			step = step->getNext();
		}
		lastModified->setNext(step);
		lastModified = step;
	}
	mHead = mTail;
	mTail = lastModified;
	mTail->setNext(nullptr);
}

