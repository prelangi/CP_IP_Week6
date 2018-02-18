/*
You are climbing a stair case. It takes n steps to reach to the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

Example :

Input : 3
Return : 3

Steps : [1 1 1], [1 2], [2 1]
*/
class Solution {
	func climbStairs(_ A: inout Int) -> Int {
        if(A==0 || A==1) {
            return 1
        }
        
        var x1 = 1
        var x2 = 1
        var result = 0
        for i in 2...A {
            result = x1 + x2
            x1 = x2
            x2 = result
        
        }
        
        return result
	}
}
