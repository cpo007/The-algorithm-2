//
//  19.8.19.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/19.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 23. 合并K个排序链表
 
 合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。
 
 示例:
 
 输入:
 [
     1->4->5,
     1->3->4,
     2->6
 ]
 输出: 1->1->2->3->4->4->5->6
 
 */

func mergeKLists2(_ lists: [ListNode?]) -> ListNode? {
    
    func mergeTwoList(list1: ListNode?, list2: ListNode?) -> ListNode? {
        guard let list1 = list1 else { return list2 }
        guard let list2 = list2 else { return list1 }
        
        if list1.val < list2.val {
            list1.next = mergeTwoList(list1: list1.next, list2: list2)
            return list1
        } else {
            list2.next = mergeTwoList(list1: list1, list2: list2.next)
            return list2
        }
    }
    
    
    func merge(lists: [ListNode?], left: Int, right: Int) -> ListNode? {
        if left == right { return lists[left] }
        let mid = left + (right - left) / 2
        let l1 = merge(lists: lists, left: left, right: mid)
        let l2 = merge(lists: lists, left: mid + 1, right: right)
        return mergeTwoList(list1: l1, list2: l2)
    }
    
    return merge(lists: lists, left: 0, right: lists.count - 1)
}

//let node1 = ListNode.init(1)
//let node2 = ListNode.init(4)
//let node3 = ListNode.init(5)
//let node4 = ListNode.init(1)
//let node5 = ListNode.init(3)
//let node6 = ListNode.init(4)
//let node7 = ListNode.init(2)
//let node8 = ListNode.init(6)
//
//node1.next = node2
//node2.next = node3
//node4.next = node5
//node5.next = node6
//node7.next = node8
//
//var node = mergeKLists2([node1,node4,node7])
//
//while node != nil {
//    print(node?.val)
//    node = node?.next
//}


func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    
    var valArr = [Int]()
    
    for node in lists {
        
        var tmpArr = [Int]()
        func getArr(node: ListNode?) {
            guard let node = node else { return }
            tmpArr.append(node.val)
            getArr(node: node.next)
        }
        getArr(node: node)
        valArr = valArr + tmpArr
    }
    
    let arr = valArr.sorted()
    
    var node = ListNode.init(0)
    
    func setNode(node: ListNode,arr: [Int]){
        if arr.count == 0 {
            return
        }
        let next = ListNode.init(arr.first!)
        var arr = arr
        arr.removeFirst()
        node.next = next
        setNode(node: next, arr: arr)
    }
    setNode(node: node, arr: arr)
    
    return node.next
}


/*
 22. 括号生成
 给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。
 
 例如，给出 n = 3，生成结果为：
 
 [
 "((()))",
 "(()())",
 "(())()",
 "()(())",
 "()()()"
 ]
 
 (()) ()()
 (()())
 (())()  ((()))
 (())()  ()(())
 ()()()
 */

func generateParenthesis(_ n: Int) -> [String] {
    
    var arr = [String]()
    func backtrack(cur: String, open: Int, close: Int, max: Int) {
        if cur.count == max * 2 {
            arr.append(cur)
            return
        }
        
        if open < max {
            backtrack(cur: cur + "(", open: open + 1, close: close, max: max)
        }
        if close < open {
            backtrack(cur: cur + ")", open: open , close: close + 1, max: max)
        }
        
    }
    
    backtrack(cur: "", open: 0, close: 0, max: n)
    return arr
}

print(generateParenthesis(2))
