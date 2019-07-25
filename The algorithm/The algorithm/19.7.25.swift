//
//  19.7.25.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 2019/7/25.
//  Copyright © 2019年 eggplant. All rights reserved.
//

import Foundation



/*
 78. 子集
 
 给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。
 
 说明：解集不能包含重复的子集。
 
 示例:
 
 输入: nums = [1,2,3]
 输出:
 [
 [3],
     [1],
     [2],
     [1,2,3],
     [1,3],
     [2,3],
     [1,2],
     []
 ]
 
 */


func subsets(_ nums: [Int]) -> [[Int]] {
    
    var output = [[Int]]()
    
    return [[Int]]()
    
    for num in nums{
        for tmp in output {
            output = output + [tmp + [num]]
        }
    }
    return output
}


/*
 697. 数组的度
 给定一个非空且只包含非负数的整数数组 nums, 数组的度的定义是指数组里任一元素出现频数的最大值。
 
 你的任务是找到与 nums 拥有相同大小的度的最短连续子数组，返回其长度。
 
 示例 1:
 
 输入: [1, 2, 2, 3, 1]
 输出: 2
 解释:
 输入数组的度是2，因为元素1和2的出现频数最大，均为2.
 连续子数组里面拥有相同度的有如下所示:
 [1, 2, 2, 3, 1], [1, 2, 2, 3], [2, 2, 3, 1], [1, 2, 2], [2, 2, 3], [2, 2]
 最短连续子数组[2, 2]的长度为2，所以返回2.
 示例 2:
 
 输入: [1,2,2,3,1,4,2]
 输出: 6
 
 */

func findShortestSubArray(_ nums: [Int]) -> Int {
    
    var map = [Int:[Int]]()
    for (i,num) in nums.enumerated(){
        var tmpArr = map[num] ?? [Int]()
        tmpArr.append(i)
        map.updateValue(tmpArr, forKey: num)
    }
    
    var minLength = Int.max
    var du = 0
    for (_,v) in map{
        
        if v.count >= du {
            let length = v.last! - v.first! + 1
            if v.count > du {
                du = v.count
                minLength = length
            } else {
                minLength = min(minLength, length)
            }
        }
    }
    return minLength
}

/*
 34. 在排序数组中查找元素的第一个和最后一个位置
 
 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。
 
 你的算法时间复杂度必须是 O(log n) 级别。
 
 如果数组中不存在目标值，返回 [-1, -1]。
 
 示例 1:
 
 输入: nums = [5,7,7,8,8,10], target = 8
 输出: [3,4]
 示例 2:
 
 输入: nums = [5,7,7,8,8,10], target = 6
 输出: [-1,-1]
 
 */


func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    
    var start = 0
    var end = nums.count - 1
    var arr = [-1,-1]
    
    while start <= end {
        
        if nums[start] == target {
            arr[0] = start
        } else {
            start+=1
        }
        
        if nums[end] == target {
            arr[1] = end
        } else {
            end-=1
        }
        
        if arr[0] != -1 && arr[1] != -1 {
            break
        }
    }
    return arr
}

//print(searchRange([1], 1))
