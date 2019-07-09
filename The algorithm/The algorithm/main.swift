//
//  main.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 16/12/16.
//  Copyright © 2016年 eggplant. All rights reserved.
//

import Foundation



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

