//
//  17.2.21.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 17/2/21.
//  Copyright © 2017年 eggplant. All rights reserved.
//

import Foundation




/*
 110. Balanced Binary Tree
 
 Given a binary tree, determine if it is height-balanced.
 
 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 */


func depth(root: TreeNode?) -> Int {
    guard let r = root else { return 0}
    return max(depth(root: r.left), depth(root: r.right)) + 1
}

func isBalanced(_ root: TreeNode?) -> Bool {
    guard let r = root else { return true }
    let left = depth(root: r.left)
    let right = depth(root: r.right)
    return abs(left - right) <= 1 && isBalanced(r.left) && isBalanced(r.right)
}




/*
 441. Arranging Coins
 
 You have a total of n coins that you want to form in a staircase shape, where every k-th row must have exactly k coins.
 
 Given n, find the total number of full staircase rows that can be formed.
 
 n is a non-negative integer and fits within the range of a 32-bit signed integer.
 
 
 Example 1:
 
 n = 5
 
 The coins can form the following rows:
 ¤
 ¤ ¤
 ¤ ¤
 
 Because the 3rd row is incomplete, we return 2.
 Example 2:
 
 n = 8
 
 The coins can form the following rows:
 ¤
 ¤ ¤
 ¤ ¤ ¤
 ¤ ¤
 
 Because the 4th row is incomplete, we return 3.
 */



func arrangeCoins(_ n: Int) -> Int {
    var n = n
    var num = 1
    while n >= num {
        n-=num
        num+=1
    }
    return num - 1
}
