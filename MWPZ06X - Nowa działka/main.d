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


void main()
{
	int num = stdin.byLine.front.to!int;

	for(int i = 0; i < num; ++i){
		//auto split = stdin.byLine.front.split;
		//auto x = split[0].to!int;
		//auto y = split[1].to!int;

		auto val = stdin.byLine.front.to!int;

		"%s".format(val*val).writeln;
	}
}
