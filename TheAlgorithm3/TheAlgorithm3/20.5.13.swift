//
//  20.5.13.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2020/5/20.
//  Copyright © 2020 cpo007@qq.com. All rights reserved.
//

import Foundation


/**
 102. 二叉树的层序遍历
 
 给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。

  

 示例：
 二叉树：[3,9,20,null,null,15,7],

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
 
 */

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    if root == nil {
        return []
    }
    var arr = [[Int]]()
    func setValue(node: TreeNode?, deep: Int) {
        guard let node = node else {
            return
        }
        if deep <= arr.count {
            arr[deep - 1] = arr[deep - 1] + [node.val]
        } else {
            let tmpArr = [node.val]
            arr.append(tmpArr)
        }
        setValue(node: node.left, deep: deep + 1)
        setValue(node: node.right, deep: deep + 1)
    }
    
    setValue(node: root, deep: 1)
    return arr
}
