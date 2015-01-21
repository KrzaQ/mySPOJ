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

string toBase(uint b)(ulong val)
{
	return val.toImpl!string(b);
}

alias to11 = memoize!(toBase!11);
alias to16 = memoize!(toBase!16);

void main()
{
	int num = stdin.byLine.front.to!int;

	for(int i = 0; i < num; ++i){
		//auto split = stdin.byLine.front.split;
		//auto x = split[0].to!int;
		//auto y = split[1].to!int;

		auto val = stdin.byLine.front.to!ulong;

		//"%s %s".format(val.to16, val.to11).writeln;
		"%s %s".format(val.toImpl!string(16), val.toImpl!string(11)).writeln;

	}
}
