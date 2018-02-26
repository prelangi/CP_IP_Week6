/*
Given a string s and a dictionary of words dict, determine if s can be segmented into a space-separated sequence of one or more dictionary words.

For example, given

s = "myinterviewtrainer",
dict = ["trainer", "my", "interview"].
Return 1 ( corresponding to true ) because "myinterviewtrainer" can be segmented as "my interview trainer".

Return 0 / 1 ( 0 for false, 1 for true ) for this problem
*/

//Gives TLE in interviewbit but passes in Leetcode

import Foundation

class Solution {

    func dictionaryContains(_ word: String,_ dictionary: [String]) -> Bool {
        var wordIsInDict = dictionary.contains(word)
        return wordIsInDict
    }

	func wordBreak(_ A: inout String, _ B: inout [String]) -> Int {
	
	var wordDict = B
	var s = A
	    
	    //Base case -- dictionary contains the given string return true
    if(wordDict.contains(s)) {
        return 1
    }
    
    var strArray = Array(s.characters)
    var strLen = s.count
    //print(strArray)
    //Breakup the string and then compute wb at each index
    
    //Array containing wordbreak at each index
    var wb = Array(repeating:0,count:strLen+1)
    wb[0] = 1
    
    for i in 1...(strLen) {
        for j in 0..<(i) {
            var pos1 = j+1
            var len = i-j
            var pos2 = pos1 + len - 1
            var substrtemp2 = strArray[(j+1)..<(i)]
            var substr2 = String(substrtemp2)
            //print("i: \(i), j: \(j), \(substr2)")
            if(wb[j]==0 && dictionaryContains(substr2,wordDict)) {
                //print("Setting w[\(j)] to true")
                wb[i] = 1
                break
            }
            
        }
    }
    
    return wb[strLen]
    }
}
