//
//  19.8.12.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/12.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 3. 无重复字符的最长子串
 
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 
 示例 1:
 
 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:
 
 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:
 
 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
           请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 
 */


func lengthOfLongestSubstring(_ s: String) -> Int {
    var maxCount = 0
    var index = 0
    var hashMap = [String: Int]()
    var left = 0
    while index < s.count {
        if hashMap[s[index]] != nil {
            left = max(left, hashMap[s[index]]! + 1)
        }
        hashMap[s[index]] = index
        maxCount = max(maxCount,index - left + 1);
        index+=1
    }
    return maxCount
}


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


/*
 2. 两数相加
 
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 
 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 
 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 示例：
 
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 
 */

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    func getVals(node: ListNode?,vals: String) -> String {
        guard let node = node else {
            return vals
        }
        return getVals(node: node.next, vals: "\(node.val)" + vals)
    }
    let vals1 = getVals(node: l1, vals: "")
    let vals2 = getVals(node: l2, vals: "")
    let node = ListNode.init(0)
    func getSumNode(node: ListNode,v1: String,v2: String,num: Int){
        if v1.count == 0 && v2.count == 0 {
            if num > 0 {
                let next = ListNode.init(num)
                node.next = next
            }
            return
        }
        var v1 = v1
        var v2 = v2
        let a: Int
        let b: Int
        if v1.count > 0 {
            a = Int(v1[v1.count - 1])!
            v1.removeLast()
        } else {
            a = 0
        }
        if v2.count > 0 {
            b = Int(v2[v2.count - 1])!
            v2.removeLast()
        } else {
            b = 0
        }
        var sum = a + b + num
        var c = 0
        if sum > 10 {
            sum-=10
            c = 1
        }
        let next = ListNode.init(sum)
        node.next = next
        getSumNode(node: next, v1: v1, v2: v2, num: c)
    }
    getSumNode(node: node, v1: vals1, v2: vals2,num: 0)
    return node.next
}
