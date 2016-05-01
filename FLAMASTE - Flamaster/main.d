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

	auto r = ctRegex!r"(\w)\1(\1+)";

	for(int i = 0; i < num; ++i){
		auto l = stdin.byLine.front;
		replaceAll!(v => "%s%d".format(v[1], v[2].length+2))(l, r).writeln;
	}
}
