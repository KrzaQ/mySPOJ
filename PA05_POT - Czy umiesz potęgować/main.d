import std.stdio;
import std.regex;
import std.string;
import std.algorithm;
import std.conv;
import std.typecons;
import std.bigint;
import std.functional;
import std.math;

int powerLastDigitLoopSize(int base)
{
	int counter = base;
	for(int i = 0; i < 10; i++){
		counter = (counter * base) % 10;
		if(counter == base){
			return i+1;
		}
	}
	assert(0);
}

int powerLastDigitImpl(int base, int exp)
{
	return exp == 0 ? base == 0 ? 0 : 1 : base * memoize!powerLastDigitImpl(base, exp-1) % 10;
}

int powerLastDigit(int base, int exp)
{
	if(exp == 0) return 1;

	int b = base % 10;
	int loopSize = memoize!powerLastDigitLoopSize(b);
	int e = exp % loopSize;



	if(loopSize == 1) return b;

	return memoize!powerLastDigitImpl(b,e);
}

void main()
{
	int num = stdin.byLine.front.to!int;

	for(int i = 0; i < num; ++i){
		auto split = stdin.byLine.front.split;
		auto x = split[0].to!int % 10;
		auto y = split[1].to!int;

		powerLastDigit(x,y).writeln;
	}

}