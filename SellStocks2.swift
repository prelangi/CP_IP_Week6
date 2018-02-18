import Foundation

class Solution {
	func maxProfit(_ A: [Int]) -> Int {
	    var maxProfit = 0
	    if(A.count==0) {
	        return maxProfit
	    }
	    
	    for i in 1..<A.count {
	        maxProfit += A[i]>A[i-1] ? A[i]-A[i-1]: 0
	        
	    }

        return maxProfit
	}
}
