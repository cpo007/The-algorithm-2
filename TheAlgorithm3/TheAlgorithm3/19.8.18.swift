//
//  19.8.18.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/19.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 20. 有效的括号
 
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
 
 有效字符串需满足：
 
 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。
 
 示例 1:
 
 输入: "()"
 输出: true
 示例 2:
 
 输入: "()[]{}"
 输出: true
 示例 3:
 
 输入: "(]"
 输出: false
 示例 4:
 
 输入: "([)]"
 输出: false
 示例 5:
 
 输入: "{[]}"
 输出: true
 
 */

func isValid(_ s: String) -> Bool {
    if s.count < 2 { return false }
    
    func isOneTeam(a: String, b: String) -> Bool {
        if a == "(" && b == ")" {
            return true
        }
        if a == "[" && b == "]" {
            return true
        }
        if a == "{" && b == "}" {
            return true
        }
        return false
    }
    
    var stack = [String]()
    for str in s {
        if str == "(" || str == "[" || str == "{" {
            stack.append(str.description)
        } else if str == ")" || str == "]" || str == "}" {
            
            guard let last = stack.last else { return false }
            if isOneTeam(a: last, b: str.description) {
                stack.removeLast()
                continue
            } else {
                return false
            }
        }
    }
    return stack.count == 0
    
}


/*
 18. 四数之和
 
 给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，使得 a + b + c + d 的值与 target 相等？找出所有满足条件且不重复的四元组。
 
 注意：
 
 答案中不可以包含重复的四元组。
 
 示例：
 
 给定数组 nums = [1, 0, -1, 0, -2, 2]，和 target = 0。
 
 满足要求的四元组集合为：
 [
 [-1,  0, 0, 1],
 [-2, -1, 1, 2],
 [-2,  0, 0, 2]
 ]
 
 */

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    
    var nums = nums.sorted()
    let count = nums.count
    if count < 4 { return [[Int]]() }
    
    var output = [[Int]]()
    for i in 0..<(count - 3){
        if i > 0 && nums[i] == nums[i - 1] { continue }
        if nums[i] + nums[i + 1] + nums[i + 2] + nums[i + 3] > target { break }
        if nums[i] + nums[count - 1] + nums[count - 2] + nums[count - 3] < target { continue }
        for j in (i + 1)..<(count - 2){
            
            if j - i > 1 && nums[j] == nums[j - 1] { continue }
            if nums[i] + nums[j] + nums[j + 1] + nums[j + 2] > target { break }
            if nums[i] + nums[j] + nums[count - 1] + nums[count - 2] < target { continue }
            
            var left = j + 1
            var right = count - 1
            
            while left < right {
                
                let sum = nums[i] + nums[j] + nums[left] + nums[right]
                if sum == target {
                    output.append([nums[i],nums[j],nums[left],nums[right]])
                    while left < right && nums[left] == nums[left + 1] { left+=1 }
                    while left < right && nums[right] == nums[right - 1] { right-=1}
                    left+=1
                    right-=1
                } else if sum > target {
                    right-=1
                } else if sum < target {
                    left+=1
                }
            }
        }
    }
    return output
}


/*
 17. 电话号码的字母组合
 
 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。
 
 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
 
 
 
 示例:
 
 输入："23"
 输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 */


func letterCombinations(_ digits: String) -> [String] {
    
    func getLetter(digit: String) -> String {
        let str: String
        switch digit {
        case "2" :
            str = "abc"
        case "3" :
            str = "def"
        case "4" :
            str = "ghi"
        case "5" :
            str = "jkl"
        case "6" :
            str = "mno"
        case "7" :
            str = "pqrs"
        case "8" :
            str = "tuv"
        case "9" :
            str = "wxyz"
        default :
            str = ""
        }
        return str
    }
    
    
    var tmp = [String]()
    for digit in digits {
        let letters = getLetter(digit: digit.description)
        var arr = [String]()
        if tmp.count == 0 {
            for letter in letters {
                arr.append(letter.description)
            }
        } else {
            for letter in letters {
                for split in tmp {
                    arr.append(split + letter.description)
                }
            }
        }
        tmp = arr
    }
    
    return tmp
}
