//
//  19.7.6.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 2019/7/6.
//  Copyright © 2019年 eggplant. All rights reserved.
//

import Foundation


/*
 628. 三个数的最大乘积
 
 给定一个整型数组，在数组中找出由三个数组成的最大乘积，并输出这个乘积。
 
 示例 1:
 
 输入: [1,2,3]
 输出: 6
 示例 2:
 
 输入: [1,2,3,4]
 输出: 24
 注意:
 
 给定的整型数组长度范围是[3,104]，数组中所有的元素范围是[-1000, 1000]。
 输入的数组中任意三个数的乘积不会超出32位有符号整数的范围。
 
 
 */

func maximumProduct(_ nums: [Int]) -> Int {
    var arr = nums
    arr.sort { (n1, n2) -> Bool in
        return n1 < n2
    }
    let a = arr[arr.count - 1] * arr[arr.count - 2] * arr[arr.count - 3]
    let b = arr[0] * arr[1] * arr[arr.count - 1]
    
    return max(a, b)
}

/*
 152. 乘积最大子序列
 给定一个整数数组 nums ，找出一个序列中乘积最大的连续子序列（该序列至少包含一个数）。
 
 示例 1:
 
 输入: [2,3,-2,4]
 输出: 6
 解释: 子数组 [2,3] 有最大乘积 6。
 示例 2:
 
 输入: [-2,0,-1]
 输出: 0
 解释: 结果不能为 2, 因为 [-2,-1] 不是子数组。
 
 */

func maxProduct(_ nums: [Int]) -> Int {
    
    var output = Int.min
    var imax = 1
    var imin = 1
    
    for i in 0..<nums.count{
        if nums[i] < 0 {
            swap(&imax, &imin)
        }
        
        imax = max(imax * nums[i], nums[i])
        imin = min(imin * nums[i], nums[i])
        output = max(imax, output)
    }
    return output
}


/*
 238. 除自身以外数组的乘积
 
 给定长度为 n 的整数数组 nums，其中 n > 1，返回输出数组 output ，其中 output[i] 等于 nums 中除 nums[i] 之外其余各元素的乘积。
 
 示例:
 
 输入: [1,2,3,4]
 输出: [24,12,8,6]
 说明: 请不要使用除法，且在 O(n) 时间复杂度内完成此题。
 
 进阶：
 你可以在常数空间复杂度内完成这个题目吗？（ 出于对空间复杂度分析的目的，输出数组不被视为额外空间。）
 
 
 */

func productExceptSelf(_ nums: [Int]) -> [Int] {
    
    var arr = Array<Int>.init(repeating: 1, count: nums.count)
    var k = 1
    for i in 0..<nums.count{
        arr[i] = k
        k = nums[i] * k
    }
    k = 1
    for i in (0..<nums.count).reversed(){
        arr[i] = arr[i] * k
        k = nums[i] * k
    }
    return arr
}


/*
 199. 二叉树的右视图
 
 给定一棵二叉树，想象自己站在它的右侧，按照从顶部到底部的顺序，返回从右侧所能看到的节点值。
 
 示例:
 
 输入: [1,2,3,null,5,null,4]
 输出: [1, 3, 4]
 解释:
 
 1            <---
 /   \
 2     3         <---
 \     \
 5     4       <---
 
 */


func rightSideView(_ root: TreeNode?) -> [Int] {
    
    var map = [Int: [Int]]()
    
    returnDeepMap(map: &map, deep: 1, node: root)
    
    var arr = [Int]()
    
    for i in 0..<map.count{
        arr.append(map[i+1]!.first!)
    }
    
    //    for (_,v) in map{
    //        arr.append(v.first!)
    //    }
    
    
    return arr
}

func returnDeepMap(map: inout [Int: [Int]],deep: Int, node: TreeNode?){
    
    if node == nil { return }
    
    var arr = map[deep] ?? [Int]()
    arr.append(node!.val)
    map.updateValue(arr, forKey: deep)
    returnDeepMap(map: &map, deep: deep + 1, node: node?.right)
    returnDeepMap(map: &map, deep: deep + 1, node: node?.left)
}
