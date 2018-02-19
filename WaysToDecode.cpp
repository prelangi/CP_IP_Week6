/*
A message containing letters from A-Z is being encoded to numbers using the following mapping:

'A' -> 1
'B' -> 2
...
'Z' -> 26
Given an encoded message containing digits, determine the total number of ways to decode it.

Example :

Given encoded message "12", it could be decoded as "AB" (1 2) or "L" (12).

The number of ways decoding "12" is 2.
*/

int Solution::numDecodings(string A) {
    int n = A.size();
    if (n == 0 || A[0] == '0') return 0;
    if (n == 1) return 1;
    int pre2 = 1, pre1 = 1;
    int cur;
    for (int i = 1; i < n; ++i) {
        cur = 0;
        int first = (A[i] - '0');
        int second = stoi(A.substr(i - 1, 2));
        if (1 <= first && first <= 9)
            cur += pre1;
            
        if (10 <= second && second <= 26)
            cur += pre2;
            
        pre2 = pre1;
        pre1 = cur;
    }
    return cur;
}
