//
//  20.4.28.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2020/4/28.
//  Copyright © 2020 cpo007@qq.com. All rights reserved.
//

import Foundation

/**
 面试题22. 链表中倒数第k个节点
 
 输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。例如，一个链表有6个节点，从头节点开始，它们的值依次是1、2、3、4、5、6。这个链表的倒数第3个节点是值为4的节点。

  

 示例：

 给定一个链表: 1->2->3->4->5, 和 k = 2.

 返回链表 4->5.

 
 */
func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
    
    var deep = 0
    func getNodeDeep(node: ListNode?) {
        guard let node = node else {
            return
        }
        deep+=1
        getNodeDeep(node: node.next)
    }
    getNodeDeep(node: head)
    
    var tmpDeep = 0
    func getNode(node: ListNode?, k: Int) -> ListNode? {
        if tmpDeep == k {
            return node
        }
        tmpDeep+=1
        return getNode(node: node?.next, k: k)
    }
    let k = deep - k + 1
    return getNode(node: head, k: k)
}

/**
 面试题64. 求1+2+…+n
 
 求 1+2+...+n ，要求不能使用乘除法、for、while、if、else、switch、case等关键字及条件判断语句（A?B:C）。

  

 示例 1：

 输入: n = 3
 输出: 6
 示例 2：

 输入: n = 9
 输出: 45
  

 限制：

 1 <= n <= 10000
 
 */

func sumNums(_ n: Int) -> Int {
    if n == 0 { return 0}
    return n + sumNums(n - 1)
}

/**
面试题66. 构建乘积数组
 
 给定一个数组 A[0,1,…,n-1]，请构建一个数组 B[0,1,…,n-1]，其中 B 中的元素 B[i]=A[0]×A[1]×…×A[i-1]×A[i+1]×…×A[n-1]。不能使用除法。

  

 示例:

 输入: [1,2,3,4,5]
 输出: [120,60,40,30,24]
  

 提示：


 */

func constructArr(_ a: [Int]) -> [Int] {
    if a.count == 0 {
        return [Int]()
    }
    var b = [Int].init(repeating: 0, count: a.count)
    b[0] = 1
    var tmp = 1
    for i in 1..<a.count{
        b[i] = b[i - 1] * a[i - 1]
    }
    for i in (0..<(a.count - 1)).reversed(){
        tmp = tmp * a[i + 1]
        b[i] = b[i] * tmp
    }
    return b
}


/**
 面试题56 - I. 数组中数字出现的次数
 
 一个整型数组 nums 里除两个数字之外，其他数字都出现了两次。请写程序找出这两个只出现一次的数字。要求时间复杂度是O(n)，空间复杂度是O(1)。

  

 示例 1：

 输入：nums = [4,1,4,6]
 输出：[1,6] 或 [6,1]
 示例 2：

 输入：nums = [1,2,10,4,1,4,3,3]
 输出：[2,10] 或 [10,2]
  

 限制：

 2 <= nums <= 10000

 */
func singleNumbers(_ nums: [Int]) -> [Int] {
    
    var nums = nums
    nums.sort()
    
    var index = nums.count - 1
    while index >= 1 {
        if nums[index] == nums[index - 1] {
            nums.remove(at: index)
            nums.remove(at: index - 1)
            index-=2
        } else {
            index-=1
        }
    }
    return nums
}
