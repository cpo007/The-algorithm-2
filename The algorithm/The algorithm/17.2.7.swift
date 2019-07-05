//
//  17.2.7.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 17/2/7.
//  Copyright © 2017年 eggplant. All rights reserved.
//

import Foundation

/*
 35. Search Insert Position
 
 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 
 You may assume no duplicates in the array.
 
 Here are few examples.
 [1,3,5,6], 5 → 2
 [1,3,5,6], 2 → 1
 [1,3,5,6], 7 → 4
 [1,3,5,6], 0 → 0
 
 */



func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    
    var start = 0
    var end = nums.count - 1
    while target > nums[start] && target < nums[end] {
        start+=1
        end-=1
    }
    
    if target <= nums[start] {
        return start
    }
    if target == nums[end] {
        return end
    }
    if target > nums[end] {
        return end+1
    }
    return 0
}

/*
 53. Maximum Subarray
 
 Find the contiguous subarray within an array (containing at least one number) which has the largest sum.
 
 For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
 the contiguous subarray [4,-1,2,1] has the largest sum = 6.
 
 */

func maxSubArray(_ nums: [Int]) -> Int {
    var maxSoFar = nums[0], maxSoHere = nums[0]
    for i in 1..<nums.count{
        maxSoHere = max(maxSoHere + nums[i], nums[i])
        maxSoFar = max(maxSoFar, maxSoHere)
    }
    return maxSoFar
}
