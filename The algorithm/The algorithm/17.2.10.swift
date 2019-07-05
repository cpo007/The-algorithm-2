//
//  17.2.10.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 17/2/10.
//  Copyright © 2017年 eggplant. All rights reserved.
//

import Foundation


func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    for i in (0..<nums.count).reversed(){
        if nums[i] == val {
            nums.remove(at: i)
        }
    }
    return nums.count
}


/*
 101. Symmetric Tree
 Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
 
 For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
 
 1
 / \
 2   2
 / \ / \
 3  4 4  3
 But the following [1,2,2,null,3,null,3] is not:
 1
 / \
 2   2
 \   \
 3    3
 */

func getSymmetricTreeArr(root: TreeNode?, arr: inout [[Any]?], num: Int){
    guard let r = root else {
        if arr.count == num {
            arr.append(["a"])
        } else {
            arr[num]?.append("a")
        }
        return }
    
    if arr.count == num {
        let a = [r.val]
        arr.append(a)
    } else {
        arr[num]?.append(r.val)
    }
    let num = num + 1
    if r.left == nil && r.right == nil {
        return
    }
    getSymmetricTreeArr(root: r.left, arr: &arr , num: num)
    getSymmetricTreeArr(root: r.right, arr: &arr , num: num)
}

func isSymmetricHelp(left: TreeNode?, right: TreeNode?) -> Bool {
    if left == nil || right == nil {
        return left == nil && right == nil
    }
    
    if left?.val != right?.val {
        return false
    }
    return isSymmetricHelp(left: left?.left, right: right?.right) && isSymmetricHelp(left: left?.right, right: right?.left)
}

func isSymmetric(_ root: TreeNode?) -> Bool {
    return root == nil || isSymmetricHelp(left: root?.left, right: root?.right)
}
