/*
Find the longest increasing subsequence of a given sequence / array.

In other words, find a subsequence of array in which the subsequence’s elements are in strictly increasing order, and in which the subsequence is as long as possible. 
This subsequence is not necessarily contiguous, or unique.
In this case, we only care about the length of the longest increasing subsequence.

Example :

Input : [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]
Output : 6
The sequence : [0, 2, 6, 9, 13, 15] or [0, 4, 6, 9, 11, 15] or [0, 4, 6, 9, 13, 15]
*/
import Foundation

class Solution {
	func lis(_ A: [Int]) -> Int {
	    var nums = A
	    var arrLen = nums.count
        var result = 0
        
        //Base case
        if(arrLen==0) {
            return result
        }
        
        
        var lis = Array(repeating: 1, count:arrLen)
        
        for i in 1..<arrLen {
            for j in 0..<i {
                //print("nums[\(i)] = \(nums[i]), nums[\(j)] = \(nums[j]),lis[\(i)] = \(lis[i]), lis[\(j)] = \(lis[j]) ")
                if(nums[i]>nums[j] && lis[i]<(lis[j]+1)) {
                    lis[i] = lis[j] + 1
                    //print("Updating lis[\(i)] to \(lis[i])")
                }
            }
        }
        
        result = lis[0]
        for i in 1..<arrLen {
            result = max(result,lis[i])
        }
        
        return result

	}
}
