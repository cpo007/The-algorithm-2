//
//  19.8.20.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/20.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 28. 实现 strStr()
 
 实现 strStr() 函数。
 
 给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。如果不存在，则返回  -1。
 
 示例 1:
 
 输入: haystack = "hello", needle = "ll"
 输出: 2
 示例 2:
 
 输入: haystack = "aaaaa", needle = "bba"
 输出: -1
 说明:
 
 当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。
 
 对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与C语言的 strstr() 以及 Java的 indexOf() 定义相符。
 
 */

func strStr(_ haystack: String, _ needle: String) -> Int {
    if haystack == needle { return 0 }
    var i = 0
    while i < haystack.count {
        if let a =  Range.init(NSRange.init(location: i, length: needle.count), in: haystack) {
            if haystack[a] == needle {
                return i
            }
        }
        i+=1
        
    }
    return -1;
}

/*
 
 24. 两两交换链表中的节点
 
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
 
 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
 
 
 */

func swapPairs(_ head: ListNode?) -> ListNode? {
    //    guard var node = head else { return nil }
    var node = head
    var nodeArray = [ListNode]()
    
    while node != nil {
        let tmp = node!.next?.next
        node!.next?.next = nil
        nodeArray.append(node!)
        node = tmp
    }
    
    for i in 0..<nodeArray.count{
        
        if nodeArray[i].next != nil {
            let tmp1 = nodeArray[i]
            let tmp = tmp1.next
            tmp1.next = nil
            tmp?.next = tmp1
            nodeArray[i] = tmp!
        }
    }
    
    let zeroNode = ListNode.init(0);
    var tmp = zeroNode
    
    for node in nodeArray{
        tmp.next = node
        if node.next != nil {
            tmp = node.next!
        } else {
            tmp = node
        }
    }
    
    return zeroNode.next
}
