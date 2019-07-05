//
//  17.2.9.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 17/2/9.
//  Copyright © 2017年 eggplant. All rights reserved.
//

import Foundation



/*
 107. Binary Tree Level Order Traversal II
 
 Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
 3
 / \
 9  20
 /  \
 15   7
 return its bottom-up level order traversal as:
 [
 [15,7],
 [9,20],
 [3]
 ]
 
 */


func getArr(_ root: TreeNode?, num: Int, dict: inout [Int:[Int]]) -> Int {
    guard let r = root else { return num}
    var arr = (dict[num] ?? [Int]())
    arr.append(r.val)
    dict.updateValue(arr , forKey: num)
    let num = num + 1
    return max(getArr(r.left, num: num, dict: &dict), getArr(r.right, num: num, dict: &dict))
}

func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
    guard let r = root else { return [[Int]]() }
    var dict = [Int:[Int]]()
    let num = getArr(r, num: 0, dict: &dict)
    var arr = [[Int]]()
    for i in (0..<num).reversed(){
        arr.append(dict[i] ?? [Int]())
    }
    return arr
}

/*
 21. Merge Two Sorted Lists
 
 
 Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
 
 
 */


func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard let list1 = l1 else { return l2 }
    guard let list2 = l2 else { return l1 }
    if list1.val < list2.val {
        list1.next = mergeTwoLists(list1.next, list2)
        return list1
    } else {
        list2.next = mergeTwoLists(list1, list2.next)
        return list2
    }
}

/*
 198. House Robber
 
 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.
 
 Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.
 
 */


func rob(_ nums: [Int]) -> Int {
    var dp = [Int]()
    for i in 0..<nums.count {
        switch i {
        case 0 :
            dp.append(nums[0])
            break
        case 1 :
            dp.append(max(nums[0], nums[1]))
            break
        default :
            dp.append(max(nums[i] + dp[i - 2], dp[i - 1]))
            break
        }
    }
    return dp.last ?? 0
}


/*
 342. Power of Four
 
 Given an integer (signed 32 bits), write a function to check whether it is a power of 4.
 
 Example:
 Given num = 16, return true. Given num = 5, return false.
 
 
 
 */


func isPowerOfFour(_ num: Int) -> Bool {
    return num > 0 && (num & (num - 1)) == 0 && (num - 1) % 3 == 0;
}


/*
 367. Valid Perfect Square
 
 Given a positive integer num, write a function which returns True if num is a perfect square else False.
 
 Note: Do not use any built-in library function such as sqrt.
 */

func isPerfectSquare(_ num: Int) -> Bool {
    var num = num
    var i = 1
    while num > 0 {
        num = num - i
        i+=2
    }
    return num == 0
}
