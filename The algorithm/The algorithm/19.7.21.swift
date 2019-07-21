//
//  19.7.21.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 2019/7/21.
//  Copyright © 2019年 eggplant. All rights reserved.
//

import Foundation

/*
 872. 叶子相似的树
 
 请考虑一颗二叉树上所有的叶子，这些叶子的值按从左到右的顺序排列形成一个 叶值序列 。
 
 
 
 举个例子，如上图所示，给定一颗叶值序列为 (6, 7, 4, 9, 8) 的树。
 
 如果有两颗二叉树的叶值序列是相同，那么我们就认为它们是 叶相似 的。
 
 如果给定的两个头结点分别为 root1 和 root2 的树是叶相似的，则返回 true；否则返回 false 。
 
 
 */

func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
    
    func getArr(node: TreeNode?, input: inout [Int]){
        guard let node = node else { return }
        if node.left == nil && node.right == nil {
            input.append(node.val)
        } else {
            getArr(node: node.left, input: &input)
            getArr(node: node.right, input: &input)
        }
    }
    
    var root1Arr = [Int]()
    var root2Arr = [Int]()
    getArr(node: root1, input: &root1Arr)
    getArr(node: root2, input: &root2Arr)
    
    if root1Arr.count != root2Arr.count { return false }
    
    for i in 0..<root1Arr.count{
        let a = root1Arr[i]
        let b = root2Arr[i]
        if a != b { return false }
    }
    return true
}
/*
 998. 最大二叉树 II
 
 最大树定义：一个树，其中每个节点的值都大于其子树中的任何其他值。
 
 给出最大树的根节点 root。
 
 就像之前的问题那样，给定的树是从表 A（root = Construct(A)）递归地使用下述 Construct(A) 例程构造的：
 
 如果 A 为空，返回 null
 否则，令 A[i] 作为 A 的最大元素。创建一个值为 A[i] 的根节点 root
 root 的左子树将被构建为 Construct([A[0], A[1], ..., A[i-1]])
 root 的右子树将被构建为 Construct([A[i+1], A[i+2], ..., A[A.length - 1]])
 返回 root
 请注意，我们没有直接给定 A，只有一个根节点 root = Construct(A).
 
 假设 B 是 A 的副本，并附加值 val。保证 B 中的值是不同的。
 
 返回 Construct(B)。
 
 
 */

func insertIntoMaxTree(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    
    func insert(node: TreeNode?, father: TreeNode?, val: Int) -> TreeNode? {
        if node == nil {
            if father == nil {
                return nil
            } else {
                father?.right = TreeNode.init(val)
            }
        } else {
            if val > node!.val {
                let a = TreeNode.init(val)
                a.left = node
                if father == nil {
                    return a
                } else {
                    father?.right = a
                    //                return father
                }
            } else {
                insert(node: node!.right, father: node, val: val)
            }
        }
        return nil
    }
    let node = insert(node: root, father: nil, val: val)
    return node == nil ? root : node
}

/*
 654. 最大二叉树
 
 给定一个不含重复元素的整数数组。一个以此数组构建的最大二叉树定义如下：
 
 二叉树的根是数组中的最大元素。
 左子树是通过数组中最大值左边部分构造出的最大二叉树。
 右子树是通过数组中最大值右边部分构造出的最大二叉树。
 通过给定的数组构建最大二叉树，并且输出这个树的根节点。
 
 */

func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
    
    
    func maxValue(input: [Int], left: Int, right: Int) -> [Int] {
        
        var index = 0
        var maxNum = Int.min
        
        for i in left...right{
            let num = input[i]
            if num > maxNum {
                maxNum = num
                index = i
            }
        }
        return [maxNum,index]
    }
    
    func construct(input: [Int], left: Int, right: Int) -> TreeNode? {
        
        if left > right { return nil }
        
        var result = maxValue(input: input, left: left, right: right)
        
        let node = TreeNode.init(result[0])
        node.left = construct(input: input, left: left, right: result[1] - 1)
        node.right = construct(input: input, left: result[1] + 1, right: right)
        return node
    }
    
    return construct(input: nums, left: 0, right: nums.count - 1)
    
}

