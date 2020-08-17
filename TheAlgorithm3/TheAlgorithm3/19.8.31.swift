//
//  19.8.31.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/31.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 94. 二叉树的中序遍历
 
 给定一个二叉树，返回它的中序 遍历。
 */

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    
    var arr = [Int]()
    
    func get(node: TreeNode?)  {
        guard let node = node else { return };
        
        get(node: node.left)
        arr.append(node.val)
        get(node: node.right)
    }
    get(node: root)
    return arr
}



/*
 82. 删除排序链表中的重复元素 II
 
 给定一个排序链表，删除所有含有重复数字的节点，只保留原始链表中 没有重复出现 的数字。
 
 示例 1:
 
 输入: 1->2->3->3->4->4->5
 输出: 1->2->5
 示例 2:
 
 输入: 1->1->1->2->3
 输出: 2->3
 
 
 */

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    
    guard var head = head else { return nil }
    
    if head.next != nil && head.val == head.next!.val {
        while head.next != nil && head.val == head.next!.val {
            head = head.next!
        }
        //去掉所有重复的数字，然后进行递归
        return deleteDuplicates(head.next)
    } else {
        head.next = deleteDuplicates(head.next)
    }
    
    return head
}


