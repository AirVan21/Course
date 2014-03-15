#include "ListElement.h"

ListElement::ListElement(int inValue) :
	mValue(inValue),
	mNext(nullptr)
{}

int ListElement::getValue() const
{
	return mValue;
}

void ListElement::setValue(const int newValue)
{
	mValue = newValue;
}

ListElement *ListElement::getNext() const
{
	return mNext;
}

void ListElement::setNext(ListElement *newNext)
{
	mNext = newNext;
}

ListElement::~ListElement()
{}