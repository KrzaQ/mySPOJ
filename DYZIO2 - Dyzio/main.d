import std.stdio;
import std.string;
import std.algorithm;
import std.format;
import std.conv;
import std.functional;
import std.math;


bool isPrimeImpl(uint val){
	if(val < 2) return false;
	if(val % 2 == 0) return false;
	auto limit = sqrt((val+1).to!float);
	for(int i = 3; i <= limit; i+=2){
		if(val % i == 0) return false;
	}
	return true;
}

enum ArraySize = 1_000_001;

//alias isPrime = memoize!(isPrimeImpl,ArraySize);
bool[ArraySize] isPrime;

immutable uint[1_000] chunks;

static this(){

	isPrime[2..$].fill(true);
	isPrime[2] = true;

	for(uint i = 2; i < (ArraySize+1)/2; ++i){
		if(isPrime[i]){
			for(uint k = 2; k * i < ArraySize; ++k){
				//"%d * %d -> %d".format(k, i, k*i).writeln;
				isPrime[k * i] = false;
			}
		}
	}

	for(uint i = 0; i < 1_000; i++){
		uint count = 0;
		for(uint j = 1_000 * i + 1; j < 1_000 + 1_000 * i; j += 2){
			count += isPrime[j];
		}
		chunks[i] = count;
	}
	chunks[0] += 1;
	//"this() done".writeln;
}

uint countPrimesInRangeImpl(uint min, uint max){
	//"countPrimesInRange(%d, %d)".format(min, max).writeln;
	if(min > max) {
		return 0;
	} else if(max - min < 1000) {
		uint count;
		for(; min <= max; ++min){
			count += isPrime[min];
		}
		return count;
	} else {
		uint limitFromBottom = (min+999)/1_000;
		uint limitFromTop = max / 1_000;
		uint count;
		count += memoize!countPrimesInRangeImpl(min, limitFromBottom * 1_000);
		count += memoize!countPrimesInRangeImpl(limitFromTop * 1_000 + 1, max);
		for(; limitFromBottom < limitFromTop; ++limitFromBottom){
			count += chunks[limitFromBottom];
		}
		return count;
	}
}

alias countPrimesInRange = memoize!countPrimesInRangeImpl;

auto extract(T, R)(R r){
	T t;
	if(r.readf(" %s", &t) != 1){
		throw new Error("readf failed");
	}
	//"extracted: '%s'".format(t).writeln;
	return t;
}

void main()
{
	int numberOfTests = stdin.extract!int;
	for(int i = 0; i < numberOfTests; ++i){
		int first, last, count;
		first = stdin.extract!int;
		last = stdin.extract!int;
		count = countPrimesInRange(first, last);
		//for(; first <= last; first++){
		//	//bool val = isPrime[first];
		//	//"isPrime(%d) -> %s".format(first, val).writeln;
		//	//count += val;
		//}
		count.writeln;
	}
}