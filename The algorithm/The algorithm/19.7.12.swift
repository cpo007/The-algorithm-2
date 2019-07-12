//
//  File.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 2019/7/12.
//  Copyright © 2019年 eggplant. All rights reserved.
//

import Foundation
/*
 788. 旋转数字
 
 我们称一个数 X 为好数, 如果它的每位数字逐个地被旋转 180 度后，我们仍可以得到一个有效的，且和 X 不同的数。要求每位数字都要被旋转。
 
 如果一个数的每位数字被旋转以后仍然还是一个数字， 则这个数是有效的。0, 1, 和 8 被旋转后仍然是它们自己；2 和 5 可以互相旋转成对方；6 和 9 同理，除了这些以外其他的数字旋转以后都不再是有效的数字。
 
 现在我们有一个正整数 N, 计算从 1 到 N 中有多少个数 X 是好数？
 
 示例:
 输入: 10
 输出: 4
 解释:
 在[1, 10]中有四个好数： 2, 5, 6, 9。
 注意 1 和 10 不是好数, 因为他们在旋转之后不变。
 
 */

func rotatedDigits(_ N: Int) -> Int {
    
    var count = 0
    
    var dp = Array<Int>.init(repeating: 0, count: N + 1)
    
    for i in 1...N{
        
        if i == 3 || i == 4 || i == 7 || dp [i / 10] == 1 || dp[i % 10] == 1{
            dp[i] = 1
        } else if i == 2 || i == 5 || i == 6 || i == 9 || dp[i / 10] == 2 || dp[i % 10] == 2 {
            dp[i] = 2
            count+=1
        }
        
    }
    return count
}


/*
 520. 检测大写字母
 
 给定一个单词，你需要判断单词的大写使用是否正确。
 
 我们定义，在以下情况时，单词的大写用法是正确的：
 
 全部字母都是大写，比如"USA"。
 单词中所有字母都不是大写，比如"leetcode"。
 如果单词不只含有一个字母，只有首字母大写， 比如 "Google"。
 否则，我们定义这个单词没有正确使用大写字母。
 
 示例 1:
 
 输入: "USA"
 输出: True
 示例 2:
 
 输入: "FlaG"
 输出: False
 注意: 输入是由大写和小写拉丁字母组成的非空单词。
 
 
 */


func detectCapitalUse(_ word: String) -> Bool {
    
    var onlyFirstCharCapital = false
    var isAllCapital = false
    var isAllLowercase = false
    
    for (index,char) in word.enumerated() {
        
        guard let asciiValue = char.unicodeScalars.first?.value else { return false }
        
        if index == 0 {
            if  asciiValue <= 90, asciiValue >= 65 {
                onlyFirstCharCapital = true
                isAllCapital = true
                isAllLowercase = false
            } else {
                isAllLowercase = true
            }
        } else {
            if  asciiValue <= 90, asciiValue >= 65 {
                if isAllCapital {
                    isAllCapital = true
                }
                onlyFirstCharCapital = false
                isAllLowercase = false
            } else {
                isAllCapital = false
                if !onlyFirstCharCapital {
                    onlyFirstCharCapital = false
                }
                if !isAllLowercase {
                    isAllLowercase = false
                }
            }
        }
    }
    
    return onlyFirstCharCapital || isAllLowercase || isAllCapital
}

/*
 111. 二叉树的最小深度
 
 给定一个二叉树，找出其最小深度。
 
 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。
 
 说明: 叶子节点是指没有子节点的节点。
 
 示例:
 
 给定二叉树 [3,9,20,null,null,15,7],
 
 3
 / \
 9  20
 /  \
 15   7
 返回它的最小深度  2.
 
 */


func minDepth(_ root: TreeNode?) -> Int {
    
    guard let root = root else { return 0}
    
    func minDeep(deep: Int,node: TreeNode?) -> Int {
        guard let node = node else { return Int.max }
        
        if node.left == nil && node.right == nil {
            return deep
        }
        
        let num = min(minDeep(deep: deep + 1, node: node.left), minDeep(deep: deep + 1, node: node.right))
        
        return num
    }
    
    return minDeep(deep: 1, node: root)
}
