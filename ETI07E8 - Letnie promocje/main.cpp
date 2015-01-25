#include <cstdlib>
#include <ctime>

#include <array>
#include <algorithm>
#include <deque>
#include <functional>
#include <iomanip>
#include <iostream>
#include <iterator>
#include <list>
#include <map>
#include <random>
#include <set>
#include <sstream>
#include <string>
#include <thread>
#include <unordered_map>
#include <utility>
#include <typeinfo>

using namespace std;

#define DBG(x) { cout << left << setw(50) << #x << boolalpha << (x) << endl; }
#define DBG_CONT(x) { cout << left << setw(50) << #x; for(auto const& v : (x)) \
	cout << boolalpha << v << " "; cout << endl; }

typedef int64_t i64;

int letterToDigit[] = {
	2, 2, 2,    // abc
	3, 3, 3,    // def
	4, 4, 4,    // ghi
	5, 5, 5,    // jkl
	6, 6, 6,    // mno
	7, 7, 7, 7, // pqrs
	8, 8, 8,    // tuv
	9, 9, 9, 9  // wxyz
};

int main()
{
	int words, numbers;
	cin >> words >> numbers;

	unordered_map<i64,set<string>> dict;

	string s;
	for(int i = 0; i < words; ++i){
		cin >> s;
		i64 val{};
		for(char c : s){
			val *= 10;
			val += letterToDigit[c-'a'];
		}
		dict[val].insert(s);
	}

	for(int i = 0; i < numbers; ++i){
		i64 val{};
		cin >> val;
		try{
			copy(begin(dict.at(val)), end(dict.at(val)), ostream_iterator<string>(cout, " "));
			cout << endl;
		}catch(exception const&){
			cout << "BRAK" << endl;
		}
	}


}

