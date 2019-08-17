//
//  19.8.17.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/17.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 16. 最接近的三数之和
 
 给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。
 
 例如，给定数组 nums = [-1，2，1，-4], 和 target = 1.
 
 与 target 最接近的三个数的和为 2. (-1 + 2 + 1 = 2).
 
 */

func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    
    var nums = nums.sorted()
    
    var ans = nums[0] + nums[1] + nums[2]
    for i in 0..<nums.count{
        var start = i + 1
        var end = nums.count - 1
        while start < end {
            let sum = nums[i] + nums[start] + nums[end]
            if abs(target - sum) < abs(target - ans) {
                ans = sum
            }
            if sum > target {
                end-=1
            } else if sum < target {
                start+=1
            } else {
                return ans
            }
        }
    }
    return ans
}


/*
 15. 三数之和
 
 给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
 
 注意：答案中不可以包含重复的三元组。
 
 例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
 
 满足要求的三元组集合为：
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
 
 */
func threeSum2(_ nums: [Int]) -> [[Int]] {
    
    var arr = [[Int]]()
    let count = nums.count
    if nums.count < 3 { return arr }
    var nums = nums.sorted()
    
    for i in 0..<count{
        if nums[i] > 0 { break }
        if i > 0 && nums[i] == nums[i - 1] { continue }
        var L = i + 1
        var R = count - 1
        
        while L < R {
            let sum = nums[i] + nums[L] + nums[R]
            if sum == 0 {
                arr.append([nums[i],nums[L],nums[R]])
                while L < R && nums[L] == nums[L + 1] { L+=1 }
                while L < R && nums[R] == nums[R - 1] { R-=1 }
                L+=1
                R-=1
            } else if sum < 0 {
                L+=1
            } else if sum > 0 {
                R-=1
            }
        }
    }
    
    return arr
}

func threeSum(_ nums: [Int]) -> [[Int]] {
    
    var hashmap = [Int:Int]()
    for num in nums {
        hashmap[num] = (hashmap[num] ?? 0) + 1
        
    }
    var arr = [[Int]]()
    for (key,value) in hashmap{
        if value >= 3 {
            arr.append([key,key,key])
            continue
        }
        var num = -key
        var index = 0
        while num != 0 {
            if hashmap[num] != nil && nums.contains(index) {
                if num == index {
                    if hashmap[num]! >= 2 {
                        if !arr.contains([num,key,index].sorted()){
                            arr.append([num,key,index].sorted())
                        }
                    }
                } else {
                    if !arr.contains([num,key,index].sorted()){
                        arr.append([num,key,index].sorted())
                    }
                }
            }
            key > 0 ? (num+=1) : (num-=1)
            key > 0 ? (index-=1) : (index+=1)
        }
    }
    return arr
}

/*
 14. 最长公共前缀
 
 编写一个函数来查找字符串数组中的最长公共前缀。
 
 如果不存在公共前缀，返回空字符串 ""。
 
 示例 1:
 
 输入: ["flower","flow","flight"]
 输出: "fl"
 示例 2:
 
 输入: ["dog","racecar","car"]
 输出: ""
 解释: 输入不存在公共前缀。
 说明:
 
 所有输入只包含小写字母 a-z 。
 
 */


func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.count == 0 { return "" }
    var hashMap = [Int:String]()
    var index = 0;
    
    while index >= 0 {
        for str in strs{
            if str.count <= index {
                var tmp = ""
                for i in 0..<index{
                    tmp.append(hashMap[i] ?? "")
                }
                return tmp
            }
            if hashMap[index] == nil {
                hashMap[index] = str[index];
            } else {
                if hashMap[index] != str[index] {
                    var tmp = ""
                    for i in 0..<index{
                        tmp.append(hashMap[i] ?? "")
                    }
                    return tmp
                }
            }
        }
        index+=1
    }
    return ""
}
