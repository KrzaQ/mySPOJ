import std.stdio;
import std.regex;
import std.string;
import std.algorithm;
import std.conv;

void main()
{
	//auto r = regex(r"</?(\w+)>");
	auto r = ctRegex!r"</?([^>]+?)>";
	replaceAll!(w => w[0].toUpper)(stdin.byLine.joiner("\n").to!string, r).write;
	stdout.flush();
}