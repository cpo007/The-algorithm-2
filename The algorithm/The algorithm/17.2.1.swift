//
//  17.2.1.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 17/2/3.
//  Copyright © 2017年 eggplant. All rights reserved.
//

import Foundation



/*
 492. Construct the Rectangle
 
 For a web developer, it is very important to know how to design a web page's size. So, given a specific rectangular web page’s area, your job by now is to design a rectangular web page, whose length L and width W satisfy the following requirements:
 
 1. The area of the rectangular web page you designed must equal to the given target area.
 
 2. The width W should not be larger than the length L, which means L >= W.
 
 3. The difference between length L and width W should be as small as possible.
 You need to output the length L and the width W of the web page you designed in sequence.
 
 
 Example:
 Input: 4
 Output: [2, 2]
 Explanation: The target area is 4, and all the possible ways to construct it are [1,4], [2,2], [4,1].
 But according to requirement 2, [1,4] is illegal; according to requirement 3,  [4,1] is not optimal compared to [2,2]. So the length L is 2, and the width W is 2.
 
 */


/*
 func constructRectangle(_ area: Int) -> [Int] {
 print(sqrt(Double(area)))
 var arr = [[Int]]()
 for i in 1...area {
 let a = area % i
 if a == 0 {
 arr.append([i,area / i])
 }
 }
 arr = arr.filter({$0.first! >= $0.last!})
 var maxArr = arr.first
 for n in arr {
 maxArr = maxArr?.first ?? 0 - (maxArr?.last ?? 0) > (n.first! - n.last!) ? n : maxArr
 }
 return maxArr ?? [0]
 }
 */
func constructRectangle(_ area: Int) -> [Int] {
    var w = Int(sqrt(Double(area)))
    while area % w != 0 {
        w-=1
    }
    return [area/w,w]
}

/*
 167.Two Sum II - Input array is sorted
 
 Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
 
 The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.
 
 You may assume that each input would have exactly one solution and you may not use the same element twice.
 
 Input: numbers={2, 7, 11, 15}, target=9
 Output: index1=1, index2=2
 */

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var num = 0 , num2 = numbers.count - 1
    while numbers[num] + numbers[num2] != target {
        if numbers[num] + numbers[num2] > target {
            num2-=1
        } else {
            num+=1
        }
    }
    return [num + 1,num2 + 1]
}
