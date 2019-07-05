//
//  16.12.23.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 16/12/24.
//  Copyright © 2016年 eggplant. All rights reserved.
//

import Foundation



/*
 Maximum Depth of Binary Tree
 
 Given a binary tree, find its maximum depth.
 
 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
 
 Subscribe to see which companies asked this question
 
 */

//寻找二叉树的节点最大深度，即从根节点到最深节点的距离
//猜测可用递归实现

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func maxDepth(_ root: TreeNode?) -> Int {
    if let r = root {
        return 1 + max(maxDepth(r.left), maxDepth(r.right))
    } else {
        return 0
    }
}
