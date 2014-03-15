#include <stdio.h>
#include <iostream>

#include "List.h"

using namespace std;

int main()
{
	List list;
	list.append(5);
	list.append(2);
	list.push_back(8);
	cout << "List head value = " << list.top() << endl;
	list.pop();
	cout << "List head value = " << list.top() << endl;
	return 0;
}