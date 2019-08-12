//
//  19.8.11.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/12.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 1. 两数之和
 
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 
 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 
 示例:
 
 给定 nums = [2, 7, 11, 15], target = 9
 
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 
 */

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var hashMap = [Int: Int]()
    for i in 0..<nums.count{
        hashMap[nums[i]] = i
    }
    
    for i in 0..<nums.count{
        let num = target - nums[i]
        if hashMap[num] != nil && hashMap[num] != i {
            return [i,hashMap[num]!]
        }
    }
    return [Int]()
}
print(twoSum([3,2,4], 6))

/*1155. 掷骰子的N种方法
 
 这里有 d 个一样的骰子，每个骰子上都有 f 个面，分别标号为 1, 2, ..., f。
 
 我们约定：掷骰子的得到总点数为各骰子面朝上的数字的总和。
 
 如果需要掷出的总点数为 target，请你计算出有多少种不同的组合情况（所有的组合情况总共有 f^d 种），模 10^9 + 7 后返回。
 */


func numRollsToTarget(_ d: Int, _ f: Int, _ target: Int) -> Int {
    
    if d == 1 { return target <= f ? 1 : 0 }
    let mod = 1000000007
    
    var dp = Array<Array<Int>>.init(repeating: Array<Int>.init(repeating: 0, count: 18), count: 3)
    
    for i in 1...min(f, target){
        dp[1][i] = 1
    }
    let targetMax = d * f
    for i in 2...d{
        for j in i...targetMax{
            var k = 1
            while (j - k >= 0 && k <= f) {
                dp[i][j] = (dp[i][j] + dp[i - 1][j - k]) % mod
                k+=1
            }
        }
    }
    return dp[d][target]
}


/*
 1154. 一年中的第几天
 
 给你一个按 YYYY-MM-DD 格式表示日期的字符串 date，请你计算并返回该日期是当年的第几天。
 
 通常情况下，我们认为 1 月 1 日是每年的第 1 天，1 月 2 日是每年的第 2 天，依此类推。每个月的天数与现行公元纪年法（格里高利历）一致。
 
 
 */
func getDay(month: Int,isRun: Bool) -> Int {
    
    let day: Int
    switch month {
    case 1,3,5,7,8,10,12:
        day = 31
        break
    case 4,6,9,11:
        day = 30
        break
    case 2:
        day = isRun ? 29 : 28
    default:
        day = 0
    }
    return day
}

func ordinalOfDate(_ date: String) -> Int {
    
    let strArr = date.components(separatedBy: "-")
    let year = Int(strArr[0])!
    let month = Int(strArr[1])!
    let day = Int(strArr[2])!
    
    let isRun = year % 4 == 0 && year % 100 != 0 || year % 400 == 0
    
    var allDay = 0
    for i in 0...(month - 1){
        allDay+=getDay(month: i, isRun: isRun)
    }
    return allDay + day
    
}


/*
 42. 接雨水
 
 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
 
 示例:
 
 输入: [0,1,0,2,1,0,1,3,2,1,2,1]
 输出: 6
 */

func trap(_ height: [Int]) -> Int {
    
    
    var start = 0
    var end = height.count - 1
    var allWater = 0
    var minHeight = 0
    while start < end {
        
        let tmpMin = min(height[start], height[end])
        var theoryWater = 0
        if tmpMin > minHeight {
            theoryWater = (end - start - 1) * tmpMin
            var tmpIndex = start + 1
            while tmpIndex < end {
                if height[tmpIndex] > minHeight {
                    theoryWater-=min(tmpMin, height[tmpIndex])
                } else {
                    theoryWater-=max(height[tmpIndex], minHeight)
                }
                tmpIndex+=1
            }
        }
        
        
        allWater+=(theoryWater > 0 ? theoryWater : 0)
        minHeight = max(minHeight, tmpMin)
        
        height[start] < height[end] ? (start+=1):(end-=1)
    }
    
    return allWater
}


