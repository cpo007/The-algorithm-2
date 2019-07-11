//
//  19.7.10.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 2019/7/10.
//  Copyright © 2019年 eggplant. All rights reserved.
//

import Foundation

func fastPow(x: Double, n: Int) -> Double {
    if n == 0 { return 1 }
    let half = fastPow(x: x, n: n / 2)
    if n % 2 == 0 {
        return half * half
    } else {
        return half * half * x
    }
}


/*
 991. 坏了的计算器
 
 在显示着数字的坏计算器上，我们可以执行以下两种操作：
 
 双倍（Double）：将显示屏上的数字乘 2；
 递减（Decrement）：将显示屏上的数字减 1 。
 最初，计算器显示数字 X。
 
 返回显示数字 Y 所需的最小操作数。
 
   
 
 示例 1：
 
 输入：X = 2, Y = 3
 输出：2
 解释：先进行双倍运算，然后再进行递减运算 {2 -> 4 -> 3}.
 示例 2：
 
 输入：X = 5, Y = 8
 输出：2
 解释：先递减，再双倍 {5 -> 4 -> 8}.
 示例 3：
 
 输入：X = 3, Y = 10
 输出：3
 解释：先双倍，然后递减，再双倍 {3 -> 6 -> 5 -> 10}.
 示例 4：
 
 输入：X = 1024, Y = 1
 输出：1023
 解释：执行递减运算 1023 次
   
 
 提示：
 
 1 <= X <= 10^9
 1 <= Y <= 10^9
 
 */

func brokenCalc(_ X: Int, _ Y: Int) -> Int {
    var ans = 0
    var Y = Y
    while Y > X {
        if Y % 2 == 0 {
            Y = Y / 2
        } else {
            Y+=1
        }
        ans+=1
    }
    return ans + X - Y
}

/*
 372. 超级次方
 
 你的任务是计算 ab 对 1337 取模，a 是一个正整数，b 是一个非常大的正整数且会以数组形式给出。
 
 示例 1:
 
 输入: a = 2, b = [3]
 输出: 8
 示例 2:
 
 输入: a = 2, b = [1,0]
 输出: 1024
 
 */

func superPow(_ a: Int, _ b: [Int]) -> Int {
    // a^b % p = (a %p)^b % p
    var r = 1
    let a = a % 1337
    for num in b{
        
        let n1 = powI(x: r, n: 10)
        let n2 = powI(x: a, n: num)
        r = n1 * n2 % 1337
    }
    return r
}

func powI(x: Int, n: Int) -> Int {
    if n == 0 { return 1}
    if n == 1 { return x % 1337 }
    return powI(x: x % 1337, n: n / 2) * powI(x: x % 1337, n: n - n/2) % 1337
    
}


/*
 50. Pow(x, n)
 实现 pow(x, n) ，即计算 x 的 n 次幂函数。
 
 
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

func myPow(_ x: Double, _ n: Int) -> Double {
    
    let x = n > 0 ? x : 1 / x
    let n = abs(n)
    
    
    return fastPow(x: x, n: n)
}


