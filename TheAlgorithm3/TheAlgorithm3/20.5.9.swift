//
//  20.5.9.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2020/5/9.
//  Copyright © 2020 cpo007@qq.com. All rights reserved.
//

import Foundation

/**
 69. x 的平方根

 实现 int sqrt(int x) 函数。

 计算并返回 x 的平方根，其中 x 是非负整数。

 由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。

 示例 1:

 输入: 4
 输出: 2
 示例 2:

 输入: 8
 输出: 2
 说明: 8 的平方根是 2.82842...,
      由于返回类型是整数，小数部分将被舍去。

 */
func mySqrt(_ x: Int) -> Int {
    var left = 0, right = x, ans = 0
    while left <= right {
        let mid = left + (right - left) / 2
        if mid * mid <= x {
            ans = mid
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return ans
}

func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
    for letter in letters {
        print(target.asciiValue!, letter.asciiValue!)
        if target.asciiValue! < letter.asciiValue! {
            return letter
        }
    }
    return letters.first!
}


class Solution {
    var count = 0
    var arr: [Int]!

    init(_ w: [Int]) {
        arr = [Int].init(repeating: 0, count: w.count)
        var sum = 0
        var index = 0
        for num in w {
            sum+=num
            arr[index] = sum
            index+=1
        }
        count = sum
    }

    func pickIndex() -> Int {
        let random = Int(arc4random())
        let a = random % (count + 1)
        
        for num in arr {
            if a < num {
                return num
            }
        }
        return 0
    }
}
