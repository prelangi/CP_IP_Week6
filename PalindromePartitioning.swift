/*
Given a string s, partition s such that every substring of the partition is a palindrome.

Return the minimum cuts needed for a palindrome partitioning of s.

Example : 
Given 
s = "aab",
Return 1 since the palindrome partitioning ["aa","b"] could be produced using 1 cut.
*/

import Foundation

class Solution {
	func minCut(_ A: inout String) -> Int {
	    var s = A
	    
	    if(s.isEmpty) {
            return 0
        }
    
        var n = s.count
        
        //Palindrome dp array; pal[i][j] = true if s[i...j] is a palindrome
        var pal  = Array(repeating:Array(repeating: false, count: n), count:n)
        
        //cuts dp array, d[i] = x => s[i...n-1] needs x cuts for it to be a palindrome
        var d = Array(repeating:0,count:n)
        
        //For easier string manipulation in Swift4
        var strArr = [Character]()
        for char in s {
            strArr.append(char)
        }
    
        for i in stride(from:n-1,through:0,by:-1) {
            d[i] = n-1-i
            for j in i..<n {
                
                //j-i < 2 handles cases where j=i and j=i+1 
                if(strArr[i]==strArr[j] && (j-i<2 || pal[i+1][j-1])) {
                    pal[i][j] = true
                    
                    //String from i...n-1 is a palindrome, so zero cuts needed
                    if(j==n-1) {
                        d[i] = 0
                    }
                    else if(d[i] > (1+d[j+1])) {
                        d[i] = 1 + d[j+1]
                    }
                
                }
            }
        }
        
        
        return d[0]

	}
}
