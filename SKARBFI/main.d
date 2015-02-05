import std.algorithm;
import std.bigint;
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

enum Direction
{
	North,
	South,
	West,
	East
}

void main()
{
	int tests = stdin.extract!int;
		

	for(int i = 0; i < tests; ++i){
		int steps = stdin.extract!int;
		int vertical, horizontal;
		
		for(int j = 0; j < steps; ++j){
			auto d = stdin.extract!int;
			auto s = stdin.extract!int;
			if(d&1){
				d -= 1;
				s = -s;
			}

			//"horizontal: %s, vertical: %s, d: %s, s: %s".format(vertical, horizontal, d, s).writeln;

			d ? horizontal : vertical += s;	
		}

		if(vertical){
			"%d %d".format(vertical > 0 ? 0 : 1, abs(vertical)).writeln;
		}
		if(horizontal){
			"%d %d".format(horizontal > 0 ? 2 : 3, abs(horizontal)).writeln;
		}
		if(!vertical && !horizontal){
			"studnia".writeln;
		}
	}
}
