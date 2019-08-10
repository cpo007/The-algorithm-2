//
//  main.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/10.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

import Foundation

/*
 42. 接雨水
 
 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
 
 示例:
 
 输入: [0,1,0,2,1,0,1,3,2,1,2,1]
 输出: 6
 */

func trap(_ height: [Int]) -> Int {
    
    
    var first = 0
    var second = 0
    var allWater = 0
    while first < height.count - 1 {
        
        while height[first] > height[second] || first == second {
            second+=1
            if second > height.count - 1 {
                first+=1
                if first >= height.count - 1 {
                    return allWater
                } else {
                    second = first
                }
            }
        }
        var theoryWater = (second - first - 1) * min(height[first], height[second])
        if theoryWater <= 0 {
            first = second
            continue
        }
        for i in (first + 1)...(second - 1){
            theoryWater-=height[i]
        }
        allWater+=theoryWater
        first = second
    }
    
    return allWater
}

print(trap([4,2,3]))
