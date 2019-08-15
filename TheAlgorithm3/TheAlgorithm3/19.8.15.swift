//
//  19.8.15.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/15.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 12. 整数转罗马数字
 
 罗马数字包含以下七种字符： I， V， X， L，C，D 和 M。
 
 字符          数值
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 例如， 罗马数字 2 写做 II ，即为两个并列的 1。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。
 
 通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：
 
 I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
 X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
 C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
 给定一个整数，将其转为罗马数字。输入确保在 1 到 3999 的范围内。
 
 示例 1:
 
 输入: 3
 输出: "III"
 示例 2:
 
 输入: 4
 输出: "IV"
 示例 3:
 
 输入: 9
 输出: "IX"
 示例 4:
 
 输入: 58
 输出: "LVIII"
 解释: L = 50, V = 5, III = 3.
 示例 5:
 
 输入: 1994
 输出: "MCMXCIV"
 解释: M = 1000, CM = 900, XC = 90, IV = 4.
 
 */

func intToRoman(_ num: Int) -> String {
    
    var numStr = "\(num)"
    var count = numStr.count - 1
    
    func getUnit(bit: Int,num: Int) -> String {
        
        switch (bit,num) {
        case (0,1):
            return "I"
        case (0,5):
            return "V"
        case (1,1):
            return "X"
        case (1,5):
            return "L"
        case (2,1):
            return "C"
        case (2,5):
            return "D"
        case (3,1):
            return "M"
        default:
            return ""
        }
    }
    
    var str = ""
    for c in numStr {
        
        var n = Int(c.description)!
        if n == 4 {
            str.append(getUnit(bit: count, num: 1))
            str.append(getUnit(bit: count, num: n + 1))
        } else if n == 9 {
            str.append(getUnit(bit: count, num: 1))
            str.append(getUnit(bit: count + 1, num: 1))
        } else if n < 4 {
            while n > 0 {
                str.append(getUnit(bit: count, num: 1))
                n-=1
            }
        } else if n < 9 {
            str.append(getUnit(bit: count, num: 5))
            while n > 5 {
                str.append(getUnit(bit: count, num: 1))
                n-=1
            }
        }
        count-=1
    }
    
    return str
}


/*
 7. 整数反转
 
 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。
 
 示例 1:
 
 输入: 123
 输出: 321
   示例 2:
 
 输入: -123
 输出: -321
 示例 3:
 
 输入: 120
 输出: 21
 注意:
 
 假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−231,  231 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
 
 */

func reverse(_ x: Int) -> Int {
    
    let isNegative = x < 0
    var x = abs(x)
    var count = "\(x)".count - 1
    var num = 0
    while x > 0 {
        let a = x % 10
        x = x / 10
        num+=(a * Int(pow(10, Double(count))))
        count-=1
    }
    
    num = isNegative ? -num : num
    if num > Int(pow(2.0, 31)) - 1 || num < Int(-pow(2.0, 31)) {
        return 0
    }
    return num
}

/*
 6. Z 字形变换
 
 将一个给定字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。
 
 比如输入字符串为 "LEETCODEISHIRING" 行数为 3 时，排列如下：
 
 L   C   I   R
 E T O E S I I G
 E   D   H   N
 之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："LCIRETOESIIGEDHN"。
 
 请你实现这个将字符串进行指定行数变换的函数：
 
 string convert(string s, int numRows);
 示例 1:
 
 输入: s = "LEETCODEISHIRING", numRows = 3
 输出: "LCIRETOESIIGEDHN"
 示例 2:
 
 输入: s = "LEETCODEISHIRING", numRows = 4
 输出: "LDREOEIIECIHNTSG"
 解释:
 
 L     D     R
 E   O E   I I
 E C   I H   N
 T     S     G
 
 */

func convert(_ s: String, _ numRows: Int) -> String {
    
    var index = 0
    var re = 0
    var isRe = false
    var map = [Int:String]()
    while index < s.count {
        map[re] = (map[re] ?? "") + s[index]
        if !isRe {
            re+=1
        } else {
            re-=1
        }
        if re == numRows - 1 {
            isRe = true
        }
        if re == 0 {
            isRe = false
        }
        index+=1
    }
    var str = ""
    for i in 0..<numRows{
        str.append(map[i] ?? "")
    }
    return str
}
