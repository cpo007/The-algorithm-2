//
//  19.8.25.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/25.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 38. 报数
 
 报数序列是一个整数序列，按照其中的整数的顺序进行报数，得到下一个数。其前五项如下：
 
 1.     1
 2.     11
 3.     21
 4.     1211
 5.     111221
 1 被读作  "one 1"  ("一个一") , 即 11。
 11 被读作 "two 1s" ("两个一"）, 即 21。
 21 被读作 "one 2",  "one 1" （"一个二" ,  "一个一") , 即 1211。
 
 给定一个正整数 n（1 ≤ n ≤ 30），输出报数序列的第 n 项。
 
 注意：整数顺序将表示为一个字符串。
 
 */


func countAndSay(_ n: Int) -> String {
    
    if n == 1 { return "1" }
    var tmp = "1"
    for _ in 2...n{
        
        var numstr = tmp.first!.description
        var tmpStr = ""
        for j in 1..<tmp.count{
            if !numstr.contains(tmp[j]) {
                let num = Int(numstr.first!.description)!
                let count = numstr.count
                tmpStr.append("\(count)\(num)")
                numstr = ""
                numstr.append(tmp[j])
            } else {
                numstr.append(tmp[j])
            }
        }
        let num = Int(numstr.first!.description)!
        let count = numstr.count
        tmpStr.append("\(count)\(num)")
        tmp = tmpStr
    }
    return tmp
}



/*
 36. 有效的数独
 
 判断一个 9x9 的数独是否有效。只需要根据以下规则，验证已经填入的数字是否有效即可。
 
 数字 1-9 在每一行只能出现一次。
 数字 1-9 在每一列只能出现一次。
 数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。
 
 
 */

func isValidSudoku(_ board: [[Character]]) -> Bool {
    
    var rows = Array<[String: Int]>.init(repeating: [String : Int](), count: 9)
    var columns = Array<[String: Int]>.init(repeating: [String : Int](), count: 9)
    var boxes = Array<[String: Int]>.init(repeating: [String : Int](), count: 9)
    
    for i in 0..<board.count{
        let tmp = board[i]
        for j in 0..<tmp.count{
            let char = tmp[j].description
            if char == "." { continue }
            let box_index = (i / 3 ) * 3 + j / 3;
            rows[i][char] = (rows[i][char] ?? 0) + 1
            columns[j][char] = (columns[j][char] ?? 0) + 1
            boxes[box_index][char] = (boxes[box_index][char] ?? 0) + 1
            if rows[i][char]! > 1 || columns[j][char]! > 1 || boxes[box_index][char]! > 1 {
                return false
            }
        }
    }
    return true
}

/*
 33. 搜索旋转排序数组
 
 假设按照升序排序的数组在预先未知的某个点上进行了旋转。
 
 ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。
 
 搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。
 
 你可以假设数组中不存在重复的元素。
 
 你的算法时间复杂度必须是 O(log n) 级别。
 
 示例 1:
 
 输入: nums = [4,5,6,7,0,1,2], target = 0
 输出: 4
 示例 2:
 
 输入: nums = [4,5,6,7,0,1,2], target = 3
 输出: -1
 
 
 */

func search(_ nums: [Int], _ target: Int) -> Int {
    guard let first = nums.first else { return -1 }
    if target == first { return 0 }
    let isTransNum = target < first
    
    let startNum = nums[nums.count / 2]
    var startIndex = 0
    var endIndex = 0
    if isTransNum {
        if startNum > first {
            startIndex = nums.count / 2
            endIndex = nums.count - 1
        } else if startNum < first {
            if startNum > target {
                startIndex = 0
                endIndex = nums.count / 2
            } else if startNum < target {
                startIndex = nums.count / 2
                endIndex = nums.count - 1
            } else {
                return nums.count / 2
            }
        }
    } else {
        if startNum > first {
            if startNum > target {
                startIndex = 0
                endIndex = nums.count / 2
            } else if startNum < target {
                startIndex = nums.count / 2
                endIndex = nums.count - 1
            } else {
                return nums.count / 2
            }
        } else if startNum < first {
            startIndex = 0
            endIndex = nums.count / 2
        }
    }
    
    for i in startIndex...endIndex {
        if target == nums[i] {
            return i
        }
    }
    return -1
}
