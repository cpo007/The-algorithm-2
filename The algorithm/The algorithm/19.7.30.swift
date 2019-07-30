//
//  19.7.30.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 2019/7/30.
//  Copyright © 2019年 eggplant. All rights reserved.
//

import Foundation


/*
 203. 移除链表元素
 
 
 删除链表中等于给定值 val 的所有节点。
 
 示例:
 
 输入: 1->2->6->3->4->5->6, val = 6
 输出: 1->2->3->4->5
 */

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    
    
    let node: ListNode? = ListNode.init(Int.min)
    node?.next = head
    var pointer = node
    while pointer != nil {
        while pointer?.next?.val == val {
            pointer?.next = pointer?.next?.next
        }
        pointer = pointer?.next
    }
    
    return node?.next
}



/*
 19. 删除链表的倒数第N个节点
 
 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。
 
 示例：
 
 给定一个链表: 1->2->3->4->5, 和 n = 2.
 
 当删除了倒数第二个节点后，链表变为 1->2->3->5.
 说明：
 
 给定的 n 保证是有效的。
 
 进阶：
 
 你能尝试使用一趟扫描实现吗？
 
 */

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    
    
    func getDeep(node:ListNode, deep: Int) -> Int {
        guard let next = node.next else { return deep }
        return getDeep(node: next, deep: deep + 1)
    }
    
    func removeNode(node: ListNode?,deep: Int, needRemoveDeep: Int){
        
        if deep == (needRemoveDeep - 1) {
            let tmp = node?.next?.next
            node?.next = tmp
            return
        } else {
            removeNode(node: node?.next, deep: deep + 1, needRemoveDeep: needRemoveDeep)
        }
        
    }
    let needRemoveDeep = getDeep(node: head!, deep: 1) + 1 - n
    if needRemoveDeep == 1 { return head?.next }
    removeNode(node: head, deep: 1, needRemoveDeep: needRemoveDeep)
    return head
}


func removeNthFromEnd2(_ head: ListNode?, _ n: Int) -> ListNode? {
    
    let zeroNode = ListNode.init(0)
    zeroNode.next = head
    
    var fastPointer: ListNode? = zeroNode
    var slowPointer: ListNode? = zeroNode
    
    for _ in 1...(n + 1){
        fastPointer = fastPointer?.next
    }
    
    while fastPointer != nil {
        fastPointer = fastPointer?.next
        slowPointer = slowPointer?.next
    }
    let tmp = slowPointer?.next?.next
    slowPointer?.next = tmp
    return zeroNode.next
}

/*
 807. 保持城市天际线
 
 在二维数组grid中，grid[i][j]代表位于某处的建筑物的高度。 我们被允许增加任何数量（不同建筑物的数量可能不同）的建筑物的高度。 高度 0 也被认为是建筑物。
 
 最后，从新数组的所有四个方向（即顶部，底部，左侧和右侧）观看的“天际线”必须与原始数组的天际线相同。 城市的天际线是从远处观看时，由所有建筑物形成的矩形的外部轮廓。 请看下面的例子。
 
 建筑物高度可以增加的最大总和是多少？
 
 
 例子：
 输入： grid = [[3,0,8,4],[2,4,5,7],[9,2,6,3],[0,3,1,0]]
 输出： 35
 解释：
 The grid is:
 [ [3, 0, 8, 4],
 [2, 4, 5, 7],
 [9, 2, 6, 3],
 [0, 3, 1, 0] ]
 
 从数组竖直方向（即顶部，底部）看“天际线”是：[9, 4, 8, 7]
 从水平水平方向（即左侧，右侧）看“天际线”是：[8, 7, 9, 3]
 
 在不影响天际线的情况下对建筑物进行增高后，新数组如下：
 
 gridNew = [ [8, 4, 8, 7],
 [7, 4, 7, 7],
 [9, 4, 8, 7],
 [3, 3, 3, 3] ]
 说明:
 
 1 < grid.length = grid[0].length <= 50。
   grid[i][j] 的高度范围是： [0, 100]。
 一座建筑物占据一个grid[i][j]：换言之，它们是 1 x 1 x grid[i][j] 的长方体。
 
 */

func maxIncreaseKeepingSkyline(_ grid: [[Int]]) -> Int {
    
    var longitudinalArr = Array<Int>.init(repeating: 0, count: grid.first?.count ?? 0)
    var transverseArr = Array<Int>.init(repeating: 0, count: grid.count)
    
    for (i,tmparr) in grid.enumerated() {
        var maxNum = 0
        for (j,tmp) in tmparr.enumerated() {
            longitudinalArr[j] = max(longitudinalArr[j], tmp)
            
            maxNum = max(maxNum, tmp)
        }
        transverseArr[i] = max(transverseArr[i], maxNum)
    }
    
    var output = 0
    for (i,tmparr) in grid.enumerated() {
        for (j,tmp) in tmparr.enumerated() {
            let minNum = min(longitudinalArr[j], transverseArr[i])
            output+=(minNum - tmp)
        }
    }
    
    return output
}

