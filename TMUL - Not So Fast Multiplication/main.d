import std.stdio;
import std.regex;
import std.string;
import std.algorithm;
import std.conv;
import std.typecons;
import std.bigint;

void main()
{
	int num = stdin.byLine.front.to!int;

	for(int i = 0; i < num; ++i){
		auto split = stdin.byLine.front.split;
		BigInt x = split[0].to!BigInt;
		BigInt y = split[1].to!BigInt;
		(x*y).writeln;
	}

}
