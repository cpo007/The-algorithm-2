//
//  19.8.14.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/14.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 字符串转换整数 (atoi)
 
 请你来实现一个 atoi 函数，使其能将字符串转换成整数。
 
 首先，该函数会根据需要丢弃无用的开头空格字符，直到寻找到第一个非空格的字符为止。
 
 当我们寻找到的第一个非空字符为正或者负号时，则将该符号与之后面尽可能多的连续数字组合起来，作为该整数的正负号；假如第一个非空字符是数字，则直接将其与之后连续的数字字符组合起来，形成整数。
 
 该字符串除了有效的整数部分之后也可能会存在多余的字符，这些字符可以被忽略，它们对于函数不应该造成影响。
 
 注意：假如该字符串中的第一个非空格字符不是一个有效整数字符、字符串为空或字符串仅包含空白字符时，则你的函数不需要进行转换。
 
 在任何情况下，若函数不能进行有效的转换时，请返回 0。
 
 
 */

func myAtoi(_ str: String) -> Int {
    
    var tmp = ""
    var startReceive = false
    for c in str {
        if startReceive {
            if c >= "0" && c <= "9" {
                tmp.append(c)
            } else {
                break;
            }
        } else {
            if c >= "0" && c <= "9" || c == "-" || c == "+" {
                startReceive = true
                tmp.append(c)
            } else if c != " " {
                return 0
            }
        }
    }
    
    if tmp.isEmpty || tmp == "-" || tmp == "+" || (tmp.contains("-") && tmp.contains("+")) { return 0 }
    if let a = Int(tmp) {
        if Double(a) > (pow(2, 31) - 1){
            return Int(pow(2.0, 31)) - 1
        } else if Double(a) < -(pow(2, 31)) {
            return Int(-pow(2.0, 31))
        } else {
            return a
        }
    } else {
        return tmp.contains("-") ? Int(-pow(2.0, 31)) : Int(pow(2.0, 31)) - 1
    }
}


/*
 4. 寻找两个有序数组的中位数
 给定两个大小为 m 和 n 的有序数组 nums1 和 nums2。
 
 请你找出这两个有序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。
 
 你可以假设 nums1 和 nums2 不会同时为空。
 
 */

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    
    let a = nums1.count + nums2.count
    let hasTwo = a % 2 != 1
    let b = hasTwo ? (a / 2) : (a / 2) + 1
    
    var start1 = 0
    var start2 = 0
    var arr = [Int]()
    
    while start1 < nums1.count || start2 < nums2.count {
        
        if start1 >= nums1.count {
            arr.append(nums2[start2])
            start2+=1
        } else if start2 >= nums2.count {
            arr.append(nums1[start1])
            start1+=1
        } else if nums1[start1] < nums2[start2] {
            arr.append(nums1[start1])
            start1+=1
        } else {
            arr.append(nums2[start2])
            start2+=1
        }
        
        if hasTwo {
            if arr.count == (b + 1) {
                return (Double(arr[b - 1]) + Double(arr[b])) / 2
            }
        } else {
            if arr.count == b {
                return Double(arr[b - 1])
            }
        }
    }
    return 0
}
