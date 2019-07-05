//
//  16.12.21.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 16/12/24.
//  Copyright © 2016年 eggplant. All rights reserved.
//

import Foundation


/*
 Find All Numbers Disappeared in an Array
 
 Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
 
 Find all the elements of [1, n] inclusive that do not appear in this array.
 
 Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.
 
 Example:
 
 Input:
 [4,3,2,7,8,2,3,1]
 
 Output:
 [5,6]
 
 */

func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    //The basic idea is that we iterate through the input array and mark elements as negative using nums[nums[i] -1] = -nums[nums[i]-1]. In this way all the numbers that we have seen will be marked as negative. In the second iteration, if a value is not marked as negative, it implies we have never seen that index before, so just add it to the return list.
    
    var nums = nums
    var output = [Int]()
    for i in 0..<nums.count {
        let val = abs(nums[i]) - 1
        print("val:\(val)")
        if nums[val] > 0 {
            nums[val] = -nums[val]
        }
    }
    for i in 0..<nums.count{
        if nums[i] > 0 {
            output.append(i+1)
        }
    }
    return output
}


/*
 Hamming Distance
 The Hamming distance between two integers is the number of positions at which the corresponding bits are different.
 
 Given two integers x and y, calculate the Hamming distance.
 Note:
 0 ≤ x, y < 231.
 Example:
 
 Input: x = 1, y = 4
 
 Output: 2
 
 Explanation:
 1   (0 0 0 1)
 4   (0 1 0 0)
 ↑   ↑
 */

//将数字转化为二进制
//二进制汉明距离的比较在于汉明重量的异或，即两者的汉明距离=两者的汉明重量异或运算后的值
//而二进制的汉明重量在于1的个数
func dec2bin(number:Int) -> String {
    var n = number
    var str = ""
    while n > 0 {
        str = "\(n % 2)" + str
        n /= 2
    }
    return str
}

func getHammingDistance(number1: Int, number2: Int) -> Int {
    if number1 < 0 || number2 < 0 { return 0 }
    var str1 = String(number1, radix: 2)
    var str2 = String(number2, radix: 2)
    //为了异或运算，对两个二进制字符串改造
    while str1.lengthOfBytes(using: .utf8) != str2.lengthOfBytes(using: .utf8) {
        str1.lengthOfBytes(using: .utf8) < str2.lengthOfBytes(using: .utf8) ?
            (str1 = "0" + str1) : (str2 = "0" + str2)
    }
    var hammingWeight = 0
    //获取汉明距离
    for i in 0..<str1.lengthOfBytes(using: .utf8){
        //在比较前可先再次判断长度是否相等
        let index = str1.index(str1.startIndex, offsetBy: i)
        if str1[index] != str2[index] {
            hammingWeight+=1
        }
    }
    return hammingWeight
}

