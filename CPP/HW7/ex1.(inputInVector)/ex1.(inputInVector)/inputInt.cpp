#include <iostream>
#include <stdio.h>
#include <vector>

using namespace std;

void print(const vector<int> &storage)
{
	cout << "\nOutput :" << endl;
	for (auto i = storage.begin(); i != storage.end(); i++) {
		cout << *i << " ";
	}
	cout << endl;
}

int main()
{
	int input;
	vector<int> storage;
	cout << "Input int value sequence (0 for escape) :" << endl;
	cin >> input;
	while (input) {
		storage.push_back(input);
		cin >> input;
	}
	// Reverse input order
	reverse(storage.begin(), storage.end());
	// Output
	print(storage);
	return 0;
}