//
//  20.5.11.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2020/5/11.
//  Copyright © 2020 cpo007@qq.com. All rights reserved.
//

import Foundation


/**
 
 面试题50. 第一个只出现一次的字符
 
 在字符串 s 中找出第一个只出现一次的字符。如果没有，返回一个单空格。

 示例:

 s = "abaccdeff"
 返回 "b"

 s = ""
 返回 " "
  

 限制：

 0 <= s 的长度 <= 50000

 
 */

func firstUniqChar(_ s: String) -> Character {
    
    var map = [String: Int]()
    var keys = [String]()
    for c in s {
        map[c.description] = (map[c.description] ?? 0) + 1
        if !keys.contains(c.description) {
            keys.append(c.description)
        }
    }
    
    for key in keys{
        if map[key] == 1 {
            return Character.init(key)
        }
    }
    return Character.init(" ")
}

/**
 面试题62. 圆圈中最后剩下的数字
 
 0,1,,n-1这n个数字排成一个圆圈，从数字0开始，每次从这个圆圈里删除第m个数字。求出这个圆圈里剩下的最后一个数字。

 例如，0、1、2、3、4这5个数字组成一个圆圈，从数字0开始每次删除第3个数字，则删除的前4个数字依次是2、0、4、1，因此最后剩下的数字是3。

  

 示例 1：

 输入: n = 5, m = 3
 输出: 3
 示例 2：

 输入: n = 10, m = 17
 输出: 2
  

 限制：

 1 <= n <= 10^5
 1 <= m <= 10^6

 */



func lastRemaining(_ n: Int, _ m: Int) -> Int {
    
    func f(n: Int, m: Int) -> Int {
        if n == 1 {
            return 0
        }
        let x = f(n: n - 1, m: m)
        return (m + x) % n
    }
    
    return f(n: n, m: m)
}


/**
 
 面试题42. 连续子数组的最大和
 
 输入一个整型数组，数组里有正数也有负数。数组中的一个或连续多个整数组成一个子数组。求所有子数组的和的最大值。

 要求时间复杂度为O(n)。

  

 示例1:

 输入: nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
  

 提示：

 1 <= arr.length <= 10^5
 -100 <= arr[i] <= 100

 */

func maxSubArray(_ nums: [Int]) -> Int {
    
    var dp = [Int].init(repeating: 0, count: nums.count)
    dp[0] = nums[0]
    var output = nums[0]
    for i in 1..<nums.count{
        dp[i] = dp[i - 1] > 0 ? dp[i - 1] + nums[i] : nums[i]
        output = max(dp[i], output)
    }
    return output
}


/**
 50. Pow(x, n)
 
 实现 pow(x, n) ，即计算 x 的 n 次幂函数。

 示例 1:

 输入: 2.00000, 10
 输出: 1024.00000
 示例 2:

 输入: 2.10000, 3
 输出: 9.26100
 示例 3:

 输入: 2.00000, -2
 输出: 0.25000
 解释: 2-2 = 1/22 = 1/4 = 0.25
 说明:

 -100.0 < x < 100.0
 n 是 32 位有符号整数，其数值范围是 [−231, 231 − 1] 。

 */

func quickPow(x: Double, n: Int) -> Double {
    if n == 0 { return 1 }
    let y = quickPow(x: x, n: n / 2)
    return n % 2 == 0 ? y * y : y * y * x
}

func myPow(_ x: Double, _ n: Int) -> Double {
    return n >= 0 ? quickPow(x: x, n: n) : 1.0 / quickPow(x: x, n: -n);
}

