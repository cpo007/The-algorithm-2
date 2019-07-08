//
//  19.7.8.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 2019/7/8.
//  Copyright © 2019年 eggplant. All rights reserved.
//

import Foundation


/*
 1108. IP 地址无效化
 
 给你一个有效的 IPv4 地址 address，返回这个 IP 地址的无效化版本。
 
 所谓无效化 IP 地址，其实就是用 "[.]" 代替了每个 "."。
 
   
 
 示例 1：
 
 输入：address = "1.1.1.1"
 输出："1[.]1[.]1[.]1"
 示例 2：
 
 输入：address = "255.100.50.0"
 输出："255[.]100[.]50[.]0"
   
 
 提示：
 
 给出的 address 是一个有效的 IPv4 地址
 
 */

func defangIPaddr(_ address: String) -> String {
    
    var address = address
    for i in (0..<address.count).reversed(){
        let c = address[i]
        
        if c == "." {
            address.remove(at: String.Index.init(encodedOffset: i))
            address.insert(Character.init("]"), at: String.Index.init(encodedOffset: i))
            address.insert(Character.init("."), at: String.Index.init(encodedOffset: i))
            address.insert(Character.init("["), at: String.Index.init(encodedOffset: i))
        }
        
    }
    return address
}

print(defangIPaddr("192.168.0.1"))


/*
 56. 合并区间
 
 给出一个区间的集合，请合并所有重叠的区间。
 
 示例 1:
 
 输入: [[1,3],[2,6],[8,10],[15,18]]
 输出: [[1,6],[8,10],[15,18]]
 解释: 区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
 示例 2:
 
 输入: [[1,4],[4,5]]
 输出: [[1,5]]
 解释: 区间 [1,4] 和 [4,5] 可被视为重叠区间。
 
 */

func merge(_ intervals: [[Int]]) -> [[Int]] {
    
    if intervals.count <= 1 { return intervals }
    var intervals = intervals
    intervals.sort { (arr1, arr2) -> Bool in
        arr1.first! < arr2.first!
    }
    
    var first = intervals.first!.first!
    var last = intervals.first!.last!
    var arr = [[Int]]()
    var isConnect: Bool?
    
    for (index,_) in intervals.enumerated(){
        
        let b = index + 1 >= intervals.count ? nil : intervals[index + 1]
        
        if let b = b {
            isConnect = (last <= b.last! && last >= b.first!) || (last >= b.last! &&  first <= b.first!)
        } else {
            if let isConnect = isConnect,isConnect {
                arr.append([first,last])
            } else {
                arr.append(intervals.last!)
            }
            isConnect = nil
        }
        
        if let isConnect = isConnect {
            if isConnect {
                first = min(first, b!.first!)
                last = max(last, b!.last!)
            } else {
                arr.append([first,last])
                first = b!.first!
                last = b!.last!
            }
        }
    }
    
    return arr
}


/*
 986. 区间列表的交集
 
 给定两个由一些闭区间组成的列表，每个区间列表都是成对不相交的，并且已经排序。
 
 返回这两个区间列表的交集。
 
 （形式上，闭区间 [a, b]（其中 a <= b）表示实数 x 的集合，而 a <= x <= b。两个闭区间的交集是一组实数，要么为空集，要么为闭区间。例如，[1, 3] 和 [2, 4] 的交集为 [2, 3]。）
 
   
 
 示例：
 
 输入：A = [[0,2],[5,10],[13,23],[24,25]], B = [[1,5],[8,12],[15,24],[25,26]]
 输出：[[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]
 注意：输入和所需的输出都是区间对象组成的列表，而不是数组或列表。
   
 
 提示：
 
 0 <= A.length < 1000
 0 <= B.length < 1000
 0 <= A[i].start, A[i].end, B[i].start, B[i].end < 10^9
 
 */

func intervalIntersection(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
    
    var index1 = 0
    var index2 = 0
    
    var arr = [[Int]]()
    while index1 < A.count && index2 < B.count {
        let a = A[index1]
        let b = B[index2]
        if a.last! < b.last! {
            if a.last! > b.first! {
                //完全包裹
                if a.first! >= b.first! {
                    arr.append([a.first!,a.last!])
                } else {
                    arr.append([b.first!,a.last!])
                }
            } else if a.last! == b.first! {
                arr.append([a.last!,b.first!])
            }
            index1+=1
        } else {
            
            if b.last! > a.first! {
                //完全包裹
                if b.first! >= a.first! {
                    arr.append([b.first!,b.last!])
                } else {
                    arr.append([a.first!,b.last!])
                }
            } else if b.last! == a.first! {
                arr.append([b.last!,a.first!])
            }
            index2+=1
            
        }
    }
    return arr
}

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
