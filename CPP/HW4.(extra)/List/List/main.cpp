#include <stdio.h>
#include <iostream>

#include "List.h"

using namespace std;

// Adds "inValue" to the list, after element in "inPos" position
// If nPos > list.mLength => ignore addition
void addAfterN(List &lst, int nPos, int inValue)
{
	if (lst.getLength() >= nPos) {
		ListElement *additional = new ListElement(inValue);
		ListElement *current = lst.getHead();
		for (int i = 1; i < nPos; i++) {
			current = current->getNext();
		}
		additional->setNext(current->getNext());
		current->setNext(additional);
		lst.setLength(lst.getLength() + 1);
	}
}

int main()
{
	// Init
	List list;
	list.append(5);
	list.append(2);
	list.push_back(8);
	
	// Addes 99, after 2nd element in list
	addAfterN(list, 2, 99);
	
	// Gets tail element. Squares it's value
	ListElement *last = list.getTail();
	cout << "List tail value = " << last->getValue() << endl;
	last->setValue(last->getValue() * last->getValue());
	cout << "List tail value = " << last->getValue() << endl;
	
	// Reverts elements in list
	// Before : 2 5 99 64
	// After : 64, 99, 5, 2
	list.revert();

	return 0;
}