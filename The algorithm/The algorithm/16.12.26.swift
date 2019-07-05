//
//  16.12.26.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 16/12/26.
//  Copyright © 2016年 eggplant. All rights reserved.
//

import Foundation
/*
 
 Move Zeroes
 
 
 Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 
 For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
 
 Note:
 You must do this in-place without making a copy of the array.
 Minimize the total number of operations.
 
 */

func moveZeroes(_ nums: inout [Int]) {
    
    for i in (0..<nums.count).reversed(){
        let n = nums[i]
        if n == 0 {
            nums.remove(at: i)
            nums.append(0)
        }
    }
    
}


/*
 Ransom Note
 
 Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.
 
 Each letter in the magazine string can only be used once in your ransom note.
 
 Note:
 You may assume that both strings contain only lowercase letters.
 
 canConstruct("a", "b") -> false
 canConstruct("aa", "ab") -> false
 canConstruct("aa", "aab") -> true
 */


func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var dic = [Character:Int]()
    for c in magazine.characters {
        if dic[c] != nil {
            dic[c]!+=1
        } else {
            dic[c] = 1
        }
    }
    
    for c in ransomNote.characters {
        if dic[c] != nil {
            dic[c]!-=1
        } else {
            return false
        }
    }
    for(k,v) in dic {
        if v < 0 {
            return false
        }
    }
    return true
}


/*
 Minimum Moves to Equal Array Elements
 
 Given a non-empty integer array of size n, find the minimum number of moves required to make all array elements equal, where a move is incrementing n - 1 elements by 1.
 
 Example:
 
 Input:
 [1,2,3]
 
 Output:
 3
 
 Explanation:
 Only three moves are needed (remember each move increments two elements):
 
 [1,2,3]  =>  [2,3,3]  =>  [3,4,3]  =>  [4,4,4]
 */

/*
 let's define sum as the sum of all the numbers, before any moves; minNum as the min number int the list; n is the length of the list;
 
 After, say m moves, we get all the numbers as x , and we will get the following equation
 
 sum + m * (n - 1) = x * n
 and actually,
 
 x = minNum + m
 and finally, we will get
 
 sum - minNum * n = m
 So, it is clear and easy now.
 
 */

func minMoves(_ nums: [Int]) -> Int {
    let a = nums.min() ?? 0
    let sum = nums.reduce(0, {$0 + $1})
    return sum - a * nums.count
}


/*
 Sum of Left Leaves
 Find the sum of all left leaves in a given binary tree.
 
 Example:
 
 3
 / \
 9  20
 /  \
 15   7
 
 There are two left leaves in the binary tree, with values 9 and 15 respectively. Return 24.
 
 */

func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    
    if let r = root {
        var num = 0
        if let l = r.left {
            if l.left == nil && l.right == nil {
                num+=l.val
            } else {
                num+=sumOfLeftLeaves(l)
            }
        }
        return num + sumOfLeftLeaves(r.right)
    }
    return 0
}

/*
 Same Tree
 Given two binary trees, write a function to check if they are equal or not.
 
 Two binary trees are considered equal if they are structurally identical and the nodes have the same value.
 
 Subscribe to see which companies asked this question
 */

func getValArray (root: TreeNode?) -> [Int] {
    var valArray = [Int]()
    if let r = root {
        valArray.append(r.val)
        valArray+=getValArray(root: r.left)
        valArray+=getValArray(root: r.right)
    } else {
        valArray.append(0)
    }
    return valArray
}


func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil || q == nil {
        if p == nil && q == nil { return true }
        return false
    }
    print(getValArray(root: p))
    print(getValArray(root: q))
    
    return getValArray(root: p) == getValArray(root: q)
}


/*
 First Unique Character in a String
 
 Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
 
 Examples:
 
 s = "leetcode"
 return 0.
 
 s = "loveleetcode",
 return 2.
 
 */

func firstUniqChar(_ s: String) -> Int {
    
    
    var dic = [Character:(Int,Int)]()
    var num = 0
    for c in s.characters {
        if dic[c] != nil {
            var a = dic[c]!.0
            a+=1
            dic.updateValue((a,num), forKey: c)
        } else {
            dic.updateValue((1,num), forKey: c)
            
        }
        num+=1
    }
    var arr = [Int]()
    for (_,v) in dic {
        if v.0 == 1 { arr.append(v.1)}
    }
    if arr.count == 0 {
        return -1
    } else {
        return arr.min()!
    }
}
