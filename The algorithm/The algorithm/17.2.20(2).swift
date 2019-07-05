//
//  17.2.20(2).swift
//  The algorithm
//
//  Created by cpo007@qq.com on 17/2/20.
//  Copyright © 2017年 eggplant. All rights reserved.
//

import Foundation


/*
 66. Plus One
 
 
 Given a non-negative integer represented as a non-empty array of digits, plus one to the integer.
 
 You may assume the integer do not contain any leading zero, except the number 0 itself.
 
 The digits are stored such that the most significant digit is at the head of the list.
 */



func plusOne(_ digits: [Int]) -> [Int] {
    var digits = digits
    for i in (0..<digits.count).reversed() {
        if digits[i] < 9 {
            digits[i] = digits[i] + 1
            return digits
        }
        digits[i] = 0
    }
    digits.insert(0, at: 0)
    return digits
}


/*
 118. Pascal's Triangle
 
 Given numRows, generate the first numRows of Pascal's triangle.
 
 For example, given numRows = 5,
 
 [
 [1],
 [1,1],
 [1,2,1],
 [1,3,3,1],
 [1,4,6,4,1]
 ]
 
 帕斯卡三角形，是一个三角形矩阵，其顶端是 1,视为(row0).第1行(row1)(1&1)两个1,这两个1是由他们上头左右两数之和 (不在三角形内的数视为0).依此类推产生第2行(row2):0+1=1;1+1=2;1+0=1.第3行(row3):0+1=1;1+2=3; 2+1=3;1+0=1. 循此法可以产生以下诸行。
 */


func generate(_ numRows: Int) -> [[Int]] {
    var n = 1
    var arr = [[Int]]()
    if numRows >= n {
        arr.append([1])
        n+=1
    }
    while n <= numRows {
        var array = [Int]()
        for i in 0..<n {
            if i - 1 < 0 {
                let a = 0 + arr[n - 2][i]
                array.append(a)
            } else if i == arr[n - 2].count {
                let a = 0 + arr[n - 2][i - 1]
                array.append(a)
            } else {
                let a = arr[n - 2][i] + arr[n - 2][i - 1]
                array.append(a)
            }
        }
        arr.append(array)
        n+=1
    }
    return arr
}
