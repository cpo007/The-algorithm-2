//
//  main.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/10.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

import Foundation



/*
 1110. 删点成林
 
 给出二叉树的根节点 root，树上每个节点都有一个不同的值。
 
 如果节点值在 to_delete 中出现，我们就把该节点从树上删去，最后得到一个森林（一些不相交的树构成的集合）。
 
 返回森林中的每棵树。你可以按任意顺序组织答案。
 
   
 
 示例：
 
 
 
 输入：root = [1,2,3,4,5,6,7], to_delete = [3,5]
 输出：[[1,2,null,4],[6],[7]]
 
 
 */


func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
    
    var output = [TreeNode?]()
    var tmpNode = root
    
    
    
    func afterOrder(node: TreeNode?) {
        guard let node = node else { return }
       
        afterOrder(node: node.left)
        afterOrder(node: node.right)
        if to_delete.contains(node.val) {
            output.append(node.left)
            output.append(node.right)
            
        }
    }
    afterOrder(node: root)
    return output
}

let a = TreeNode.init(1)
let b = TreeNode.init(2)
let c = TreeNode.init(3)
let d = TreeNode.init(4)
let e = TreeNode.init(5)
let f = TreeNode.init(6)
let g = TreeNode.init(7)

a.left = b
a.right = c
b.left = d
b.right = e
c.left = f
c.right = g

let nodes = delNodes(a, [3,5])

for node in nodes {
    print(node?.val)
}
