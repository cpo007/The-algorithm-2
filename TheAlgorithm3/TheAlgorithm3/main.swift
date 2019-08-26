//
//  main.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/10.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 43. 字符串相乘
 
 给定两个以字符串形式表示的非负整数 num1 和 num2，返回 num1 和 num2 的乘积，它们的乘积也表示为字符串形式。
 
 示例 1:
 
 输入: num1 = "2", num2 = "3"
 输出: "6"
 示例 2:
 
 输入: num1 = "123", num2 = "456"
 输出: "56088"
 说明：
 
 */

func multiply(_ num1: String, _ num2: String) -> String {
    
    var extra = 0
    let maxCount = min(num1.count, num2.count)
    var output = ""
    for i in 0..<maxCount{
        
        let a = i < num1.count ? (Int(num1[num1.count - 1 - i])!) : 0
        let b = i < num2.count ? (Int(num2[num2.count - 1 - i])!) : 0
        if a == 0 || b == 0 {
            let c = a + b
            let d = c % 10
            extra = c / 10
            output = "\(d + extra)" + output
        } else {
            let c = a * b
            let d = c % 10
            extra = c / 10
            output = "\(d + extra)" + output
        }
    }
    
    return output
}

print(multiply("123", "321"))
