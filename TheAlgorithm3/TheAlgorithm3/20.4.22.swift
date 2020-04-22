//
//  20.4.22.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2020/4/22.
//  Copyright © 2020 cpo007@qq.com. All rights reserved.
//

import Foundation

/*
 1190. 反转每对括号间的子串
 
 给出一个字符串 s（仅含有小写英文字母和括号）。
 
 请你按照从括号内到外的顺序，逐层反转每对匹配括号中的字符串，并返回最终的结果。
 
 注意，您的结果中 不应 包含任何括号。
 
 示例 1：
 
 输入：s = "(abcd)"
 输出："dcba"
 示例 2：
 
 输入：s = "(u(love)i)"
 输出："iloveu"
 示例 3：
 
 输入：s = "(ed(et(oc))el)"
 输出："leetcode"
 示例 4：
 
 输入：s = "a(bcdefghijkl(mno)p)q"
 输出："apmnolkjihgfedcbq"
 

 
 */


func reverseParentheses(_ s: String) -> String {
    
    var start = 0
    var end = s.count - 1
    var s = s
    while start < end {
        
        if s[start] != "(" { start+=1
            continue
        }
        if s[end] != ")" { end -= 1
            continue
        }
        let startIndex = s.index(String.Index.init(utf16Offset: start, in: s), offsetBy: 0)
        let endIndex = s.index(String.Index.init(utf16Offset: end, in: s), offsetBy: 0)
        let tmpStr = s[startIndex...endIndex]
        var tmpRevStr = String(tmpStr.reversed())
        tmpRevStr.removeFirst()
        tmpRevStr.removeLast()
        tmpRevStr = tmpRevStr.replacingOccurrences(of: "(", with: "*)")
        tmpRevStr = tmpRevStr.replacingOccurrences(of: ")", with: "(*")

//        start+=1
        end-=2
        s = s.replacingOccurrences(of: tmpStr, with: tmpRevStr)

    }
    
    return s
}

