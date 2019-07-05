//
//  17.2.8.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 17/2/8.
//  Copyright © 2017年 eggplant. All rights reserved.
//

import Foundation


/*
 437. Path Sum III
 
 You are given a binary tree in which each node contains an integer value.
 
 Find the number of paths that sum to a given value.
 
 The path does not need to start or end at the root or a leaf, but it must go downwards (traveling only from parent nodes to child nodes).
 
 The tree has no more than 1,000 nodes and the values are in the range -1,000,000 to 1,000,000.
 
 
 Example:
 
 root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8
 
 1
 /   \
 -2      -3
 / \       \
 1   3      -2
 / \   \
 3
 
 Return 3. The paths that sum to 8 are:
 
 1.  5 -> 3
 2.  5 -> 2 -> 1
 3. -3 -> 11
 */


func getNum(root: TreeNode?, sum: Int) -> Int {
    guard let r = root else { return 0 }
    return (sum == r.val) ? 1:0 + getNum(root: r.left, sum: sum - r.val) + getNum(root: r.right, sum: sum - r.val)
}

func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
    guard let r = root else { return 0 }
    return getNum(root: r, sum: sum) + pathSum(r.left, sum) + pathSum(r.right, sum)
}


/*
 263. Ugly Number
 
 Write a program to check whether a given number is an ugly number.
 
 Ugly numbers are positive numbers whose prime factors only include 2, 3, 5. For example, 6, 8 are ugly while 14 is not ugly since it includes another prime factor 7.
 
 Note that 1 is typically treated as an ugly number.
 
 */


func isUgly(_ num: Int) -> Bool {
    var num = num
    for i in 2..<6  {
        while num%i == 0 && num > 0 {
            num/=i
        }
    }
    return num == 1
}
