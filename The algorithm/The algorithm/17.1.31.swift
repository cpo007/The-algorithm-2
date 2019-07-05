//
//  17.1.31.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 17/2/3.
//  Copyright © 2017年 eggplant. All rights reserved.
//

import Foundation


/*
 Number Complement
 
 
 Given a positive integer, output its complement number. The complement strategy is to flip the bits of its binary representation.
 
 Note:
 The given integer is guaranteed to fit within the range of a 32-bit signed integer.
 You could assume no leading zero bit in the integer’s binary representation.
 
 */

func findComplement(_ num: Int) -> Int {
    var b = ""
    for c in String(num,radix:2).characters {
        b.append("\(1 - Int(c.description)!)")
    }
    var i:Double = 0
    var d = 0
    for c in b.characters.reversed() {
        d += Int(c.description)! * Int(pow(2.0,i))
        i+=1
    }
    return d
}

/*
 485. Max Consecutive Ones
 
 Given a binary array, find the maximum number of consecutive 1s in this array.
 
 Example 1:
 Input: [1,1,0,1,1,1]
 Output: 3
 Explanation: The first two digits or the last three digits are consecutive 1s.
 The maximum number of consecutive 1s is 3.
 */




func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var max1 = 0
    var maxHere = 0
    for n in nums {
        if n == 0 {
            max1 = 0
        } else {
            max1+=1
        }
        maxHere = max(maxHere, max1)
    }
    return maxHere
}

