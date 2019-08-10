//
//  main.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 16/12/16.
//  Copyright © 2016年 eggplant. All rights reserved.
//

import Foundation


/*
 1128. 等价多米诺骨牌对的数量
 
 给你一个由一些多米诺骨牌组成的列表 dominoes。
 
 如果其中某一张多米诺骨牌可以通过旋转 0 度或 180 度得到另一张多米诺骨牌，我们就认为这两张牌是等价的。
 
 形式上，dominoes[i] = [a, b] 和 dominoes[j] = [c, d] 等价的前提是 a==c 且 b==d，或是 a==d 且 b==c。
 
 在 0 <= i < j < dominoes.length 的前提下，找出满足 dominoes[i] 和 dominoes[j] 等价的骨牌对 (i, j) 的数量。
 
 示例：
 
 输入：dominoes = [[1,2],[2,1],[3,4],[5,6]]
 输出：1
   
 
 提示：
 
 1 <= dominoes.length <= 40000
 1 <= dominoes[i][j] <= 9
 
 */

func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
    
    var hashMap = [[Int]:Int]()
    
    for domino in dominoes {
        
        let rev = [domino[1],domino[0]]
        if hashMap[domino] != nil || hashMap[rev] != nil {
            if hashMap[domino] != nil {
                hashMap[domino] = hashMap[domino]! + 1
                continue
            }
            if hashMap[rev] != nil {
                hashMap[rev] = hashMap[rev]! + 1
                continue
            }
        } else {
            hashMap[domino] = 1
        }
    }
    var count = 0
    print(hashMap)
    for (_,v) in hashMap {
        if v > 1 {
            count+=(v*(v-1)/2)
        }
    }
    return count
}

print(numEquivDominoPairs([[1,1],[2,2],[1,1],[1,2],[1,2],[1,1]]))


/*
 191. 位1的个数
 
 编写一个函数，输入是一个无符号整数，返回其二进制表达式中数字位数为 ‘1’ 的个数（也被称为汉明重量）。
 
   
 
 示例 1：
 
 输入：00000000000000000000000000001011
 输出：3
 解释：输入的二进制串 00000000000000000000000000001011 中，共有三位为 '1'。
 示例 2：
 
 输入：00000000000000000000000010000000
 输出：1
 解释：输入的二进制串 00000000000000000000000010000000 中，共有一位为 '1'。
 示例 3：
 
 输入：11111111111111111111111111111101
 输出：31
 解释：输入的二进制串 11111111111111111111111111111101 中，共有 31 位为 '1'。
   
 
 提示：
 
 请注意，在某些语言（如 Java）中，没有无符号整数类型。在这种情况下，输入和输出都将被指定为有符号整数类型，并且不应影响您的实现，因为无论整数是有符号的还是无符号的，其内部的二进制表示形式都是相同的。
 在 Java 中，编译器使用二进制补码记法来表示有符号整数。因此，在上面的 示例 3 中，输入表示有符号整数 -3。
 
 */

func hammingWeight(num: Int) -> Int {
    var count = 0
    var num = num
    while num != 0 {
        count += (num & 1)
        num >>= 1
    }

    return count
}


/*
 338. 比特位计数
 
 给定一个非负整数 num。对于 0 ≤ i ≤ num 范围中的每个数字 i ，计算其二进制数中的 1 的数目并将它们作为数组返回。
 
 示例 1:
 
 输入: 2
 输出: [0,1,1]
 示例 2:
 
 输入: 5
 输出: [0,1,1,2,1,2]
 进阶:
 
 给出时间复杂度为O(n*sizeof(integer))的解答非常容易。但你可以在线性时间O(n)内用一趟扫描做到吗？
 要求算法的空间复杂度为O(n)。
 你能进一步完善解法吗？要求在C++或任何其他语言中不使用任何内置函数（如 C++ 中的 __builtin_popcount）来执行此操作。
 
 */


func countBits(_ num: Int) -> [Int] {
    
    if num == 0 { return [0] }
    if num == 1 { return [0,1] }
    var arr = Array<Int>.init(repeating: 0, count: num + 1);
    arr[1] = 1
    var a = 2
    for i in 2...num{
        
        if i / a > 1 {
            a = a * 2
        }
        arr[i] = arr[i % a] + 1
        
    }
    return arr
}
