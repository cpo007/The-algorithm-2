//
//  19.8.24.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/25.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation



/*
 32. 最长有效括号
 
 给定一个只包含 '(' 和 ')' 的字符串，找出最长的包含有效括号的子串的长度。
 
 示例 1:
 
 输入: "(()"
 输出: 2
 解释: 最长有效括号子串为 "()"
 示例 2:
 
 输入: ")()())"
 输出: 4
 解释: 最长有效括号子串为 "()()"
 
 
 */

func longestValidParentheses(_ s: String) -> Int {
    
    var arr = [Int]()
    arr.append(-1)
    var maxNum = 0
    for i in 0..<s.count{
        if s[i] == "("{
            arr.append(i)
        } else {
            arr.removeLast()
            if arr.count == 0 {
                arr.append(i)
            } else {
                maxNum = max(maxNum, i - arr.last!)
            }
        }
    }
    
    return maxNum
}


/*
 30. 串联所有单词的子串
 
 给定一个字符串 s 和一些长度相同的单词 words。找出 s 中恰好可以由 words 中所有单词串联形成的子串的起始位置。
 
 注意子串要与 words 中的单词完全匹配，中间不能有其他字符，但不需要考虑 words 中单词串联的顺序。
 
 
 
 示例 1：
 
 输入：
 s = "barfoothefoobarman",
 words = ["foo","bar"]
 输出：[0,9]
 解释：
 从索引 0 和 9 开始的子串分别是 "barfoor" 和 "foobar" 。
 输出的顺序不重要, [9,0] 也是有效答案。
 示例 2：
 
 输入：
 s = "wordgoodgoodgoodbestword",
 words = ["word","good","best","word"]
 输出：[]
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/substring-with-concatenation-of-all-words
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func findSubstring2(_ s: String, _ words: [String]) -> [Int] {
    if s.isEmpty || words.count == 0 { return [Int]() }
    
    let len = words.first?.count ?? 0
    var map = [String: Int]()
    var output = [Int]()
    for word in words {
        map[word] = (map[word] ?? 0) + 1
    }
    
    for i in 0..<len{
        
        var left = i
        var right = i
        var count = 0
        var tmpMap = [String: Int]()
        while right + len <= s.count {
            let range = Range(NSRange.init(location: right, length: len), in: s)!
            let tmp_w = s[range].description
            tmpMap[tmp_w] = (tmpMap[tmp_w] ?? 0) + 1
            right+=len
            count+=1
            while (tmpMap[tmp_w] ?? 0) > (map[tmp_w] ?? 0) {
                let range = Range(NSRange.init(location: left, length: len), in: s)!
                let tmp_l_w = s[range].description
                count-=1
                tmpMap[tmp_l_w] = (tmpMap[tmp_l_w] ?? 0) - 1 <= 0 ? nil :  (tmpMap[tmp_l_w] ?? 0) - 1
                left+=len
            }
            if count == words.count { output.append(left) }
        }
    }
    return output
}



func findSubstring(_ s: String, _ words: [String]) -> [Int] {
    if s.isEmpty || words.count == 0 { return [Int]() }
    let len = words.first?.count ?? 0
    let totalLen = words.count * len
    
    var output = [Int]()
    var index = 0
    while index + (totalLen - 1) < s.count {
        
        if let range = Range.init(NSRange.init(location: index, length: totalLen), in: s) {
            let tmpS = s[range].description
            var tmpHashMap = [String: Int]()
            var tmpi = 0
            while tmpi < tmpS.count {
                if let tmpRange = Range.init(NSRange.init(location: tmpi, length: len), in: tmpS) {
                    let tmptmpS = tmpS[tmpRange].description
                    tmpHashMap[tmptmpS] = (tmpHashMap[tmptmpS] ?? 0) + 1
                }
                tmpi+=len
            }
            for word in words {
                if (tmpHashMap[word] != nil) {
                    let num = tmpHashMap[word]! - 1
                    tmpHashMap[word] = num == 0 ? nil : num
                }
            }
            if tmpHashMap.count == 0 {
                output.append(index)
            }
        }
        index+=1
    }
    return output
}

