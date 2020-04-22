//
//  main.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/10.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

import Foundation


/**
 面试题17. 打印从1到最大的n位数
 
 输入数字 n，按顺序打印出从 1 到最大的 n 位十进制数。比如输入 3，则打印出 1、2、3 一直到最大的 3 位数 999。

 示例 1:

 输入: n = 1
 输出: [1,2,3,4,5,6,7,8,9]
  

 说明：

 用返回一个整数列表来代替打印
 n 为正整数

 
 */

func printNumbers(_ n: Int) -> [Int] {
    
    let max = Int(pow(10.0, Double(n))) - 1
    var i = 1
    var arr = [Int]()
    while i <= max {
        arr.append(i)
        i+=1
    }
    return arr
}
print(printNumbers(3))

/*
 面试题65. 不用加减乘除做加法
 
 写一个函数，求两个整数之和，要求在函数体内不得使用 “+”、“-”、“*”、“/” 四则运算符号。

  

 示例:

 输入: a = 1, b = 1
 输出: 2
  

 提示：

 a, b 均可能是负数或 0
 结果不会溢出 32 位整数


 */

func add(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    while(b != 0) { // 当进位为 0 时跳出
        let c = (a & b) << 1;  // c = 进位
        a ^= b; // a = 非进位和
        b = c; // b = 进位
    }
    return a;
}


func getNodeMap(node: TreeNode?, map: inout [Int: Int], deep: Int) {
    guard let node = node else {
        return
    }
    if map[deep] == nil {
        map[deep] = node.val
    }
    getNodeMap(node: node.right, map: &map, deep: deep + 1)
    getNodeMap(node: node.left, map: &map, deep: deep + 1)
}

func rightSideView(_ root: TreeNode?) -> [Int] {
    
    var map = [Int: Int]()
    getNodeMap(node: root, map: &map, deep: 1)
    
    var deep = 1;
    var arr = [Int]()
    while map[deep] != nil {
        arr.append(map[deep]!)
        deep+=1
    }
    return arr;
}
