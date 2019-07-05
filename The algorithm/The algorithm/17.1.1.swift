//
//  17.1.1.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 17/1/2.
//  Copyright © 2017年 eggplant. All rights reserved.
//

import Foundation



/*
 Best Time to Buy and Sell Stock
 
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 If you were only permitted to complete at most one transaction (ie, buy one and sell one share of the stock), design an algorithm to find the maximum profit.
 
 Example 1:
 Input: [7, 1, 5, 3, 6, 4]
 Output: 5
 
 max. difference = 6-1 = 5 (not 7-1 = 6, as selling price needs to be larger than buying price)
 Example 2:
 Input: [7, 6, 4, 3, 1]
 Output: 0
 
 In this case, no transaction is done, i.e. max profit = 0.
 */


func maxProfit(_ prices: [Int]) -> Int {
    var maxPro = 0
    var minPro = Int.max
    
    for i in 0..<prices.count {
        minPro = min(minPro, prices[i])
        maxPro = max(maxPro, prices[i] - minPro)
    }
    return maxPro
}

/*
 Remove Duplicates from Sorted List
 
 Given a sorted linked list, delete all duplicates such that each element appear only once.
 
 For example,
 Given 1->1->2, return 1->2.
 Given 1->1->2->3->3, return 1->2->3.
 */

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    if head?.next == nil { return head }
    head?.next = deleteDuplicates(head?.next)
    return head?.val == head?.next?.val ? head?.next : head
}
