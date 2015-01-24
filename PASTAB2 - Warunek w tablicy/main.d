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
import std.range;
import std.utf;
import std.ascii;

void main()
{
	alias valType = long;
	
	int num;
	readf(" %s", &num);

	auto r = ctRegex!r"([<>])\s+(\-?\d+)";

	valType[] vals = new valType[num];

	for(int i = 0; i < num; ++i){
		valType v;
		readf(" %s", &v);
		vals[i] = v;
	}

	char c;
	valType than;
	readf(" %s %s", &c, &than);

	auto pred = c == '>' ?
				function bool(valType l, valType r) { return l > r; } :
				function bool(valType l, valType r) { return l < r; };

	vals.filter!(v => pred(v, than)).map!(to!string).joiner("\n").writeln;
}
