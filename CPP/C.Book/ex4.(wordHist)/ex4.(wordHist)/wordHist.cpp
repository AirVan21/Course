#include <stdio.h>
#include <iostream>
#include <string>

using namespace std;

#define OK 0

const int MAX_LENGTH = 50;

void countWordLengths(string& inputString, int* statArray)
{
	bool skipFlag = false;
	unsigned int wordLength = 0;
	for (char& symbol : inputString) {
		// Skip case
		if (symbol == ' ' || symbol == '\n' || symbol == '\t') {
			if (!skipFlag) {
				// Remember length of this word
				statArray[wordLength]++;
				wordLength = 0;
			}
			skipFlag = true;
		}
		else {
			wordLength++;
			skipFlag = false;
		}
	}

}

void visualisedPrint(int* lengthArray) {

}

int main()
{
	int lengthArray[MAX_LENGTH];
	for (int i = 0; i < MAX_LENGTH; ++i) {
		lengthArray[i] = 0;
	}
	cout << "Please, input your string :" << endl;
	string inputString;
	getline(cin, inputString);
	countWordLengths(inputString, lengthArray);
	visualisedPrint(lengthArray);
	return OK;
}