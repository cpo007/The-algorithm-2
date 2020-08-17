//
//  main.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/10.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

import Foundation

func isBalanced(_ root: TreeNode?) -> Bool {
    return height(node: root) >= 1
}

public func height(node: TreeNode?) -> Int {
    guard let node = node else {
        return 0
    }
    let leftHeight = height(node: node.left)
    let rightHeight = height(node: node.right)
    if leftHeight == -1 || rightHeight == -1 || abs(leftHeight - rightHeight) > 1 {
        return -1
    } else {
        return max(leftHeight, rightHeight) + 1
    }
}
