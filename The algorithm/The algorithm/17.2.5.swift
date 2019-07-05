
//
//  17.2.5.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 17/2/5.
//  Copyright © 2017年 eggplant. All rights reserved.
//

import Foundation




/*
 501.Find Mode in Binary Search Tree
 
 
 Given a binary search tree (BST) with duplicates, find all the mode(s) (the most frequently occurred element) in the given BST.
 
 Assume a BST is defined as follows:
 
 The left subtree of a node contains only nodes with keys less than or equal to the node's key.
 The right subtree of a node contains only nodes with keys greater than or equal to the node's key.
 Both the left and right subtrees must also be binary search trees.
 For example:
 Given BST [1,null,2,2],
 1
 \
 2
 /
 2
 return [2].
 
 
 
 */


func getArray( root: TreeNode?, dict: inout [Int:Int]) -> Int {
    guard let r = root else { return 0 }
    dict.updateValue((dict[r.val] ?? 0) + 1, forKey: r.val)
    return max(dict[r.val]!, max(getArray(root: r.left, dict: &dict), getArray(root: r.right, dict: &dict)))
}

func findMode(_ root: TreeNode?) -> [Int] {
    var dict = [Int:Int]()
    let a = getArray(root: root, dict: &dict)
    var arr = [Int]()
    for (k,v) in dict {
        if v == a {
            arr.append(k)
        }
    }
    return arr
}

/*
 
 108. Convert Sorted Array to Binary Search Tree
 
 Given an array where elements are sorted in ascending order, convert it to a height balanced BST.
 
 
 
 */

func getTreeNode( nums: [Int], start: Int, end: Int) -> TreeNode? {
    if end <= start { return nil }
    let mid = (start + end) / 2
    let root = TreeNode(nums[mid])
    root.left = getTreeNode(nums: nums, start: start, end: mid - 1)
    root.right = getTreeNode(nums: nums, start: mid + 1, end: end)
    return root
}

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    return getTreeNode(nums: nums, start: 0, end: nums.count - 1)
}
