//
//  main.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 16/12/16.
//  Copyright © 2016年 eggplant. All rights reserved.
//

import Foundation


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

    let coefficient: Double = n > 0 ? x : 1/x
    var x = n > 0 ? x : 1 / x
    var n = abs(n)

    while n > 1 {
        
        x = coefficient * x
        n-=1
    }
    
    return x
}

print(myPow(2.0, -2))
