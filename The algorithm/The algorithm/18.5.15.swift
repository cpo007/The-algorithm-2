//
//  18.5.15.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 2018/5/15.
//  Copyright © 2018年 eggplant. All rights reserved.
//

import Foundation


/*
 给定一个m*n的矩阵，如果一个元素是0，则将其所有行与列之中的元素归0。并要求在原矩阵上完成操作。
 
 */
func matrixToZero(matrix: [[Int]]){
    var matrix = matrix
    //i是行  j是列
    for i in 0..<matrix.count{
        
        for j in 0..<matrix[i].count{
            
            if matrix[i][j] == 0 {
                for x in 0..<matrix[i].count{
                    matrix[i][x] = 0
                }
                for y in 0..<matrix.count{
                    matrix[y][j] = 0
                }
            }
        }
    }
    print(matrix)
}

