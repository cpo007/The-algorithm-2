//
//  16.12.27.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 16/12/27.
//  Copyright © 2016年 eggplant. All rights reserved.
//

import Foundation


/*
 Excel Sheet Column Title
 
 Given a positive integer, return its corresponding column title as appear in an Excel sheet.
 
 For example:
 
 1 -> A
 2 -> B
 3 -> C
 ...
 26 -> Z
 27 -> AA
 28 -> AB
 
 */

func convertToTitle(_  n: Int) -> String {
    var str = ""
    var n = n
    while n > 0 {
        n-=1
        if let scalar = UnicodeScalar(n % 26 + 65) {
            let a = Character(scalar)
            str.append(a)
        }
        n/=26
    }
    str = String(str.characters.reversed())
    return str
}

/*
 Excel Sheet Column Number
 
 Given a column title as appear in an Excel sheet, return its corresponding column number.
 
 For example:
 
 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28
 
 */
func titleToNumber(_ s: String) -> Int {
    var n = 0
    var x:Double = 0
    for c in s.characters.reversed() {
        if let f = c.description.unicodeScalars.first {
            let num = Int(f.value - 64)
            n = n + num * Int(pow(26.0, x))
        }
        x+=1
    }
    return n
}



/*
 Valid Anagram
 
 Given two strings s and t, write a function to determine if t is an anagram of s.
 
 For example,
 s = "anagram", t = "nagaram", return true.
 s = "rat", t = "car", return false.
 
 Note:
 You may assume the string contains only lowercase alphabets.
 */



func isAnagram(_ s: String, _ t: String) -> Bool {
    var dic = [Character:Int]()
    var dic2 = [Character:Int]()
    for c in t.characters {
        if dic[c] != nil {
            dic[c]!+=1
        } else {
            dic[c] = 1
        }
    }
    for c in s.characters {
        if dic2[c] != nil {
            dic2[c]!+=1
        } else {
            dic2[c] = 1
        }
    }
    return dic == dic2
    
}


/*
 Majority Element
 
 
 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
 
 You may assume that the array is non-empty and the majority element always exist in the array.
 */


func majorityElement(_ nums: [Int]) -> Int {
    var dic = [Int:Int]()
    for n in nums {
        if dic[n] != nil {
            dic[n]!+=1
        } else {
            dic[n] = 1
        }
    }
    let a = dic.sorted{$0.value > $1.value}
    print(a)
    return a.first?.key ?? 0
}


/*
 Longest Palindrome
 
 Given a string which consists of lowercase or uppercase letters, find the length of the longest palindromes that can be built with those letters.
 
 This is case sensitive, for example "Aa" is not considered a palindrome here.
 
 Example:
 
 Input:
 "abccccdd"
 
 Output:
 7
 
 Explanation:
 One longest palindrome that can be built is "dccaccd", whose length is 7.
 
 */


func longestPalindrome(_ s: String) -> Int {
    
    var dic = [Character:Int]()
    for c in s.characters{
        if dic[c] != nil {
            dic[c]!+=1
        } else {
            dic[c] = 1
        }
    }
    var length = 0
    var hasCenter = false
    for (_,v) in dic {
        if v % 2 == 0 {
            length+=v
        } else {
            if hasCenter {
                length = length + v - 1
            } else {
                length = length + v
            }
            hasCenter = true
        }
    }
    return length
}

/*
 Contains Duplicate
 Given an array of integers, find if the array contains any duplicates. Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.
 */

func containsDuplicate(_ nums: [Int]) -> Bool {
    var dic = [Int:Int]()
    for n in nums{
        if dic[n] != nil {
            dic[n]!+=1
        } else {
            dic[n] = 1
        }
    }
    for (_,v) in dic {
        if v >= 2 {
            return true
        }
    }
    return false
}
