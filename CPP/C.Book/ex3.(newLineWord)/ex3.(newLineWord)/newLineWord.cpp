#include <stdio.h>
#include <iostream>
#include <string>

using namespace std;

#define OK 0

// Splits string on words
// Prints every word in a new line
void printWordsFromNewLine(string& inputString)
{
	bool newLineFlag = false;
	for (char& symbol : inputString) {
		switch (symbol)
		{

		case ' ' : 
			if (!newLineFlag)
				cout << endl;
			newLineFlag = true;
			break;
		case '\n' :
			if (!newLineFlag)
				cout << endl;
			newLineFlag = true;
			break;
		case '\t':
			if (!newLineFlag)
				cout << endl;
			newLineFlag = true;
			break;
		default:
			newLineFlag = false;
			cout << symbol;
			break;
		}
	}
}

int main()
{
	cout << "Please, input your string :" << endl;
	string inputString;
	getline(cin, inputString);
	printWordsFromNewLine(inputString);
	return OK;
}