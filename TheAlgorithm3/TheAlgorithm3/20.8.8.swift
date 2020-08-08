//
//  20.8.8.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2020/8/8.
//  Copyright © 2020 cpo007@qq.com. All rights reserved.
//

import Foundation

/**
 99. 恢复二叉搜索树
 
 二叉搜索树中的两个节点被错误地交换。

 请在不改变其结构的情况下，恢复这棵树。

 示例 1:

 输入: [1,3,null,null,2]

    1
   /
  3
   \
    2

 输出: [3,1,null,null,2]

    3
   /
  1
   \
    2
 示例 2:

 输入: [3,1,4,null,null,2]

   3
  / \
 1   4
    /
   2

 输出: [2,1,4,null,null,3]

   2
  / \
 1   4
    /
   3

 */

func recoverTree(_ root: TreeNode?)  {
    
    let nums = inOrder(node: root, arr: [])
    let xy = findTwoSwappedNum(arr: nums)
    recover(node: root, x: xy.0, y: xy.1)
    
}

func inOrder(node: TreeNode?, arr: [Int]) -> [Int] {
    guard let node = node else { return arr }
    var tmp = [Int]()
    tmp = tmp + inOrder(node: node.left, arr: arr)
    tmp = tmp + [node.val]
    tmp = tmp + inOrder(node: node.right, arr: arr)
    return tmp
}

func findTwoSwappedNum(arr: [Int]) -> (Int,Int) {
    
    var x = -1, y = -1
    for i in 0..<arr.count - 1 {
        if arr[i] > arr[i + 1] {
            y = arr[i + 1]
            if x == -1 {
                x = arr[i]
            } else {
                break
            }
        }
        
    }
    return (x,y)
}

func recover(node: TreeNode?, x: Int, y: Int) {
    guard let node = node else { return }
    if node.val == x || node.val == y {
        node.val = node.val == x ? y : x
    }
    recover(node: node.left, x: x, y: y)
    recover(node: node.right, x: x, y: y)
}


/**
  面试题 16.10. 生存人数
 
 给定N个人的出生年份和死亡年份，第i个人的出生年份为birth[i]，死亡年份为death[i]，实现一个方法以计算生存人数最多的年份。

 你可以假设所有人都出生于1900年至2000年（含1900和2000）之间。如果一个人在某一年的任意时期都处于生存状态，那么他们应该被纳入那一年的统计中。例如，生于1908年、死于1909年的人应当被列入1908年和1909年的计数。

 如果有多个年份生存人数相同且均为最大值，输出其中最小的年份。

 示例：

 输入：
 birth = {1900, 1901, 1950}
 death = {1948, 1951, 2000}
 输出： 1901
 提示：

 0 < birth.length == death.length <= 10000
 birth[i] <= death[i]

 
 */

func maxAliveYear(_ birth: [Int], _ death: [Int]) -> Int {
    
    var arr = [Int].init(repeating: 0, count: 101)
    var maxNum = 0
    var maxYear = 0
    for i in 0..<birth.count{
        let bir = birth[i]
        let de = death[i]
        let bIndex = bir - 1900
        let dIndex = de - 1900
        
        for j in bIndex...dIndex{
            arr[j] = arr[j] + 1
        }
    }
    
    for i in 0..<arr.count{
        if arr[i] > maxNum {
            maxNum = arr[i]
            maxYear = i
        }
    }

    return maxYear + 1900

}
