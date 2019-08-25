//
//  19.8.22.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/22.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation

/*
 29. 两数相除
 
 给定两个整数，被除数 dividend 和除数 divisor。将两数相除，要求不使用乘法、除法和 mod 运算符。
 
 返回被除数 dividend 除以除数 divisor 得到的商。
 
 示例 1:
 
 输入: dividend = 10, divisor = 3
 输出: 3
 示例 2:
 
 输入: dividend = 7, divisor = -3
 输出: -2
 
 
 */

func divide(_ dividend: Int, _ divisor: Int) -> Int {
    var n1 = abs(dividend)
    let n2 = abs(divisor)
    var index = 0
    while n2 <= n1 {
        var count = abs(divisor)
        var i = 1
        while n1 >= count {
            n1-=count
            index+=i
            i <<= 1
            count <<= 1
        }
    }
    index = (dividend < 0 && divisor < 0) || (dividend > 0 && divisor > 0) ? index : -index
    if index > Int(pow(2.0, 31) - 1)  { return Int(pow(2.0, 31)) }
    if index < Int(-pow(2.0, 31)) { return Int(-pow(2.0, 31)) }
    return index
}


/*
 25. K 个一组翻转链表
 
 给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。
 
 k 是一个正整数，它的值小于或等于链表的长度。
 
 如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。
 
 示例 :
 
 给定这个链表：1->2->3->4->5
 
 当 k = 2 时，应当返回: 2->1->4->3->5
 
 当 k = 3 时，应当返回: 3->2->1->4->5
 
 说明 :
 
 你的算法只能使用常数的额外空间。
 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
 
 */

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    
    
    func reverse(node: ListNode? ) -> ListNode? {
        var pre: ListNode?
        var cur = node
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
    
    let zeroNode = ListNode.init(0)
    zeroNode.next = head
    var pre: ListNode? = zeroNode
    var end: ListNode? = zeroNode
    
    while end?.next != nil {
        
        var i = 0
        while i < k && end != nil {
            end = end?.next
            i+=1
        }
        if end == nil { break }
        let start = pre?.next
        let next = end?.next
        end?.next = nil
        
        pre?.next = reverse(node: start)
        start?.next = next
        pre = start
        end = pre
    }
    
    return zeroNode.next
}
