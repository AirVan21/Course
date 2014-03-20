#include "rational.h"

Rational::Rational(int numer, int denom) :
	mNumerator(numer),
	mDenominator(denom)
{}

Rational::operator const double()
{
	return  double(mNumerator) / mDenominator;
}

Rational::~Rational()
{}