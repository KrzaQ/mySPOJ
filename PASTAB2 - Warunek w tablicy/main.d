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

	//int num = stdin.byLine.front.to!int;
	int num;
	readf(" %s", &num);

	//num = num.max(0).min(999);

	auto r = ctRegex!r"([<>])\s+(\-?\d+)";

	valType[] vals = new valType[num];

	for(int i = 0; i < num; ++i){
		//auto split = stdin.byLine.front.split;
		//auto x = split[0].to!int;
		//auto y = split[1].to!int;
		//auto str = stdin.byLine.front;
		//assert(str.match(ctRegex!r"\d+"));
		//str.writeln;
		//"%s -> %s".format(i, str).writeln;
		//vals[i] = str.filter!(e => e.isDigit || e == '-').to!string.to!valType;
		valType v;
		readf(" %s", &v);
		vals[i] = v;
	}

	//auto m = match(stdin.byLine.front, r);

	//if(!m || m.captures.length != 3) return;

	//valType than = m.captures[2].to!valType;

	char c;
	valType than;
	readf(" %s %s", &c, &than);

	//auto pred = m.captures[1][0] == '>' ?
	auto pred = c == '>' ?
				function bool(valType l, valType r) { return l > r; } :
				function bool(valType l, valType r) { return l < r; };

	vals.filter!(v => pred(v, than)).map!(to!string).joiner("\n").writeln;
	//foreach(v; vals.filter!(v => pred(v, than))){
	//	v.writeln;
	//}
}
