//
//  19.8.2.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 2019/8/2.
//  Copyright © 2019年 eggplant. All rights reserved.
//

import Foundation



/*
 950. 按递增顺序显示卡牌
 
 牌组中的每张卡牌都对应有一个唯一的整数。你可以按你想要的顺序对这套卡片进行排序。
 
 最初，这些卡牌在牌组里是正面朝下的（即，未显示状态）。
 
 现在，重复执行以下步骤，直到显示所有卡牌为止：
 
 从牌组顶部抽一张牌，显示它，然后将其从牌组中移出。
 如果牌组中仍有牌，则将下一张处于牌组顶部的牌放在牌组的底部。
 如果仍有未显示的牌，那么返回步骤 1。否则，停止行动。
 返回能以递增顺序显示卡牌的牌组顺序。
 
 答案中的第一张牌被认为处于牌堆顶部。
 
   
 
 示例：
 
 输入：[17,13,11,2,3,5,7]
 输出：[2,13,3,11,5,17,7]
 解释：
 我们得到的牌组顺序为 [17,13,11,2,3,5,7]（这个顺序不重要），然后将其重新排序。
 重新排序后，牌组以 [2,13,3,11,5,17,7] 开始，其中 2 位于牌组的顶部。
 我们显示 2，然后将 13 移到底部。牌组现在是 [3,11,5,17,7,13]。
 我们显示 3，并将 11 移到底部。牌组现在是 [5,17,7,13,11]。
 我们显示 5，然后将 17 移到底部。牌组现在是 [7,13,11,17]。
 我们显示 7，并将 13 移到底部。牌组现在是 [11,17,13]。
 我们显示 11，然后将 17 移到底部。牌组现在是 [13,17]。
 我们展示 13，然后将 17 移到底部。牌组现在是 [17]。
 我们显示 17。
 由于所有卡片都是按递增顺序排列显示的，所以答案是正确的。
   
 
 提示：
 
 1 <= A.length <= 1000
 1 <= A[i] <= 10^6
 对于所有的 i != j，A[i] != A[j]
 
 
 */


func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
    
    var deck = deck
    deck.sort { (e1, e2) -> Bool in
        e1 > e2
    }
    
    var output =  [Int]()
    
    for (i,num) in deck.enumerated(){
        output.append(num)
        if i != deck.count - 1 {
            let tmp = output[0]
            output.removeFirst()
            output.append(tmp)
        }
    }
    
    return output.reversed()
}

//[[17,13,11,2,3,5,7]]

//[2,11,3,13,5,17,7]
//[2,3,5,7,11,13,17]
/*
 941. 有效的山脉数组
 
 给定一个整数数组 A，如果它是有效的山脉数组就返回 true，否则返回 false。
 
 让我们回顾一下，如果 A 满足下述条件，那么它是一个山脉数组：
 
 A.length >= 3
 在 0 < i < A.length - 1 条件下，存在 i 使得：
 A[0] < A[1] < ... A[i-1] < A[i]
 A[i] > A[i+1] > ... > A[B.length - 1]
   
 
 示例 1：
 
 输入：[2,1]
 输出：false
 示例 2：
 
 输入：[3,5,5]
 输出：false
 示例 3：
 
 输入：[0,3,2,1]
 输出：true
   
 
 提示：
 
 0 <= A.length <= 10000
 0 <= A[i] <= 10000
 
 
 */

func validMountainArray(_ A: [Int]) -> Bool {
    if A.count < 3 { return false }
    
    var getI = false
    
    for i in 0..<(A.count - 1){
        
        let a = A[i]
        let b = A[i + 1]
        
        if b < a {
            if i == 0 {
                return false
            }
            getI = true
        } else {
            if getI {
                getI = false
                break
            }
        }
    }
    
    return getI
}


/*
 92. 反转链表 II
 
 反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。
 
 说明:
 1 ≤ m ≤ n ≤ 链表长度。
 
 示例:
 
 输入: 1->2->3->4->5->NULL, m = 2, n = 4
 输出: 1->4->3->2->5->NULL
 
 */

func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
    
    var m = m + 1
    var n = n + 1
    func reverse(node: ListNode?,tmpNode: ListNode?,deep: Int){
        
        let tmpN: ListNode?
        if deep == m {
            tmpN = node?.next
            node?.next = node?.next?.next
            tmpN?.next = nil
            reverse(node: node, tmpNode: tmpN, deep: deep + 1)
        } else if deep > m && deep <= n {
            tmpN = node?.next
            node?.next = node?.next?.next
            tmpN?.next = tmpNode
            reverse(node: node, tmpNode: tmpN, deep: deep + 1)
        } else if deep > n {
            var tmp = tmpNode
            if tmp != nil {
                while tmp?.next != nil {
                    tmp = tmp?.next
                }
                let last = node?.next
                node?.next = tmpNode
                tmp?.next = last
            }
        } else if deep < m {
            if deep + 1 < m {
                reverse(node: node?.next, tmpNode: nil, deep: deep + 1)
            } else {
                reverse(node: node, tmpNode: nil, deep: deep + 1)
            }
        }
    }
    
    let node = ListNode.init(Int.min)
    node.next = head
    reverse(node: node, tmpNode: nil, deep: 1)
    return node.next
}


