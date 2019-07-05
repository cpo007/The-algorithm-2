//
//  main.swift
//  TheAlgorithm2
//
//  Created by cpo007@qq.com on 2018/5/15.
//  Copyright © 2018年 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 
 693. Binary Number with Alternating Bits

 Given a positive integer, check whether it has alternating bits: namely, if two adjacent bits will always have different values.
 
 Example 1:
 Input: 5
 Output: True
 Explanation:
 The binary representation of 5 is: 101
 Example 2:
 Input: 7
 Output: False
 Explanation:
 The binary representation of 7 is: 111.
 Example 3:
 Input: 11
 Output: False
 Explanation:
 The binary representation of 11 is: 1011.
 
 Example 4:
 Input: 10
 Output: True
 Explanation:
 The binary representation of 10 is: 1010.
 */

func hasAlternatingBits(_ n: Int) -> Bool {
    
    print(n>>1)
    print((n^(n>>1)))
    let tmp = (n^(n>>1))
    return (tmp&(tmp+1))==0
}

print(hasAlternatingBits(5))
