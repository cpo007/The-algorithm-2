//
//  main.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 16/12/16.
//  Copyright © 2016年 eggplant. All rights reserved.
//

import Foundation



/*
 给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。
 
 说明:
 
 初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
 示例:
 
 输入:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3
 
 输出: [1,2,2,3,5,6]
 

 
 */

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    if n == 0 { return }
    var index1 = 0
    var index2 = 0
    while index1 < nums1.count {
        if index1 >= nums1.count { break }
        if index2 >= nums2.count { break }
        if nums1[index1] < nums2[index2] {
            index1+=1
        } else {
            nums1.insert(nums2[index2], at: index1)
            index2+=1
        }
    }
    
    while index2 < n {
        nums1.insert(nums2[index2], at: m + index2)
        index2+=1
    }
    
    for i in ((m + index2)..<nums1.count).reversed(){
        if nums1[i] == 0 {  nums1.remove(at: i)}
    }
    
}

var arr = [-1,-1,0,0,0,0]
merge(&arr, 4, [-1,0], 2)
print(arr)
