//
//  17.2.2.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 17/2/3.
//  Copyright © 2017年 eggplant. All rights reserved.
//

import Foundation


/*
 Best Time to Buy and Sell Stock II
 
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times). However, you may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
 
 */


func maxProfit1(_ prices: [Int]) -> Int {
    var ret = 0
    for i in 0..<prices.count {
        if i+1 >= prices.count { break }
        ret += max(prices[i+1] - prices[i], 0)
    }
    return ret
}

/*
 
 268.Missing Number
 
 Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.
 
 For example,
 Given nums = [0, 1, 3] return 2.
 
 Note:
 Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?
 */


func missingNumber(_ nums: [Int]) -> Int {
    var xor = nums.count
    for i in 0..<nums.count{
        xor ^= nums[i]
        xor ^= i
    }
    return xor
}
