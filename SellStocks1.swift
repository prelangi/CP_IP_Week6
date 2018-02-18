/*
Best Time to Buy and Sell Stocks I
Say you have an array for which the ith element is the price of a given stock on day i.

If you were only permitted to complete at most one transaction (ie, buy one and sell one share of the stock), design an algorithm to find the maximum profit.

Example :

Input : [1 2]
Return :  1

*/
import Foundation

class Solution {
	func maxProfit(_ A: [Int]) -> Int {
        var minPrice = Int.max
        var maxProfit = 0
        
        for i in 0..<A.count {
            minPrice = min(minPrice,A[i])
            maxProfit = max(maxProfit, A[i]-minPrice)
        }
        
        return maxProfit
	}
}
