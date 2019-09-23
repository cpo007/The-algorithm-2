//
//  19.9.23.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/9/23.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation



/*
 1189. “气球” 的最大数量
 
 给你一个字符串 text，你需要使用 text 中的字母来拼凑尽可能多的单词 "balloon"（气球）。
 
 字符串 text 中的每个字母最多只能被使用一次。请你返回最多可以拼凑出多少个单词 "balloon"。
 
 示例 1：
 输入：text = "nlaebolko"
 输出：1
 示例 2：
 
 
 
 输入：text = "loonbalxballpoon"
 输出：2
 示例 3：
 
 输入：text = "leetcode"
 输出：0
   
 
 提示：
 
 1 <= text.length <= 10^4
 text 全部由小写英文字母组成
 
 */


func maxNumberOfBalloons(_ text: String) -> Int {
    
    var map = [Character: Int]()
    
    for c in text{
        if "balloon".contains(c) {
            map[c] = (map[c] ?? 0) + 1
        }
    }
    
    var maxNum = Int.max
    if map.count != 5 { maxNum = 0 }
    for (k,v) in map {
        
        if k.description == "l" || k.description == "o" {
            maxNum = min(maxNum, v / 2)
        } else {
            maxNum = min(maxNum, v)
        }
    }
    return maxNum
}

