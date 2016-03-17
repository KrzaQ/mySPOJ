import std.algorithm;
import std.bigint;
import std.conv;
import std.format;
import std.functional;
import std.math;
import std.stdio;
import std.string;


auto binomialCoefficientImpl(T,U)(U k, U n)
{
	T result = 1;
	auto loopMax = min(k-n, n);
	for(U i = 0; i < loopMax; ++i){
		result *= k-i;
		result /= i+1;
	}
	return result;
}

alias binomialCoefficient = memoize!(binomialCoefficientImpl!(ulong, uint));

auto extract(T, R)(R r)
{
	T t;
	if(r.readf(" %s", &t) != 1){
		throw new Error("readf failed");
	}
	//"extracted: '%s'".format(t).writeln;
	return t;
}

void main()
{
	int numberOfTests = stdin.extract!uint;
	for(int i = 0; i < numberOfTests; ++i) {
		int k, n;
		k = stdin.extract!uint;
		n = stdin.extract!uint;
		binomialCoefficient(k, n).writeln;
	}
}
