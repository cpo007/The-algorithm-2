//
//  main.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/10.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

import Foundation


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
    
//    [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1]
//    let a = Double("100000000000000000000000000001")!
//    print(Int(a))
    print(Double("100000000000000000000000000001")!)
    func getVals(node: ListNode?,vals: String) -> String {
        guard let node = node else {
            return vals
        }
        return getVals(node: node.next, vals: "\(node.val)" + vals)
    }
    let vals1 = getVals(node: l1, vals: "")
    let vals2 = getVals(node: l2, vals: "")
    let minCount = min(vals1.count, vals2.count)
    
    
    print(vals1)
    print(vals2)
    
    var sumString = "\(vals1 + vals2)"
    let node = ListNode.init(Int(sumString.last!.description)!)
    sumString.removeLast()
    func getSumNode(node: ListNode,str: String){
        if str.count == 0 {
            return
        }
        var str = str
        print(str.last?.description)
        let next = ListNode.init(Int(str.last!.description)!)
        str.removeLast()
        node.next = next
        getSumNode(node: next, str: str)
    }
    getSumNode(node: node, str: sumString)
    return node
}

let node1 = ListNode.init(1)
let node2 = ListNode.init(0)
let node3 = ListNode.init(0)
let node4 = ListNode.init(0)
let node5 = ListNode.init(0)
let node6 = ListNode.init(0)
let node11 = ListNode.init(0)
let node12 = ListNode.init(0)
let node13 = ListNode.init(0)
let node14 = ListNode.init(0)
let node15 = ListNode.init(0)
let node16 = ListNode.init(0)
let node17 = ListNode.init(0)
let node18 = ListNode.init(0)
let node19 = ListNode.init(0)

let node7 = ListNode.init(1)

let node8 = ListNode.init(5)
let node9 = ListNode.init(6)
let node10 = ListNode.init(4)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6
node6.next = node11
node11.next = node12
node12.next = node13
node13.next = node14
node14.next = node15
node15.next = node16
node16.next = node17
node17.next = node18
node18.next = node19

node19.next = node7

node8.next = node9
node9.next = node10
