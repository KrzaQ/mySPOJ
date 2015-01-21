import std.stdio;
import std.regex;
import std.string;
import std.algorithm;
import std.format;
import std.conv;
import std.typecons;
import std.bigint;
import std.functional;
import std.math;

struct Result
{
	int value;
	int calculations;
}

bool isPalindrome(string s)
{
	int max = s.length/2;
	for(int i = 0; i <= max; ++i){
		if(s[i] != s[$ - 1 - i]) return false;
	}
	return true;
}

Result checkNumber(int val)
{
	string s = val.to!string;

	if(s.isPalindrome){
		return Result(val, 0);
	}else{
		auto r = memoize!checkNumber(s.to!(char[]).reverse.to!int + val);
		r.calculations++;
		return r;
	}
}

void main()
{
	int num = stdin.byLine.front.to!int;

	for(int i = 0; i < num; ++i){
		//auto split = stdin.byLine.front.split;
		//auto x = split[0].to!int;
		//auto y = split[1].to!int;
		auto r = stdin.byLine.front.to!int.checkNumber;
		"%d %d".format(r.value, r.calculations).writeln;
	}
}