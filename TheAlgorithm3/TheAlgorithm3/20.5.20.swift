//
//  20.5.20.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2020/5/20.
//  Copyright © 2020 cpo007@qq.com. All rights reserved.
//

import Foundation

/**
 面试题39. 数组中出现次数超过一半的数字
 
 数组中有一个数字出现的次数超过数组长度的一半，请找出这个数字。

  

 你可以假设数组是非空的，并且给定的数组总是存在多数元素。

  

 示例 1:

 输入: [1, 2, 3, 2, 2, 2, 5, 4, 2]
 输出: 2
  
 
 */

func majorityElement(_ nums: [Int]) -> Int {
    
    var map = [Int:Int]()
    for num in nums {
        map[num] = map[num] != nil ? (map[num]! + 1) : 1
    }
    
    var mm = 0
    var num = 0
    for (k,v) in map {
        if v > mm {
            num = k
            mm = v
        }
    }
    return num
}

/**
 1371. 每个元音包含偶数次的最长子字符串
 
 给你一个字符串 s ，请你返回满足以下条件的最长子字符串的长度：每个元音字母，即 'a'，'e'，'i'，'o'，'u' ，在子字符串中都恰好出现了偶数次。

  

 示例 1：

 输入：s = "eleetminicoworoep"
 输出：13
 解释：最长子字符串是 "leetminicowor" ，它包含 e，i，o 各 2 个，以及 0 个 a，u 。
 示例 2：

 输入：s = "leetcodeisgreat"
 输出：5
 解释：最长子字符串是 "leetc" ，其中包含 2 个 e 。
 示例 3：

 输入：s = "bcbcbc"
 输出：6
 解释：这个示例中，字符串 "bcbcbc" 本身就是最长的，因为所有的元音 a，e，i，o，u 都出现了 0 次。
  

 提示：

 1 <= s.length <= 5 x 10^5
 s 只包含小写英文字母。

 
 
 */


func findTheLongestSubstring(_ s: String) -> Int {
    
    var pos = [Int].init(repeating: -1, count: 1 << 5)
    var ans = 0, status = 0
    pos[0] = 0
    var index = 0
    for c in s{
        switch c {
        case "a" :
            status = status ^ ( 1 << 0)
        case "e" :
            status = status ^ ( 1 << 1)
        case "i" :
            status = status ^ ( 1 << 2)
        case "o" :
            status = status ^ ( 1 << 3)
        case "u" :
            status = status ^ ( 1 << 4)
        default :
            break
        }
        print(String.init(status, radix: 2))
        if pos[status] >= 0 {
            ans = max(ans, index + 1 - pos[status])
        } else {
            pos[status] = index + 1
        }
        
        index+=1
    }

    return ans
}
