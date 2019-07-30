//
//  19.7.29.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 2019/7/29.
//  Copyright © 2019年 eggplant. All rights reserved.
//

import Foundation

/*
 690. 员工的重要性
 
 给定一个保存员工信息的数据结构，它包含了员工唯一的id，重要度 和 直系下属的id。
 
 比如，员工1是员工2的领导，员工2是员工3的领导。他们相应的重要度为15, 10, 5。那么员工1的数据结构是[1, 15, [2]]，员工2的数据结构是[2, 10, [3]]，员工3的数据结构是[3, 5, []]。注意虽然员工3也是员工1的一个下属，但是由于并不是直系下属，因此没有体现在员工1的数据结构中。
 
 现在输入一个公司的所有员工信息，以及单个员工id，返回这个员工和他所有下属的重要度之和。
 
 */

struct Employe {
    let id: Int
    let importValue: Int
    let group: [Int]
}

func getImportance(employees: [Employe], id:Int) -> Int?{
    
    var map = [Int: Employe]()
    
    for e in employees {
        map.updateValue(e, forKey: e.id)
    }
    guard let e = map[id] else { return nil }
    
    var output = e.importValue
    for id in e.group{
        if let e = map[id] {
            output+=e.importValue
        }
    }
    return output
}

/*
 594. 最长和谐子序列
 
 和谐数组是指一个数组里元素的最大值和最小值之间的差别正好是1。
 
 现在，给定一个整数数组，你需要在所有可能的子序列中找到最长的和谐子序列的长度。
 
 示例 1:
 
 输入: [1,3,2,2,5,2,3,7]
 输出: 5
 原因: 最长的和谐数组是：[3,2,2,2,3].
 说明: 输入的数组长度最大不超过20,000.
 
 */

func findLHS(_ nums: [Int]) -> Int {
    
    var map = [Int:Int]()
    
    for num in nums{
        map.updateValue((map[num] ?? 0) + 1, forKey: num)
    }
    
    var maxCount = 0
    for (k,v) in map {
        
        if let count1 = map[k - 1] {
            maxCount = max(maxCount, v + count1)
        }
        if let count2 = map[k + 1] {
            maxCount = max(maxCount, v + count2)
        }
        
    }
    return maxCount
}


/*
 784. 字母大小写全排列
 
 给定一个字符串S，通过将字符串S中的每个字母转变大小写，我们可以获得一个新的字符串。返回所有可能得到的字符串集合。
 
 示例:
 输入: S = "a1b2"
 输出: ["a1b2", "a1B2", "A1b2", "A1B2"]
 
 输入: S = "3z4"
 输出: ["3z4", "3Z4"]
 
 输入: S = "12345"
 输出: ["12345"]
 
 
 */


func letterCasePermutation(_ S: String) -> [String] {
    
    var arr = [String]()
    
    func dg(chars: String,i: Int){
        
        if i == chars.count {
            arr.append(chars)
            return
        }
        dg(chars: chars, i: i + 1)
        var chars = chars
        if chars[i] < "0" || chars[i] > "9" {
            var value = chars[i].unicodeScalars.first!.value
            value ^= (1<<5)
            let newChar = String.init(Character.init(Unicode.Scalar.init(value)!))
            let startIndex = chars.index(chars.startIndex, offsetBy: i)
            chars.replaceSubrange(startIndex...startIndex, with: newChar)
            dg(chars: chars, i: i + 1)
        }
    }
    dg(chars: S, i: 0)
    return arr
    
}
