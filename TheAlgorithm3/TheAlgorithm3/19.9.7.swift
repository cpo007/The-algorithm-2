//
//  19.9.7.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/9/7.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 1106. 解析布尔表达式
 
 给你一个以字符串形式表述的 布尔表达式（boolean） expression，返回该式的运算结果。
 
 有效的表达式需遵循以下约定：
 
 "t"，运算结果为 True
 "f"，运算结果为 False
 "!(expr)"，运算过程为对内部表达式 expr 进行逻辑 非的运算（NOT）
 "&(expr1,expr2,...)"，运算过程为对 2 个或以上内部表达式 expr1, expr2, ... 进行逻辑 与的运算（AND）
 "|(expr1,expr2,...)"，运算过程为对 2 个或以上内部表达式 expr1, expr2, ... 进行逻辑 或的运算（OR）
   
 
 示例 1：
 
 输入：expression = "!(f)"
 输出：true
 示例 2：
 
 输入：expression = "|(f,t)"
 输出：true
 示例 3：
 
 输入：expression = "&(t,f)"
 输出：false
 示例 4：
 
 输入：expression = "|(&(t,f,t),!(t))"
 输出：false
   
 
 提示：
 
 1 <= expression.length <= 20000
 expression[i] 由 {'(', ')', '&', '|', '!', 't', 'f', ','} 中的字符组成。
 expression 是以上述形式给出的有效表达式，表示一个布尔值。
 
 */

func parseBoolExpr2(_ expression: String) -> Bool {
    
    var stack = [Int]()
    var expression = expression
    func getBool(boolStr: String) -> String {
        let sumbol = boolStr.first!
        var boolStr = boolStr
        boolStr.removeFirst()
        boolStr.removeFirst()
        boolStr.removeLast()
        var output = ""
        if sumbol == "!" {
            output = boolStr == "t" ? "f" : "t"
        } else if sumbol == "|" {
            output = boolStr.contains("t") ? "t" : "f"
        } else if sumbol == "&" {
            output = boolStr.contains("f") ? "f" : "t"
        }
        return output
    }
    
    var i = 0
    while i < expression.count {
        let char = expression[i]
        if char == "(" {
            stack.append(i)
        } else if char == ")" {
            let index = stack.popLast()!
            let startIndex = expression.index(expression.startIndex, offsetBy: index - 1)
            let endIndex = expression.index(expression.startIndex, offsetBy: i)
            let tmpBool = expression[startIndex...endIndex]
            let replaceBool = getBool(boolStr: String(tmpBool))
            if let range = Range<String.Index>.init(NSRange.init(location: index - 1, length: tmpBool.count), in: expression) {
                expression.replaceSubrange(range, with: replaceBool)
                i = i - tmpBool.count + 1
            }
        }
        i+=1
    }
    return expression == "t"
}


func parseBoolExpr(_ expression: String) -> Bool {
    
    var stack = [Int]()
    var expression = expression
    func getBool(boolStr: String) -> String {
        
        let sumbol = boolStr.first!
        var boolStr = boolStr
        boolStr.removeFirst()
        boolStr.removeFirst()
        boolStr.removeLast()
        var output = ""
        if sumbol == "!" {
            output = boolStr == "t" ? "f" : "t"
        } else if sumbol == "|" {
            output = boolStr.contains("t") ? "t" : "f"
        } else if sumbol == "&" {
            output = boolStr.contains("f") ? "f" : "t"
        }
        return output
    }
    
    for i in (0..<expression.count).reversed(){
        let char = expression[i]
        if char == ")" {
            stack.append(i)
        } else if char == "(" {
            let index = stack.popLast()!
            let startIndex = expression.index(expression.startIndex, offsetBy: i - 1)
            let endIndex = expression.index(expression.startIndex, offsetBy: index)
            let tmpBool = expression[startIndex...endIndex]
            let replaceBool = getBool(boolStr: String(tmpBool))
            if let range = Range<String.Index>.init(NSRange.init(location: i - 1, length: tmpBool.count), in: expression) {
                expression.replaceSubrange(range, with: replaceBool)
                for i in 0..<stack.count{
                    stack[i] = stack[i] - tmpBool.count + 1
                }
            }
        }
    }
    return expression == "t"
}


/*
 1109. 航班预订统计
 
 这里有 n 个航班，它们分别从 1 到 n 进行编号。
 
 我们这儿有一份航班预订表，表中第 i 条预订记录 bookings[i] = [i, j, k] 意味着我们在从 i 到 j 的每个航班上预订了 k 个座位。
 
 请你返回一个长度为 n 的数组 answer，按航班编号顺序返回每个航班上预订的座位数。
 
   
 
 示例：
 
 输入：bookings = [[1,2,10],[2,3,20],[2,5,25]], n = 5
 输出：[10,55,45,25,25]
 
 */

func corpFlightBookings(_ bookings: [[Int]], _ n: Int) -> [Int] {
    
    var addMap = [Int: Int]()
    var minusMap = [Int: Int]()
    
    for i in 0..<bookings.count{
        let a = bookings[i][0]
        let b = bookings[i][1]
        let c = bookings[i][2]
        addMap[a] = (addMap[a] ?? 0) + c
        minusMap[b] = (minusMap[b] ?? 0) + c
    }
    
    var sum = 0
    var arr = [Int].init(repeating: 0, count: n)
    for i in 0..<n{
        sum += addMap[i + 1] ?? 0
        arr[i] = sum
        sum-=(minusMap[i + 1] ?? 0 )
        
    }
    return arr
}


/*
 1052. 爱生气的书店老板
 
 今天，书店老板有一家店打算试营业 customers.length 分钟。每分钟都有一些顾客（customers[i]）会进入书店，所有这些顾客都会在那一分钟结束后离开。
 
 在某些时候，书店老板会生气。 如果书店老板在第 i 分钟生气，那么 grumpy[i] = 1，否则 grumpy[i] = 0。 当书店老板生气时，那一分钟的顾客就会不满意，不生气则他们是满意的。
 
 书店老板知道一个秘密技巧，能抑制自己的情绪，可以让自己连续 X 分钟不生气，但却只能使用一次。
 
 请你返回这一天营业下来，最多有多少客户能够感到满意的数量。
   
 
 示例：
 
 输入：customers = [1,0,1,2,1,1,7,5], grumpy = [0,1,0,1,0,1,0,1], X = 3
 输出：16
 解释：
 书店老板在最后 3 分钟保持冷静。
 感到满意的最大客户数量 = 1 + 1 + 1 + 1 + 7 + 5 = 16.
 
 
 */


func maxSatisfied(_ customers: [Int], _ grumpy: [Int], _ X: Int) -> Int {
    
    
    var maxHappy = 0
    var maxIndex = 0
    for i in 0...customers.count - X{
        var tmp = 0
        for j in i..<(i + X){
            let a = customers[j]
            let b = grumpy[j]
            if b == 1 {
                tmp+=a
            }
        }
        if tmp > maxHappy {
            maxHappy = tmp
            maxIndex = i
        }
    }
    
    var output = 0
    for i in 0..<customers.count{
        if i >= maxIndex && i < maxIndex + X {
            output+=customers[i]
        } else {
            let b = grumpy[i]
            if b == 0 {
                output+=customers[i]
            }
        }
    }
    
    return output
}

