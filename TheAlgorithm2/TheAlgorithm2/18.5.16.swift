//
//  18.5.16.swift
//  TheAlgorithm2
//
//  Created by cpo007@qq.com on 2018/5/16.
//  Copyright © 2018年 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 682. Baseball Game
 
 You're now a baseball game point recorder.
 
 Given a list of strings, each string can be one of the 4 following types:
 
 Integer (one round's score): Directly represents the number of points you get in this round.
 "+" (one round's score): Represents that the points you get in this round are the sum of the last two valid round's points.
 "D" (one round's score): Represents that the points you get in this round are the doubled data of the last valid round's points.
 "C" (an operation, which isn't a round's score): Represents the last valid round's points you get were invalid and should be removed.
 Each round's operation is permanent and could have an impact on the round before and the round after.
 
 You need to return the sum of the points you could get in all the rounds.
 
 
 Example 1:
 Input: ["5","2","C","D","+"]
 Output: 30
 Explanation:
 Round 1: You could get 5 points. The sum is: 5.
 Round 2: You could get 2 points. The sum is: 7.
 Operation 1: The round 2's data was invalid. The sum is: 5.
 Round 3: You could get 10 points (the round 2's data has been removed). The sum is: 15.
 Round 4: You could get 5 + 10 = 15 points. The sum is: 30.
 Example 2:
 Input: ["5","-2","4","C","D","9","+","+"]
 Output: 27
 Explanation:
 Round 1: You could get 5 points. The sum is: 5.
 Round 2: You could get -2 points. The sum is: 3.
 Round 3: You could get 4 points. The sum is: 7.
 Operation 1: The round 3's data is invalid. The sum is: 3.
 Round 4: You could get -4 points (the round 3's data has been removed). The sum is: -1.
 Round 5: You could get 9 points. The sum is: 8.
 Round 6: You could get -4 + 9 = 5 points. The sum is 13.
 Round 7: You could get 9 + 5 = 14 points. The sum is 27.
 Note:
 The size of the input list will be between 1 and 1000.
 Every integer represented in the list will be between -30000 and 30000.
 
 */



func calPoints(_ ops: [String]) -> Int {
    
    
    var sum = [Int]()
    for i in 0..<ops.count{
        
        switch ops[i] {
        case "C":
            sum.removeLast()
            break
        case "D":
            sum.append((sum.last ?? 0) * 2)
            break
        case "+":
            sum.append(sum[sum.count - 1] + sum[sum.count - 2])
            break
        default:
            let num = Int(ops[i]) ?? 0
            sum.append(num)
        }
    }
    
    var num = 0
    for a in sum{
        num+=a
    }
    return num
}


/*
 500. Keyboard Row
 
 Given a List of words, return the words that can be typed using letters of alphabet on only one row's of American keyboard like the image below.
 Example 1:
 Input: ["Hello", "Alaska", "Dad", "Peace"]
 Output: ["Alaska", "Dad"]
 Note:
 You may use one character in the keyboard more than once.
 You may assume the input string will only contain letters of alphabet.
 */


var line1 = "QWERTYUIOPqwertyuiop"
var line2 = "ASDFGHJKLasdfghjkl"
var line3 = "ZXCVBNMzxcvbnm"

func findWords(_ words: [String]) -> [String] {
    
    var output = [String]()
    for word in words {
        let c = word.first!
        if line1.contains(c) {
            if isAlphabet(line: line1, word: word) { output.append(word) }
        } else if line2.contains(c) {
            if isAlphabet(line: line2, word: word) { output.append(word) }
        } else if line3.contains(c) {
            if isAlphabet(line: line3, word: word) { output.append(word) }
        }
    }
    return output
}

func isAlphabet(line: String, word:String) -> Bool {
    
    for ch in word{
        if line.contains(ch) {
            continue
        } else {
            return false
        }
    }
    return true
}

/*
 557. Reverse Words in a String III
 
 Given a string, you need to reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.
 
 Example 1:
 Input: "Let's take LeetCode contest"
 Output: "s'teL ekat edoCteeL tsetnoc"
 Note: In the string, each word is separated by single space and there will not be any extra space in the string.
 */


func reverseWords(_ s: String) -> String {
    
    let rs = String(s.reversed())
    let arr = rs.components(separatedBy: " ")
    
    var output = ""
    for str in arr.reversed() {
        output.append(str)
        output.append(" ")
    }
    output.removeLast()
    
    
    return output
}


/*
 821. Shortest Distance to a Character
 
 Given a string S and a character C, return an array of integers representing the shortest distance from the character C in the string.
 
 Example 1:
 
 Input: S = "loveleetcode", C = 'e'
 Output: [3, 2, 1, 0, 1, 0, 0, 1, 2, 2, 1, 0]
 
 
 Note:
 
 S string length is in [1, 10000].
 C is a single character, and guaranteed to be in string S.
 All letters in S and C are lowercase.
 
 */

func shortestToChar(_ S: String, _ C: Character) -> [Int] {
    
    var charIndex = Set<Int>()
    for (index, char) in S.enumerated() where char == C {
        charIndex.insert(index)
    }
    print(charIndex)
    var result = [Int]()
    
    for (index, _) in S.enumerated() {
        var i = 0
        while true {
            if charIndex.contains(index - i) { break }
            if charIndex.contains(index + i) { break }
            i += 1
        }
        result.append(i)
    }
    return result
}



/*
 811. Subdomain Visit Count
 
 A website domain like "discuss.leetcode.com" consists of various subdomains. At the top level, we have "com", at the next level, we have "leetcode.com", and at the lowest level, "discuss.leetcode.com". When we visit a domain like "discuss.leetcode.com", we will also visit the parent domains "leetcode.com" and "com" implicitly.
 
 Now, call a "count-paired domain" to be a count (representing the number of visits this domain received), followed by a space, followed by the address. An example of a count-paired domain might be "9001 discuss.leetcode.com".
 
 We are given a list cpdomains of count-paired domains. We would like a list of count-paired domains, (in the same format as the input, and in any order), that explicitly counts the number of visits to each subdomain.
 
 
 Example 1:
 Input:
 ["9001 discuss.leetcode.com"]
 Output:
 ["9001 discuss.leetcode.com", "9001 leetcode.com", "9001 com"]
 Explanation:
 We only have one website domain: "discuss.leetcode.com". As discussed above, the subdomain "leetcode.com" and "com" will also be visited. So they will all be visited 9001 times.
 
 Example 2:
 Input:
 ["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"]
 Output:
 ["901 mail.com","50 yahoo.com","900 google.mail.com","5 wiki.org","5 org","1 intel.mail.com","951 com"]
 Explanation:
 We will visit "google.mail.com" 900 times, "yahoo.com" 50 times, "intel.mail.com" once and "wiki.org" 5 times. For the subdomains, we will visit "mail.com" 900 + 1 = 901 times, "com" 900 + 50 + 1 = 951 times, and "org" 5 times.
 
 */



func subdomainVisits(_ cpdomains: [String]) -> [String] {
    
    
    var dict = [String: Int]()
    for str in cpdomains {
        let strArr = str.components(separatedBy: " ")
        var url = strArr.last ?? ""
        
        let ms = Int(strArr.first ?? "0") ?? 0
        dict.updateValue((dict[url] ?? 0) + ms, forKey: url)
        
        while let range = url.range(of: "."){
            let s = url.suffix(from: range.upperBound).description
            dict.updateValue((dict[s] ?? 0) + ms, forKey: s)
            url = s
        }
    }
    
    var strArr = [String]()
    for (k,v) in dict{
        strArr.append("\(v) \(k)")
    }
    
    return strArr
}

/*
 806. Number of Lines To Write String
 
 We are to write the letters of a given string S, from left to right into lines. Each line has maximum width 100 units, and if writing a letter would cause the width of the line to exceed 100 units, it is written on the next line. We are given an array widths, an array where widths[0] is the width of 'a', widths[1] is the width of 'b', ..., and widths[25] is the width of 'z'.
 
 Now answer two questions: how many lines have at least one character from S, and what is the width used by the last such line? Return your answer as an integer list of length 2.
 
 
 Example :
 Input:
 widths = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]
 S = "abcdefghijklmnopqrstuvwxyz"
 Output: [3, 60]
 Explanation:
 All letters have the same length of 10. To write all 26 letters,
 we need two full lines and one line with 60 units.
 Example :
 Input:
 widths = [4,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]
 S = "bbbcccdddaaa"
 Output: [2, 4]
 Explanation:
 All letters except 'a' have the same length of 10, and
 "bbbcccdddaa" will cover 9 * 10 + 2 * 4 = 98 units.
 For the last 'a', it is written on the second line because
 there is only 2 units left in the first line.
 So the answer is 2 lines, plus 4 units in the second line.
 */


func numberOfLines(_ widths: [Int], _ S: String) -> [Int] {
    
    var lines = 1
    var unit = 0
    for ascii in S.unicodeScalars {
        let index = Int(ascii.value - 97)
        let width = widths[index]
        if unit + width < 100 {
            unit+=width
        } else if unit + width == 100 {
            unit = 0
            lines+=1
        } else {
            unit = width
            lines+=1
        }
    }
    return [lines,unit]
}

