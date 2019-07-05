//
//  17.2.21(2).swift
//  The algorithm
//
//  Created by cpo007@qq.com on 17/2/21.
//  Copyright © 2017年 eggplant. All rights reserved.
//

import Foundation



/*
 257. Binary Tree Paths
 
 
 Given a binary tree, return all root-to-leaf paths.
 
 For example, given the following binary tree:
 
 1
 /   \
 2     3
 \
 5
 All root-to-leaf paths are:
 
 ["1->2->5", "1->3"]
 
 */

func getPathsArray( root: TreeNode, path: String, arr: inout [String]) {
    
    if root.left == nil && root.right == nil {
        arr.append("\(path)\(root.val)")
    }
    if let left = root.left {
        getPathsArray(root: left, path: "\(path)\(root.val)->", arr: &arr)
    }
    
    if let right = root.right {
        getPathsArray(root: right, path: "\(path)\(root.val)->", arr: &arr)
    }
    
}

func binaryTreePaths(_ root: TreeNode?) -> [String] {
    var arr = [String]()
    if let r = root {
        getPathsArray(root: r, path: "", arr: &arr)
    }
    return arr
}


/*
 119. Pascal's Triangle II
 
 Given an index k, return the kth row of the Pascal's triangle.
 
 For example, given k = 3,
 Return [1,3,3,1].
 
 */


func getRow(_ rowIndex: Int) -> [Int] {
    var n = 0
    var arr = [[Int]]()
    if rowIndex >= n {
        arr.append([1])
    }
    while n != rowIndex {
        n+=1
        var array = [Int]()
        for i in 0...n {
            if i - 1 < 0 {
                let a = 0 + arr[n - 1][i]
                array.append(a)
            } else if i == arr[n - 1].count {
                let a = 0 + arr[n - 1][i - 1]
                array.append(a)
            } else {
                let a = arr[n - 1][i] + arr[n - 1][i - 1]
                array.append(a)
            }
        }
        arr.append(array)
    }
    print(arr)
    return arr.last ?? [Int]()
}


/*
 26. Remove Duplicates from Sorted Array
 
 
 Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.
 
 Do not allocate extra space for another array, you must do this in place with constant memory.
 
 For example,
 Given input array nums = [1,1,2],
 
 Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively. It doesn't matter what you leave beyond the new length.
 */


/*
 func removeDuplicates(_ nums: inout [Int]) -> Int {
 var a = 0 , b = nums.count - 1
 while a <= nums.count - 1 {
 while a < b {
 if nums[a] == nums[b]{
 nums.remove(at: b)
 }
 b-=1
 }
 a+=1
 b = nums.count - 1
 }
 return nums.count
 }
 */
func removeDuplicates(_ nums: inout [Int]) -> Int {
    var count = 0
    for i in 1..<nums.count{
        if nums[i] == nums[i - 1] {
            count+=1
        } else {
            nums[i - count] = nums[i]
        }
    }
    return nums.count - count
}
