
/*
Given two words A and B, find the minimum number of steps required to convert A to B. (each operation is counted as 1 step.)

You have the following 3 operations permitted on a word:

Insert a character
Delete a character
Replace a character
Example : 
edit distance between
"Anshuman" and "Antihuman" is 2.

Operation 1: Replace s with t.
Operation 2: Insert i.
*/
import Foundation

class Solution {
	func minDistance(_ A: inout String, _ B: inout String) -> Int {
	    
	    var word1 = A
	    var word2 = B
	    if(word1.count==0) {
            return word2.count
        }
        
        if(word2.count==0) {
            return word1.count
        }
        
        var m = word1.count
        var n = word2.count
        var dp = Array(repeating:Array(repeating:0,count:n+1) , count:m+1 )
        for i in 0...m {
            dp[i][0] = i
        }
        
        for j in 0...n {
            dp[0][j] = j
        }
        
        var word1Arr = Array(word1.characters)
        var word2Arr = Array(word2.characters)
        
        for i in 1...m {
            for j in 1...n {
                dp[i][j] = min(dp[i-1][j], dp[i][j-1])+1
                if(word1Arr[i-1] == word2Arr[j-1]) {
                    dp[i][j] = min(dp[i][j],dp[i-1][j-1])
                }
                else {
                    dp[i][j] = min(dp[i][j],dp[i-1][j-1]+1)
                }
            }
        }
        
        return dp[m][n]
    

	}
}
