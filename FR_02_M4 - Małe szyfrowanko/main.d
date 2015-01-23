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

immutable string alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ";
char[1024*100] buf;

auto encrypt(S)(S s, S key)
{
	char[] ret = buf[0..s.length];
	int ki;
	int kl = key.length;
	foreach(i, c; s){
		if(c == ' '){
			ret[i] = ' ';
			continue;
		}

		int offset = c - 'A' + key[ki%kl] - 'A';
		ret[i] = alphabet[offset];
		ki++;
	}
	return ret;
}

void main()
{
	int num = stdin.byLine.front.to!int;

	//auto r = ctRegex!r"(\w)\1(\1+)";

	for(int i = 0; i < num; ++i){
		//auto split = stdin.byLine.front.split;
		//auto x = split[0].to!int;
		//auto y = split[1].to!int;
		auto key = stdin.byLine.front;
		auto s = stdin.byLine.front;
		s.encrypt(key).writeln;
	}
}
