#include <stdio.h>
#include <iostream>

/*
	ex 3a
	Find last digit in product 1 * 3 * 5 .... (2*n + 1) 
*/
int ex3aLastProductDigit(int number) {
	unsigned long product = 1;
	int edge = number*2 + 1;
	
	// creating product
	for (int i = 1; i <= edge; i = i + 2) {
		product *= i; 
	}
	
	return (product % 10);
}

/*
	ex3
	Find amount of non-zero digits in the end
*/
int ex3bFindZeros(int n) {
	unsigned long long factorial = 1;
	// create factorial
	for (int i = 2; i <= n; i++) {
		factorial *= i;
	}
	
	int index = 0;
	
	while(factorial % 10 == 0) {
		factorial = factorial / 10;
		index++;
	}
	
	return index;
}

// param for ex 3a
const int param1 = 11;
// param for ex 3b
const int param2 = 15;

int main() {
	int answer1 = ex3aLastProductDigit(param1);
	std::cout << " Exercise 3a\n" << " n = " << param1 << " answer = " << answer1 << "\n"; 
	int answer2 = ex3bFindZeros(param2);
	std::cout << "\n Exercise 3b\n" << " n = " << param2 << " answer = " << answer2 << "\n"; 
	return 0;
}