import std.algorithm;
import std.bigint;
import std.container;
import std.conv;
import std.format;
import std.functional;
import std.math;
import std.range;
import std.regex;
import std.stdio;
import std.string;
import std.typecons;
import std.uni;
import std.utf;

immutable int[] letterToDigit = [
	2, 2, 2,    // abc
	3, 3, 3,    // def
	4, 4, 4,    // ghi
	5, 5, 5,    // jkl
	6, 6, 6,    // mno
	7, 7, 7, 7, // pqrs
	8, 8, 8,    // tuv
	9, 9, 9, 9  // wxyz
];

auto extract(T, R)(R r){
	T t;
	if(r.readf(" %s", &t) != 1){
		throw new Error("readf failed");
	}
	//"extracted: '%s'".format(t).writeln;
	return t;
}

string extract(T: string, R)(R r)
{
	string s;
	
	char[1] buf;
	char[] rng;

	do{
		rng = r.rawRead(buf);
	}while(rng.length && rng[0].isWhite);

	while(rng.length && !rng[0].isWhite){
		s ~= rng[0];
		rng = r.rawRead(buf);
		//rng.map!(to!ubyte).array.writeln;
	}

	return s;
}

void main()
{
	//int num = stdin.byLine.front.to!int;

	//alias StringList = Appender!(string[]);
	//alias StringList = string[];
	alias StringList = RedBlackTree!string;
	alias Number = long;

	StringList[Number] dict;

	long words = stdin.extract!long;
	long numbers = stdin.extract!long;

	auto foo = function int(dchar c){
		//c.writeln;
		auto r = letterToDigit[cast(uint)(c-'a')];
		//"%s -> %s".format(c, r).writeln;
		return r;
	};

	for(long i = 0; i < words; ++i){
		auto str = stdin.extract!string.filter!(isLower);

		//"'%s'".format(str).writeln;

		auto val = str.map!(foo).map!(to!string).join.to!Number;
		//"%10s -> %-10s".format(str,val).writeln;
		//dict[val].put(str);
		auto it = val in dict;
		if(!it) dict[val] = new StringList;
		dict[val].stableInsert(str.to!string);
		//auto tmp = dict[val].sort.uniq;
		//tmp.copy(dict[val]);
		//dict[val].sort.copy(dict[val]);
	}

	//dict.writeln;

	for(long i = 0; i < numbers; ++i){

		auto val = stdin.extract!Number;

		StringList* data = val in dict;

		if(data) (*data)[].join(" ").writeln;
		else "BRAK".writeln;
	}
}
