//
//  main.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/10.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 1104. 二叉树寻路
 
 在一棵无限的二叉树上，每个节点都有两个子节点，树中的节点 逐行 依次按 “之” 字形进行标记。
 
 如下图所示，在奇数行（即，第一行、第三行、第五行……）中，按从左到右的顺序进行标记；
 
 而偶数行（即，第二行、第四行、第六行……）中，按从右到左的顺序进行标记。
 
 
 
 给你树上某一个节点的标号 label，请你返回从根节点到该标号为 label 节点的路径，该路径是由途经的节点标号所组成的。
 
   
 
 示例 1：
 
 输入：label = 14
 输出：[1,3,4,14]
 示例 2：
 
 输入：label = 26
 输出：[1,2,6,10,26]
   
 
 提示：
 
 1 <= label <= 10^6
 
 */


func pathInZigZagTree(_ label: Int) -> [Int] {
    
    var num = 0
    var powNum: Double = 0
    var level = 0
    
    while label > num {
        num+=Int(pow(2, powNum))
        powNum+=1
        level+=1
    }
    
    var output = [Int]()
    output.append(label)
    powNum-=1
    var label = label
    
    while level > 1 {
        if level % 2 == 0 {
            let count = num == label ? 1 : 0
            let offset = Int(pow(2, powNum)) - (num - label) + (Int(pow(2, powNum)) - (num - label)) / 2 - count

            label-=offset
            output.insert(label, at: 0)
        } else {
            let count = num == label ? 0 : 1
            let offset = (label - (num - Int(pow(2, powNum))) + 1) - (label - (num - Int(pow(2, powNum))) + 1) / 2 - count
            label-=offset
            output.insert(label, at: 0)
        }
        num-=Int(pow(2, powNum))
        powNum-=1
        level-=1
    }
    
    print(level)
    
    return output
}

print(pathInZigZagTree(8))
