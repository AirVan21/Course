#include "List.h"

List::List() :
	mHead(nullptr),
	mTail(nullptr),
	mLenght(0)
{}

List::List(int inValue)
{
	ListElement *start = new ListElement(inValue);
	mHead = start;
	mTail = start;
	mLenght = 1;
}

void List::append(int inValue)
{
	ListElement *updateHead = new ListElement(inValue);
	if (mLenght == 0) {
		mHead = updateHead;
		mTail = updateHead;
	}
	else {
		updateHead->setNext(mHead);
		mHead = updateHead;
	}
	mLenght++;
}

void List::push_back(int inValue)
{
	ListElement *updateTail = new ListElement(inValue);
	if (mLenght == 0) {
		mHead = updateTail;
		mTail = updateTail;
	}
	else {
		mTail->setNext(updateTail);
		mTail = updateTail;
	}
	mLenght++;
}

int List::pop() 
{
	// throw exception
	ListElement *newHead = mHead->getNext();
	int answer = mHead->getValue();
	delete mHead;
	mLenght--;
	mHead = newHead;
	return answer;
}

int List::top() const
{
	return mHead->getValue();
}

ListElement *List::getTail() const
{
	return mTail;
}

List::~List()
{
}