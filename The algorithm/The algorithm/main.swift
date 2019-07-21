//
//  main.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 16/12/16.
//  Copyright © 2016年 eggplant. All rights reserved.
//

import Foundation

/*
 988. 从叶结点开始的最小字符串
 
 给定一颗根结点为 root 的二叉树，书中的每个结点都有一个从 0 到 25 的值，分别代表字母 'a' 到 'z'：值 0 代表 'a'，值 1 代表 'b'，依此类推。
 
 找出按字典序最小的字符串，该字符串从这棵树的一个叶结点开始，到根结点结束。
 
 （小贴士：字符串中任何较短的前缀在字典序上都是较小的：例如，在字典序上 "ab" 比 "aba" 要小。叶结点是指没有子结点的结点。）
 
 
 */

func smallestFromLeaf(_ root: TreeNode?) -> String {
    
    func getArr(node: TreeNode?, arr: [Int], arr2: inout [[Int]]){
        guard let node = node else { return }
        var arr = arr
        arr.insert(node.val, at: 0)
//        arr[arr.count - 1] += 1
        if node.left == nil && node.right == nil {
            arr2.append(arr)
            return
        } else {
            getArr(node: node.left, arr: arr, arr2: &arr2)
            getArr(node: node.right, arr: arr, arr2: &arr2)
        }
    }
    
    var arr = [[Int]]()
    getArr(node: root, arr: [Int](), arr2: &arr)
    
    var minCount = Int.max
    
    for e in arr{
        minCount = min(e.count, minCount)
    }
    print(arr)
    print(minCount)
    for (i,e) in arr.enumerated().reversed(){
        if e.count > minCount {
           arr.remove(at: i)
        }
    }
    print(arr)
    var index = 0
    while arr.count > 1 {
        if arr.first!.count <= index { break }
        arr.sort { (e1, e2) -> Bool in
            return e1.first! < e2.first!
        }
        let small = arr.first![index]
        arr = arr.filter({ (e) -> Bool in
            return e[index] == small
        })
        index+=1
    }
    
    guard var outputArr = arr.first else { return "" }
//    outputArr.removeLast()
    var outputStr = ""
    for num in outputArr {
       let c = Character.init(Unicode.Scalar.init(num + 97)!)
        outputStr.append(c)
    }
    return outputStr
}

let node1 = TreeNode.init(0)
let node2 = TreeNode.init(1)
let node3 = TreeNode.init(2)
let node4 = TreeNode.init(3)
let node5 = TreeNode.init(4)
let node6 = TreeNode.init(3)
let node7 = TreeNode.init(4)
//let node8 = TreeNode.init(2)
node1.left = node2
node1.right = node3
node2.left = node4
node2.right=node5
node3.left = node6
node3.right = node7

print(smallestFromLeaf(node1))

