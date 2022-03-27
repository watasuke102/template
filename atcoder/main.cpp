#include <bits/stdc++.h>
using namespace std;
using ull = unsigned long long;
using ll  = long long;
#define endl                '\n'
#define PI                  3.14159265359
#define rep(i, init, max)   for (ull i = (init); i < (ull)(max); i++)
#define eqrep(i, init, max) for (ull i = (init); i <= (ull)(max); i++)
#define debug(...)          fprintf(stderr, __VA_ARGS__)
template <typename T = ull> T re() {
  T a;
  cin >> a;
  return a;
}
#pragma GCC diagnostic               ignored "-Wunused-value"
template <class T, class... Ts> void print(const T& a, const Ts&... b) {
  cout << a;
  (cout << ... << (cout << ' ', b));
  cout << endl;
}
template <class T> void veccout(const vector<T>& vec, bool is_break = false) {
  rep(i, 0, vec.size()) { cout << vec[i] << (char)((is_break) ? '\n' : ' '); }
  cout << endl;
}
#define veccin(name)   rep(i, 0, name.size()) cin >> name[i]
#define vecrev(name)   reverse(name.begin(), name.end())
#define vecsort(name)  sort(name.begin(), name.end())
#define vecsortg(name) sort(name.begin(), name.end(), greater<int>())

int main() {
  return 0;
}
