//
//  19.8.30.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/31.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 60. 第k个排列
 
 给出集合 [1,2,3,…,n]，其所有元素共有 n! 种排列。
 
 按大小顺序列出所有排列情况，并一一标记，当 n = 3 时, 所有排列如下：
 
 "123"
 "132"
 "213"
 "231"
 "312"
 "321"
 给定 n 和 k，返回第 k 个排列。
 
 说明：
 
 给定 n 的范围是 [1, 9]。
 给定 k 的范围是[1,  n!]。
 示例 1:
 
 输入: n = 3, k = 3
 输出: "213"
 示例 2:
 
 输入: n = 4, k = 9
 输出: "2314"
 
 */

func getPermutation(_ n: Int, _ k: Int) -> String {
    
    var arr = [Int]()
    
    for i in 1...n{
        arr.append(i)
    }
    var output = [String]()
    
    func back(input: [Int],tmp: String) {
        if output.count >= (k) {
            return;
        }
        if input.count == 0 {
            output.append(tmp)
        }
        
        var input = input
        for i in (0..<input.count){
            let a = input[i]
            input.remove(at: i)
            back(input: input, tmp: tmp + "\(a)")
            input.insert(a, at: i)
        }
    }
    
    back(input: arr, tmp: "")
    return output[k - 1]
}


/*
 54. 螺旋矩阵
 
 给定一个包含 m x n 个元素的矩阵（m 行, n 列），请按照顺时针螺旋顺序，返回矩阵中的所有元素。
 
 示例 1:
 
 输入:
 [
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
 ]
 输出: [1,2,3,6,9,8,7,4,5]
 示例 2:
 
 输入:
 [
 [1, 2, 3, 4],
 [5, 6, 7, 8],
 [9,10,11,12]
 ]
 输出: [1,2,3,4,8,12,11,10,9,5,6,7]
 
 */

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    
    var arr = [Int]()
    if matrix.count == 0 { return arr }
    
    var r1 = 0
    var r2 = matrix.count - 1
    var c1 = 0
    var c2 = matrix[0].count - 1
    
    while r1 <= r2 && c1 <= c2 {
        
        for i in c1...c2{
            arr.append(matrix[r1][i])
        }
        if (r1 + 1) > r2 { break }
        for i in (r1 + 1)...r2{
            arr.append(matrix[i][c2])
        }
        if r1 < r2 && c1 < c2 {
            for i in ((c1 + 1)..<c2).reversed(){
                arr.append(matrix[r2][i])
            }
            for i in ((r1 + 1)...(r2)).reversed(){
                arr.append(matrix[i][c1])
            }
            
        }
        r1+=1
        r2-=1
        c1+=1
        c2-=1
    }
    return arr
}
