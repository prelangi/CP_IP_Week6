/*
You are given a set of coins S. In how many ways can you make sum N assuming you have infinite amount of each coin in the set.

Note : Coins in set S will be unique. Expected space complexity of this problem is O(N).

Example :

Input : 
	S = [1, 2, 3] 
	N = 4

Return : 4

Explanation : The 4 possible ways are
{1, 1, 1, 1}
{1, 1, 2}
{2, 2}
{1, 3}	
*/

import Foundation

class Solution {
	func coinchange2(_ A: inout [Int], _ B: inout Int) -> Int {
        var numChange = A.count
        var dp = Array(repeating: Array(repeating:0,count:numChange), count: B+1)
        
        for i in 0..<numChange {
            dp[0][i] = 1
        }
        
        for amt in 1...B {
            for change in 0..<numChange {
                var cnt1 = amt - A[change] >= 0 ? dp[amt-A[change]][change] : 0
                var cnt2 = change>=1 ? dp[amt][change-1] : 0
                dp[amt][change] = (cnt1 + cnt2)%1000007
            }
        }
        
        let result = dp[B][numChange-1]
        return result
	}
	
}
