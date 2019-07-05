//
//  16.12.19.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 16/12/19.
//  Copyright © 2016年 eggplant. All rights reserved.
//

import Foundation


/*
 Fizz Buzz
 
 Write a program that outputs the string representation of numbers from 1 to n.
 
 But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.
 写一个程序输出字符串数组表示从1到N的数字。
 但是，当数字为3的倍数时输出字符串“Fizz”,当数字为5的倍数时输出字符串"Buzz",当数字同为3及5的倍数时输出“FizzBuzz”
 */

func fizzBuzz(number: Int) -> [String] {
    var array = [String]()
    for i in 1...number {
        if i % 3 == 0 && i % 5 == 0{
            array.append("FizzBuzz")
        } else if i % 3 == 0 {
            array.append("Fizz")
        } else if i % 5 == 0 {
            array.append("Buzz")
        } else {
            array.append("\(i)")
        }
    }
    return array
}

let fizzBuzzArray = fizzBuzz(number: 15)


/*
 Island Perimeter
 
 You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water. Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells). The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.
 
 */



//每一块陆地的周长与其上下左右有关，上下左右无岛则为4，其一方向有岛则为3，依次推论，则可得周长。

func getTheLandPerimeter(map:[[Int]]) -> Int{
    //先判断上下左右数组是否越界问题
    //接着判断每个1的上下左右是否存在另外的1
    //根据1的数量确定其周长
    //将所有周长整合
    var perimeter = 0
    for i in 0..<map.count {
        let numberArr = map[i]
        for j in 0..<numberArr.count{
            let number = numberArr[j]
            if number == 1 {
                let up = i == 0 ? 0 : map[i - 1][j]
                let down = i == (map.count - 1) ? 0 : map[i + 1][j]
                let right = j == 0 ? 0 : map[i][j - 1]
                let left = j == (numberArr.count - 1) ? 0 : map[i][j + 1]
                let lands = up + right + left + down
                perimeter+=(4 - lands)
            }
        }
    }
    return perimeter
}

let p = getTheLandPerimeter(map: [[0,1,0,0],
                                  [1,1,1,0],
                                  [0,1,0,0],
                                  [1,1,0,0]])
