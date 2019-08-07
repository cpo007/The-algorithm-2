//
//  19.8.7.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 2019/8/7.
//  Copyright © 2019年 eggplant. All rights reserved.
//

import Foundation


/*
 538. 把二叉搜索树转换为累加树
 
 给定一个二叉搜索树（Binary Search Tree），把它转换成为累加树（Greater Tree)，使得每个节点的值是原来的节点值加上所有大于它的节点值之和。
 
 
 例如：
 
 输入: 二叉搜索树:
 5
 /   \
 2     13
 
 输出: 转换为累加树:
 18
 /   \
 20     13
 
 */

func convertBST(_ root: TreeNode?) -> TreeNode? {
    
    var parNum = 0
    func setSum(node: TreeNode?) {
        guard let node = node else { return }
        
        setSum(node: node.right)
        node.val = parNum + node.val
        parNum = node.val
        setSum(node: node.left)
    }
    
    setSum(node: root)
    return root
}

/*
 814. 二叉树剪枝
 
 给定二叉树根结点 root ，此外树的每个结点的值要么是 0，要么是 1。
 
 返回移除了所有不包含 1 的子树的原二叉树。
 
 ( 节点 X 的子树为 X 本身，以及所有 X 的后代。)
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-pruning
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


func pruneTree(_ root: TreeNode?) -> TreeNode? {
    
    func deleteZero(node: TreeNode?) -> Bool? {
        guard let node = node else { return nil }
        
        var isNotZero = node.val != 0
        
        if let isLeftNotZero = deleteZero(node: node.left) {
            if isLeftNotZero {
                isNotZero = isNotZero || isLeftNotZero
            } else {
                node.left = nil
            }
        }
        if let isRightNotZero = deleteZero(node: node.right) {
            if isRightNotZero {
                isNotZero = isNotZero || isRightNotZero
            } else {
                node.right = nil
            }
        }
        return isNotZero
    }
    
    if let isNotZero = deleteZero(node: root) {
        return isNotZero ? root : nil
    } else {
        return root
    }
}



