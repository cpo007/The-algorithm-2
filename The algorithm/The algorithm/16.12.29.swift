//
//  16.12.29.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 16/12/29.
//  Copyright © 2016年 eggplant. All rights reserved.
//

import Foundation


/*
 Add Strings
 
 
 Given two non-negative numbers num1 and num2 represented as string, return the sum of num1 and num2.
 
 Note:
 
 The length of both num1 and num2 is < 5100.
 Both num1 and num2 contains only digits 0-9.
 Both num1 and num2 does not contain any leading zero.
 You must not use any built-in BigInteger library or convert the inputs to integer directly.
 */


func addStrings(_ num1: String, _ num2: String) -> String {
    
    let length = max(num1.characters.count, num2.characters.count)
    var jinwei = 0
    var sum = ""
    for i in (0..<length).reversed(){
        let n1c = i > num1.characters.count - 1 ? 0 : Int(num1.characters.reversed()[i].description) ?? 0
        let n2c = i > num2.characters.count - 1 ? 0 : Int(num2.characters.reversed()[i].description) ?? 0
        let str = "\((n1c + n2c + jinwei) % 10)"
        jinwei = (n1c + n2c + jinwei) / 10
        sum.append(str)
    }
    if jinwei == 1 {
        sum.append("\(jinwei)")
    }
    sum = String(sum.characters.reversed())
    return  sum
}


/*
 Convert a Number to Hexadecimal
 
 Given an integer, write an algorithm to convert it to hexadecimal. For negative integer, two’s complement method is used.
 
 Note:
 
 All letters in hexadecimal (a-f) must be in lowercase.
 The hexadecimal string must not contain extra leading 0s. If the number is zero, it is represented by a single zero character '0'; otherwise, the first character in the hexadecimal string will not be the zero character.
 The given number is guaranteed to fit within the range of a 32-bit signed integer.
 You must not use any method provided by the library which converts/formats the number to hex directly.
 
 */

func getStr(num: Int) -> String {
    if num < 10 {
        return "\(num)"
    } else {
        if let scalar = UnicodeScalar(num + 87) {
            let a = Character(scalar)
            return a.description
        }
    }
    return ""
}


func toHex(_ num: Int) -> String {
    var num = num
    if num < 0 {
        num = Int(pow(16.0, 8.0)) + num
    }
    var str = ""
    while num / 16 != 0 || num % 16 != 0 {
        let yu = num % 16
        num/=16
        str.append(getStr(num: yu))
    }
    str = String(str.characters.reversed())
    return str
}


/*
 Repeated Substring Pattern
 
 
 Given a non-empty string check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assume the given string consists of lowercase English letters only and its length will not exceed 10000.
 
 Example 1:
 Input: "abab"
 
 Output: True
 
 Explanation: It's the substring "ab" twice.
 Example 2:
 Input: "aba"
 
 Output: False
 Example 3:
 Input: "abcabcabcabc"
 
 Output: True
 
 Explanation: It's the substring "abc" four times. (And the substring "abcabc" twice.)
 
 */


func repeatedSubstringPattern(_ str: String) -> Bool {

    if str.characters.count < 2 { return false }
    for i in (1...str.characters.count/2).reversed(){
        if str.characters.count % i == 0 {
            let s = str.substring(to: str.index(str.startIndex, offsetBy: i))
            var s2 = ""
            let m = str.characters.count / s.characters.count
            for _ in 0..<m{
                s2.append(s)
            }
            if s2 == str { return true }
        }
    }
    return false
}
