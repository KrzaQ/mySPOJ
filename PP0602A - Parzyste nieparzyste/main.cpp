#include <algorithm>
#include <iostream>
#include <iterator>
#include <vector>

using namespace std;

int main()
{
    cin.tie(nullptr);
    cout.sync_with_stdio(false);

    int n;
    cin >> n;
    while(n --> 0) {
        int64_t line_size;
        cin >> line_size;
        vector<int64_t> e,o;
        e.reserve((line_size+1)/2);
        o.reserve(line_size/2);
        for(int i = 0; i < line_size; ++i) {
            int64_t val;
            cin >> val;
            (i % 2 ? o : e).push_back(val);
        }

        copy(o.begin(), o.end(), ostream_iterator<int>(cout, " "));
        copy(e.begin(), e.end(), ostream_iterator<int>(cout, " "));
        cout << '\n';
    }
}

