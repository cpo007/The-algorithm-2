//
//  16.12.24.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 16/12/24.
//  Copyright © 2016年 eggplant. All rights reserved.
//

import Foundation




/*
 136. Single Number
 Given an array of integers, every element appears twice except for one. Find that single one.
 
 */

func singleNumber(_ nums: [Int]) -> Int {
    var dic = [Int:Int]()
    for n in nums {
        if dic[n] != nil {
            dic[n]!+=1
        } else {
            dic[n] = 1
        }
    }
    var a = 0
    for (k,v) in dic {
        if v == 1 {
            a = k
        }
    }
    return a
}

/*
 Add Digits
 Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.
 
 For example:
 
 Given num = 38, the process is like: 3 + 8 = 11, 1 + 1 = 2. Since 2 has only one digit, return it.
 
 */
//LeetCode上的题目仅限于两位数运算，若参与运算的是更高位又会如何？
func addDigits(_ num: Int) -> Int {
    var num = num
    while (num / 10) != 0 {
        num = num / 10 + num % 10
    }
    return num
}
