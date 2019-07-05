//
//  19.7.5.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 2019/7/5.
//  Copyright © 2019年 eggplant. All rights reserved.
//

import Foundation


/*
 938. 二叉搜索树的范围和
 
 给定二叉搜索树的根结点 root，返回 L 和 R（含）之间的所有结点的值的和。
 
 二叉搜索树保证具有唯一的值。
 
 示例 1：
 
 输入：root = [10,5,15,3,7,null,18], L = 7, R = 15
 输出：32
 示例 2：
 
 输入：root = [10,5,15,3,7,13,18,1,null,6], L = 6, R = 10
 输出：23
 
 */


func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
    
    if root == nil { return 0 }
    
    if root!.val < L {
        return rangeSumBST(root?.right, L, R)
    }
    if root!.val > R {
        return rangeSumBST(root?.left, L, R)
    }
    
    return root!.val + rangeSumBST(root!.left, L, R) + rangeSumBST(root!.right, L, R)
}


/*
 1021. 删除最外层的括号
 
 有效括号字符串为空 ("")、"(" + A + ")" 或 A + B，其中 A 和 B 都是有效的括号字符串，+ 代表字符串的连接。例如，""，"()"，"(())()" 和 "(()(()))" 都是有效的括号字符串。
 
 如果有效字符串 S 非空，且不存在将其拆分为 S = A+B 的方法，我们称其为原语（primitive），其中 A 和 B 都是非空有效括号字符串。
 
 给出一个非空有效字符串 S，考虑将其进行原语化分解，使得：S = P_1 + P_2 + ... + P_k，其中 P_i 是有效括号字符串原语。
 
 对 S 进行原语化分解，删除分解中每个原语字符串的最外层括号，返回 S 。
 
 
 */


func removeOuterParentheses(_ S: String) -> String {
    
    var str = S
    var num = 0
    var endIndex = str.count - 1
    for i in (0..<str.count).reversed(){
        S[i] == ")" ? (num+=1) : (num-=1)
        if num == 0 {
            str.remove(at: String.Index.init(encodedOffset: endIndex))
            str.remove(at: String.Index.init(encodedOffset: i))
            endIndex = i - 1
        }
    }
    return str
    
}

func removeOuterParentheses2(_ S: String) -> String {
    
    var num = 0
    var startIndex = 0
    var output = ""
    
    for i in 0..<S.count{
        S[i] == ")" ? (num+=1) : (num-=1)
        if num == 0 {
            output.append(S[(startIndex + 1)..<(i)])
            startIndex = i + 1
        }
    }
    return output
}


/*
 219. Contains Duplicate II
 
 Given an array of integers and an integer k, find out whether there are two distinct indices i and j in the array such that nums[i] = nums[j] and the absolute difference between i and j is at most k.
 
 Example 1:
 
 Input: nums = [1,2,3,1], k = 3
 Output: true
 Example 2:
 
 Input: nums = [1,0,1,1], k = 1
 Output: true
 Example 3:
 
 Input: nums = [1,2,3,1,2,3], k = 2
 Output: false
 
 */

func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    var map = [Int: [Int]]()
    
    for i in 0..<nums.count{
        var arr = map[nums[i]] ?? [Int]()
        arr.append(i)
        map.updateValue(arr, forKey: nums[i])
    }
    
    for (_,v) in map{
        var smallValue = Int.max
        for i in 0..<v.count - 1{
            let value = abs((v[i] - v[i + 1]))
            smallValue = value < smallValue ? value : smallValue
        }
        if smallValue <= k { return true}
    }
    
    return false
}

/*
 830. Positions of Large Groups
 
 In a string S of lowercase letters, these letters form consecutive groups of the same character.
 
 For example, a string like S = "abbxxxxzyy" has the groups "a", "bb", "xxxx", "z" and "yy".
 
 Call a group large if it has 3 or more characters.  We would like the starting and ending positions of every large group.
 
 The final answer should be in lexicographic order.
 
 
 Example 1:
 
 Input: "abbxxxxzzy"
 Output: [[3,6]]
 Explanation: "xxxx" is the single large group with starting  3 and ending positions 6.
 Example 2:
 
 Input: "abc"
 Output: []
 Explanation: We have "a","b" and "c" but no large group.
 Example 3:
 
 Input: "abcdddeeeeaabbbcd"
 Output: [[3,5],[6,9],[12,14]]
 
 
 Note:  1 <= S.length <= 1000
 */


func largeGroupPositions(_ S: String) -> [[Int]] {
    if S.count == 0 { return [] }
    var arr = [[Int]]()
    var count = 1
    var lastChar = ""
    
    for i in 0..<S.count{
        if lastChar == S[i].description {
            count+=1
        } else {
            lastChar = S[i].description
            count = 1
            continue
        }
        if count >= 3 && (i == S.count - 1 || S[i] != S[i + 1] ){
            print(i)
            print(count)
            arr.append([i + 1 - count,i])
        }
    }
    return arr
}



/*
 704. Binary Search
 
 Share
 Given a sorted (in ascending order) integer array nums of n elements and a target value, write a function to search target in nums. If target exists, then return its index, otherwise return -1.
 
 Example 1:
 
 Input: nums = [-1,0,3,5,9,12], target = 9
 Output: 4
 Explanation: 9 exists in nums and its index is 4
 
 Example 2:
 
 Input: nums = [-1,0,3,5,9,12], target = 2
 Output: -1
 Explanation: 2 does not exist in nums so return -1
 
 
 Note:
 
 You may assume that all elements in nums are unique.
 n will be in the range [1, 10000].
 The value of each element in nums will be in the range [-9999, 9999].
 */


func search(_ nums: [Int], _ target: Int) -> Int {
    for i in 0..<nums.count{
        if nums[i] == target {
            return i
        }
    }
    return -1
}

