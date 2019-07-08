//
//  19.7.7.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 2019/7/8.
//  Copyright © 2019年 eggplant. All rights reserved.
//

import Foundation

/*
 977. 有序数组的平方
 
 给定一个按非递减顺序排序的整数数组 A，返回每个数字的平方组成的新数组，要求也按非递减顺序排序。
 
 示例 1：
 
 输入：[-4,-1,0,3,10]
 输出：[0,1,9,16,100]
 示例 2：
 
 输入：[-7,-3,2,3,11]
 输出：[4,9,9,49,121]
   
 
 提示：
 
 1 <= A.length <= 10000
 -10000 <= A[i] <= 10000
 A 已按非递减顺序排序。
 
 */

func sortedSquares(_ A: [Int]) -> [Int] {
    
    var arr = [Int]()
    
    for num in A {
        arr.append(num * num)
    }
    arr.sort { (n1, n2) -> Bool in
        return n1 < n2
    }
    return arr
}

func sortedSquares2(_ A: [Int]) -> [Int] {
    
    var A = A
    A.sort { (n1, n2) -> Bool in
        return abs(n1) < abs(n2)
    }
    for (index,value) in A.enumerated() {
        A[index] = value * value
    }
    return A
}


/*
 977. 有序数组的平方
 
 给定一个按非递减顺序排序的整数数组 A，返回每个数字的平方组成的新数组，要求也按非递减顺序排序。
 
 示例 1：
 
 输入：[-4,-1,0,3,10]
 输出：[0,1,9,16,100]
 示例 2：
 
 输入：[-7,-3,2,3,11]
 输出：[4,9,9,49,121]
   
 
 提示：
 
 1 <= A.length <= 10000
 -10000 <= A[i] <= 10000
 A 已按非递减顺序排序。
 
 */




/*
 709. 转换成小写字母
 
 实现函数 ToLowerCase()，该函数接收一个字符串参数 str，并将该字符串中的大写字母转换成小写字母，之后返回新的字符串。
 
   
 
 示例 1：
 
 输入: "Hello"
 输出: "hello"
 示例 2：
 
 输入: "here"
 输出: "here"
 示例 3：
 
 输入: "LOVELY"
 输出: "lovely"
 
 */

func toLowerCase(_ str: String) -> String {
    
    var output = ""
    for c in str{
        if let value = c.unicodeScalars.first?.value, value <= 90, value >= 65 {
            output.append(Character.init(UnicodeScalar(value + 32)!))
        } else {
            output.append(c)
        }
    }
    return output
}


/*
 530. 二叉搜索树的最小绝对差
 给定一个所有节点为非负值的二叉搜索树，求树中任意两节点的差的绝对值的最小值。
 
 示例 :
 
 输入:
 
 1
 \
 3
 /
 2
 
 输出:
 1
 
 解释:
 最小绝对差为1，其中 2 和 1 的差的绝对值为 1（或者 2 和 3）。
 注意: 树中至少有2个节点。
 
 */


func getMinimumDifference(_ root: TreeNode?) -> Int {
    
    var arr = [Int]()
    
    getArr(arr: &arr, root: root)
    
    var min = Int.max
    for (index,value) in arr.enumerated(){
        if index + 1 < arr.count, arr[index + 1] - value < min {
            min = arr[index + 1] - value
        }
    }
    return min
}


func getArr(arr: inout [Int],root: TreeNode?) {
    
    if root == nil { return }
    getArr(arr: &arr, root: root?.left)
    arr.append(root!.val)
    getArr(arr: &arr, root: root?.right)
    
}


/*
 532. 数组中的K-diff数对
 
 给定一个整数数组和一个整数 k, 你需要在数组里找到不同的 k-diff 数对。这里将 k-diff 数对定义为一个整数对 (i, j), 其中 i 和 j 都是数组中的数字，且两数之差的绝对值是 k.
 
 示例 1:
 
 输入: [3, 1, 4, 1, 5], k = 2
 输出: 2
 解释: 数组中有两个 2-diff 数对, (1, 3) 和 (3, 5)。
 尽管数组中有两个1，但我们只应返回不同的数对的数量。
 
 示例 2:
 
 输入:[1, 2, 3, 4, 5], k = 1
 输出: 4
 解释: 数组中有四个 1-diff 数对, (1, 2), (2, 3), (3, 4) 和 (4, 5)。
 示例 3:
 
 输入: [1, 3, 1, 5, 4], k = 0
 输出: 1
 解释: 数组中只有一个 0-diff 数对，(1, 1)。
 注意:
 
 数对 (i, j) 和数对 (j, i) 被算作同一数对。
 数组的长度不超过10,000。
 所有输入的整数的范围在 [-1e7, 1e7]。
 
 */


func findPairs(_ nums: [Int], _ k: Int) -> Int {
    if k < 0 {
        return 0
    }
    var map = [Int:Int]()
    var count = 0
    for i in 0..<nums.count{
        let value = (map[nums[i]] ?? 0) + 1
        map.updateValue(value, forKey: nums[i])
    }
    
    if k == 0 {
        for (key,_) in map{
            if let value = map[key], value >= 2 {
                count+=1
            }
        }
    } else {
        for (key,_) in map{
            if map[key + k] != nil {
                count+=1
            }
        }
    }
    return count
}
