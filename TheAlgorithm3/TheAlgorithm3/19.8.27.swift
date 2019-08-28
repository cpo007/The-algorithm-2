//
//  18.8.27.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/28.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation

/*
 46. 全排列
 给定一个没有重复数字的序列，返回其所有可能的全排列。
 
 示例:
 
 输入: [1,2,3]
 输出:
 [
 [1,2,3],
 [1,3,2],
 [2,1,3],
 [2,3,1],
 [3,1,2],
 [3,2,1]
 ]
 
 
 */

func permute(_ nums: [Int]) -> [[Int]] {
    
    var output = [[Int]]()
    
    func recursion(arr: [Int],tmp: [Int]) {
        if arr.count == 0 {
            output.append(tmp)
            return
        }
        var arr = arr
        for i in (0..<arr.count).reversed(){
            let num = arr[i]
            if output.contains(tmp + [num]) { continue }
            arr.remove(at: i)
            recursion(arr: arr, tmp: tmp + [num])
            arr.insert(num, at: i)
        }
    }
    
    recursion(arr: nums, tmp: [Int]())
    return output
}

/*
 45. 跳跃游戏 II
 
 给定一个非负整数数组，你最初位于数组的第一个位置。
 
 数组中的每个元素代表你在该位置可以跳跃的最大长度。
 
 你的目标是使用最少的跳跃次数到达数组的最后一个位置。
 
 示例:
 
 输入: [2,3,1,1,4]
 输出: 2
 解释: 跳到最后一个位置的最小跳跃数是 2。
           从下标为 0 跳到下标为 1 的位置，跳 1 步，然后跳 3 步到达数组的最后一个位置。
 
 */

func jump(_ nums: [Int]) -> Int {
    
    var end = 0
    var maxPosition = 0
    var deep = 0
    
    for i in 0..<nums.count - 1{
        
        maxPosition = max(maxPosition, nums[i] + i)
        if i == end {
            end = maxPosition
            deep+=1
        }
    }
    return deep
}

print(jump([2,9,6,5,7,0,7,2,7,9,3,2,2,5,7,8,1,6,6,6,3,5,2,2,6,3]))


/*
 43. 字符串相乘
 
 给定两个以字符串形式表示的非负整数 num1 和 num2，返回 num1 和 num2 的乘积，它们的乘积也表示为字符串形式。
 
 示例 1:
 
 输入: num1 = "2", num2 = "3"
 输出: "6"
 示例 2:
 
 输入: num1 = "123", num2 = "456"
 输出: "56088"
 说明：
 
 */

func multiply(_ num1: String, _ num2: String) -> String {
    
    var arr = Array<Int>.init(repeating: 0, count: num1.count + num2.count)
    for i in (0..<num1.count).reversed(){
        
        let intnum1 = Int(num1[i])!
        for j in (0..<num2.count).reversed() {
            let intnum2 = Int(num2[j])!
            
            let product = arr[i+j+1] + intnum1 * intnum2;
            arr[i + j + 1] = product % 10;
            arr[i + j] += product / 10;
        }
    }
    
    var isOK = false
    var str = ""
    
    for i in 0..<arr.count{
        if arr[i] != 0 {
            isOK = true
        }
        if isOK {
            str.append("\(arr[i])")
        }
    }
    return str.isEmpty ? "0" : str
}
