//
//  16.12.30.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 16/12/31.
//  Copyright © 2016年 eggplant. All rights reserved.
//

import Foundation

func repeatedSubstringPattern1(_ str: String) -> Bool {
    //KMP算法
    let length = str.characters.count
    //i表示的是下一需要比较的字符串的下标
    var i = 1,j = 0
    var next = [Int](repeating:0, count:length+1)
    while i < length {
        if str.characters[str.characters.index(str.characters.startIndex, offsetBy: i)] == str.characters[str.characters.index(str.characters.startIndex, offsetBy: j)] {
            //若位置i的字符与j匹配的上则对下一个位置的字符进行比较
            //同时，对next数组（即最大公共长度数组进行更新），其下标中的数值即是当前的最大公共长度，即j+=1后的值
            i+=1
            j+=1
            next[i] = j
        } else if j == 0 {
            //若公共长度为一，这种情况可能出现在一开始，也就是字符一开始没有匹配上的时候，亦可能出现在匹配过程中因为匹配不上而不断切割公共长度，直到公共长度为0时。
            //此时，将需要比对的字符向后移动一位进行匹配，也就是i+=1
            i+=1
        } else {
            //当字符不匹配而公共长度又不为0时则不断切割最大公共长度，即前移j在字符串中的位置，也就是将之前保存的next容器中的最大公共长度进行切割，获取j的历史值
            j = next[j]
        }
    }
    return  next[length] > 0 && next[length] % (length - next[length]) == 0
}

/*
 Power of Three
 
 Given an integer, write a function to determine if it is a power of three.
 
 Follow up:
 Could you do it without using any loop / recursion?
 
 */

func isPowerOfThree(_ n: Int) -> Bool {
    return ( n>0 &&  1162261467%n==0)
}

/*
 Power of Two
 
 
 Given an integer, write a function to determine if it is a power of two.
 */

func isPowerOfTwo(_ n: Int) -> Bool {
    print(n & (n-1))
    //使用与运算，如果n是2的X次方则其二进制只有一个1，&运算后则全为0
    return ((n & (n-1))==0 && n>0)
}

/*
 202. Happy Number
 
 Write an algorithm to determine if a number is "happy".
 
 A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.
 */



func cal(n: Int) -> Int {
    var x = n , y = 0
    while x > 0 {
        y = y + (x % 10) * (x % 10)
        x = x / 10
    }
    return y
}


func isHappy(_ n: Int) -> Bool {
    var x = n , y = n
    while x > 1 {
        x = cal(n: x)
        if x == 1 { return true }
        y = cal(n: cal(n: y))
        if y == 1 { return true }
        if x == y { return false }
    }
    return true
}
