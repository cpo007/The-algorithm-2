//
//  19.8.26.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/26.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 41. 缺失的第一个正数
 
 给定一个未排序的整数数组，找出其中没有出现的最小的正整数。
 
 示例 1:
 
 输入: [1,2,0]
 输出: 3
 示例 2:
 
 输入: [3,4,-1,1]
 输出: 2
 示例 3:
 
 输入: [7,8,9,11,12]
 输出: 1
 说明:
 
 你的算法的时间复杂度应为O(n)，并且只能使用常数级别的空间。
 
 */

func firstMissingPositive(_ nums: [Int]) -> Int {
    if nums.count == 0 { return 1 }
    var arr = [Int]()
    for i in 1...(nums.count + 1){
        arr.append(i)
    }
    
    for i in 0..<nums.count{
        
        if let index = arr.index(of: nums[i]) {
            arr.remove(at: index)
        }
    }
    
    return arr.first!
}



/*
 40. 组合总和 II
 
 给定一个数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
 
 candidates 中的每个数字在每个组合中只能使用一次。
 
 说明：
 
 所有数字（包括目标数）都是正整数。
 解集不能包含重复的组合。
 示例 1:
 
 输入: candidates = [10,1,2,7,6,1,5], target = 8,
 所求解集为:
 [
 [1, 7],
 [1, 2, 5],
 [2, 6],
 [1, 1, 6]
 ]
 
 */

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    let count = candidates.count
    if count == 0 { return [[Int]]() }
    
    var res = [[Int]]()
    let candidates = candidates.sorted()
    
    func findCombinationSum(residue: Int, pre: [Int], arr: [Int]) {
        if residue == 0 {
            if !res.contains(pre) {
                res.append(pre)
            }
            return
        }
        if residue < 0 {
            return
        }
        
        var arr = arr
        for i in (0..<arr.count).reversed(){
            if residue - arr[i] >= 0 {
                let num = arr[i]
                arr.remove(at: i)
                findCombinationSum(residue: residue - num, pre: pre + [num], arr: arr)
            }
        }
    }
    
    findCombinationSum(residue: target, pre: [Int](), arr: candidates)
    
    return res
}


/*
 39. 组合总和
 
 给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
 
 candidates 中的数字可以无限制重复被选取。
 
 说明：
 
 所有数字（包括 target）都是正整数。
 解集不能包含重复的组合。
 示例 1:
 
 输入: candidates = [2,3,6,7], target = 7,
 所求解集为:
 [
 [7],
 [2,2,3]
 ]
 示例 2:
 
 输入: candidates = [2,3,5], target = 8,
 所求解集为:
 [
     [2,2,2,2],
     [2,3,3],
     [3,5]
 ]
 
 
 */

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    
    let count = candidates.count
    if count == 0 { return [[Int]]() }
    
    var res = [[Int]]()
    let candidates = candidates.sorted()
    
    func findCombinationSum(residue: Int, start: Int, pre: [Int]) {
        if residue == 0 {
            res.append(pre)
            return
        }
        
        var start = start
        var pre = pre
        while start < count && residue - candidates[start] >= 0 {
            pre.append(candidates[start])
            findCombinationSum(residue: residue - candidates[start], start: start, pre: pre)
            pre.removeLast()
            start+=1
        }
    }
    
    findCombinationSum(residue: target, start: 0, pre: [Int]())
    
    return res
}

