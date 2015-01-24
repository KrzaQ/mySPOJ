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
#include <utility>
#include <typeinfo>

using namespace std;

#define DBG(x) { cout << left << setw(50) << #x << boolalpha << (x) << endl; }
#define DBG_CONT(x) { cout << left << setw(50) << #x; for(auto const& v : (x)) \
	cout << boolalpha << v << " "; cout << endl; }

int main()
{
	int n;
	cin >> n;
	vector<int64_t> v;
	v.reserve(n);

	copy_n(istream_iterator<int64_t>(cin), n, back_inserter(v));

	char c;
	int64_t th;
	cin >> c >> th;

	if(c == '>'){
		for(auto val : v){
			if(val > th) cout << val << '\n';
		}
	}else{
		for(auto val : v){
			if(val < th) cout << val << '\n';
		}
	}
}

