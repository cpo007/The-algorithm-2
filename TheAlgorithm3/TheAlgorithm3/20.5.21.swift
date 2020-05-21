//
//  20.5.21.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2020/5/21.
//  Copyright © 2020 cpo007@qq.com. All rights reserved.
//

import Foundation



/**
 
 98. 验证二叉搜索树
 
 给定一个二叉树，判断其是否是一个有效的二叉搜索树。

 假设一个二叉搜索树具有如下特征：

 节点的左子树只包含小于当前节点的数。
 节点的右子树只包含大于当前节点的数。
 所有左子树和右子树自身必须也是二叉搜索树。
 示例 1:

 输入:
     2
    / \
   1   3
 输出: true
 示例 2:

 输入:
     5
    / \
   1   4
      / \
     3   6
 输出: false
 解释: 输入为: [5,1,4,null,null,3,6]。
      根节点的值为 5 ，但是其右子节点值为 4 。
 
 */

func isValidBST(_ root: TreeNode?) -> Bool {
    
    var checkClear = true
    
    func check(node: TreeNode?, left: Int, right: Int ) {
        guard let node = node else { return }
        
        if let nl = node.left  {
            if node.val > nl.val && nl.val <= right && nl.val >= left  {
                
            } else {
                checkClear = false
                return
            }
        }
        if let nr = node.right {
            if node.val < nr.val && nr.val <= right && nr.val >= left {
                
            } else {
                checkClear = false
                return
            }
        }
        check(node: node.left,left: left, right: node.val - 1)
        check(node: node.right,left: node.val + 1, right: right)
    }
    check(node: root, left: Int.min, right: Int.max)
    return checkClear
}

/**
 面试题32 - II. 从上到下打印二叉树 II
 
 
 从上到下按层打印二叉树，同一层的节点按从左到右的顺序打印，每一层打印到一行。

  

 例如:
 给定二叉树: [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回其层次遍历结果：

 [
   [3],
   [9,20],
   [15,7]
 ]
  

 提示：

 节点总数 <= 1000
 注意：本题与主站 102 题相同：https://leetcode-cn.com/problems/binary-tree-level-order-traversal/
 
 */


func levelOrder2(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [[]] }
    
    var map = [Int: [Int]]()
    
    func setTreeMap(node: TreeNode?, deep: Int) {
        guard let node = node else { return }
        map[deep] = map[deep] != nil ? map[deep]! + [node.val] : [node.val]
        setTreeMap(node: node.left, deep: deep + 1)
        setTreeMap(node: node.right, deep: deep + 1)
    }
    setTreeMap(node: root, deep: 1)

    var output = [[Int]]()
    for i in 1...map.count{
        output.append(map[i]!)
    }
    return output
}

/**
 5. 最长回文子串
 
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。

 示例 1：

 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。
 示例 2：

 输入: "cbbd"
 输出: "bb"

 
 */

func longestPalindrome(_ s: String) -> String {
    
    var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: s.count), count: s.count)
    var ans = "";
    for l in 0..<s.count{
        for i in 0..<s.count where i + l < s.count{
            let j = i + l
            if l == 0 {
                dp[i][j] = 1
            } else if l == 1 {
                dp[i][j] = NSNumber.init(value: s[i] == s[j]).intValue
            } else {
                dp[i][j] = NSNumber.init(value: s[i] == s[j] && dp[i + 1][j - 1] == 1).intValue
            }
            
            if (dp[i][j] == 1 && l + 1 > ans.count) {
                ans = s[i, l + 1];
            }
        }
        
    }
    return ans
}
