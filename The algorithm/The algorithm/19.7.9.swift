//
//  19.7.9.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 2019/7/9.
//  Copyright © 2019年 eggplant. All rights reserved.
//

import Foundation



/*
 1103. 分糖果 II
 
 排排坐，分糖果。
 
 我们买了一些糖果 candies，打算把它们分给排好队的 n = num_people 个小朋友。
 
 给第一个小朋友 1 颗糖果，第二个小朋友 2 颗，依此类推，直到给最后一个小朋友 n 颗糖果。
 
 然后，我们再回到队伍的起点，给第一个小朋友 n + 1 颗糖果，第二个小朋友 n + 2 颗，依此类推，直到给最后一个小朋友 2 * n 颗糖果。
 
 重复上述过程（每次都比上一次多给出一颗糖果，当到达队伍终点后再次从队伍起点开始），直到我们分完所有的糖果。注意，就算我们手中的剩下糖果数不够（不比前一次发出的糖果多），这些糖果也会全部发给当前的小朋友。
 
 返回一个长度为 num_people、元素之和为 candies 的数组，以表示糖果的最终分发情况（即 ans[i] 表示第 i 个小朋友分到的糖果数）。
 
 */

func distributeCandies(_ candies: Int, _ num_people: Int) -> [Int] {
    
    var candies = candies
    var arr = Array<Int>.init(repeating: 0, count: num_people)
    
    var index = 0
    var candiesCount = 1
    while candies > 0 {
        
        if candies - candiesCount < 0 {
            arr[index] = arr[index] + candies
            candies = 0
        } else {
            arr[index] = arr[index] + candiesCount
            candies -= candiesCount
        }
        
        index+=1
        candiesCount+=1
        if index >= num_people {
            index = 0
        }
    }
    return arr
}

/*
 942. 增减字符串匹配
 
 给定只含 "I"（增大）或 "D"（减小）的字符串 S ，令 N = S.length。
 
 返回 [0, 1, ..., N] 的任意排列 A 使得对于所有 i = 0, ..., N-1，都有：
 
 如果 S[i] == "I"，那么 A[i] < A[i+1]
 如果 S[i] == "D"，那么 A[i] > A[i+1]
 
 示例 1：
 
 输出："IDID"
 输出：[0,4,1,3,2]
 示例 2：
 
 输出："III"
 输出：[0,1,2,3]
 示例 3：
 
 输出："DDI"
 输出：[3,2,0,1]
   
 
 提示：
 
 1 <= S.length <= 1000
 S 只包含字符 "I" 或 "D"。
 
 */

func diStringMatch(_ S: String) -> [Int] {
    
    var arr = [Int]()
    var min = 0
    var max = S.count
    
    for i in 0..<S.count{
        
        if S[i] == "I" {
            arr.append(min)
            min+=1
        } else {
            arr.append(max)
            max-=1
        }
        
    }
    arr.append(min)
    return arr
}



/*
 55. 跳跃游戏
 
 给定一个非负整数数组，你最初位于数组的第一个位置。
 
 数组中的每个元素代表你在该位置可以跳跃的最大长度。
 
 判断你是否能够到达最后一个位置。
 
 示例 1:
 
 输入: [2,3,1,1,4]
 输出: true
 解释: 从位置 0 到 1 跳 1 步, 然后跳 3 步到达最后一个位置。
 示例 2:
 
 输入: [3,2,1,0,4]
 输出: false
 解释: 无论怎样，你总会到达索引为 3 的位置。但该位置的最大跳跃长度是 0 ， 所以你永远不可能到达最后一个位置。
 
 
 */


func canJump(_ nums: [Int]) -> Bool {
    if nums.count <= 1 { return true }
    var index = 0
    //开始点的极值区间，例如 头元素为3时极值区间为 [0,3]
    var totalLength = nums[0] + 0
    //若最大极值区间大于等于数组末尾下标则代表能达到结尾
    if totalLength >= (nums.count - 1) {
        return true
    }
    
    while index < totalLength {
        //记录当前极值区间
        let oldLength = totalLength
        
        for i in (index + 1)...totalLength{
            //获取最大极值区间
            totalLength = max(nums[i] + i, totalLength)
        }
        
        //若最大极值区间大于等于数组末尾下标则代表能达到结尾
        if totalLength >= (nums.count - 1) {
            return true
        }
        //若从头部寻找其所有可能性，极值区间都没有增长，则代表已没有增长可能，则返回极值区间长度
        if totalLength == oldLength {
            return false
        }
        index = oldLength
    }
    return false
}

/*
 1051. 高度检查器
 
 学校在拍年度纪念照时，一般要求学生按照 非递减 的高度顺序排列。
 
 请你返回至少有多少个学生没有站在正确位置数量。该人数指的是：能让所有学生以 非递减 高度排列的必要移动人数。
 
   
 
 示例：
 
 输入：[1,1,4,2,1,3]
 输出：3
 解释：
 高度为 4、3 和最后一个 1 的学生，没有站在正确的位置。
   
 
 提示：
 
 1 <= heights.length <= 100
 1 <= heights[i] <= 100
 
 
 */

func heightChecker(_ heights: [Int]) -> Int {
    
    var arr = heights
    arr.sort { (num1, num2) -> Bool in
        num1 < num2
    }
    var count = 0
    for i in 0..<heights.count{
        
        if heights[i] != arr[i] {
            count+=1
        }
    }
    return count
}

/*
 970. 强整数
 
 给定两个正整数 x 和 y，如果某一整数等于 x^i + y^j，其中整数 i >= 0 且 j >= 0，那么我们认为该整数是一个强整数。
 
 返回值小于或等于 bound 的所有强整数组成的列表。
 
 你可以按任何顺序返回答案。在你的回答中，每个值最多出现一次。
 
   
 
 示例 1：
 
 输入：x = 2, y = 3, bound = 10
 输出：[2,3,4,5,7,9,10]
 解释：
 2 = 2^0 + 3^0
 3 = 2^1 + 3^0
 4 = 2^0 + 3^1
 5 = 2^1 + 3^1
 7 = 2^2 + 3^1
 9 = 2^3 + 3^0
 10 = 2^0 + 3^2
 示例 2：
 
 输入：x = 3, y = 5, bound = 15
 输出：[2,4,6,8,10,14]
 
 */


func powerfulIntegers(_ x: Int, _ y: Int, _ bound: Int) -> [Int] {
    
    let max = 20
    var arr = [Double]()
    for i in 0..<max{
        
        let temp1 = pow(Double(x), Double(i))
        if temp1 > Double(bound) { break }
        
        for j in 0..<max{
            let temp2 = pow(Double(y), Double(j))
            if temp2 > Double(bound) { break }
            let tmp = temp1 + temp2
            if tmp <= Double(bound) && !arr.contains(tmp) {
                arr.append(tmp)
            }
        }
    }
    
    let output = arr.map { (num) -> Int in
        return Int(num)
    }
    return output
}

