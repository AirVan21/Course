#include "Stack.h"

Stack::Stack() : 
	top(nullptr)
{}

void Stack::push(int param)
{
	StackElement *element = new StackElement(param);
	if (top == nullptr) {
		top = element;
	} else {
		auto help = top;
		element->setNext(help);
		top = element;
	}
}

int Stack::pop()
{
	if (top != nullptr) {
		int answer = 0;
		answer = top->getValue();
		top = top->getNext();
		return answer;
	} else {
		return -1;
	}
}
