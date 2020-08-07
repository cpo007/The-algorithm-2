//
//  20.8.7.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2020/8/7.
//  Copyright © 2020 cpo007@qq.com. All rights reserved.
//

import Foundation

/**
 1030. 距离顺序排列矩阵单元格
 
 给出 R 行 C 列的矩阵，其中的单元格的整数坐标为 (r, c)，满足 0 <= r < R 且 0 <= c < C。

 另外，我们在该矩阵中给出了一个坐标为 (r0, c0) 的单元格。

 返回矩阵中的所有单元格的坐标，并按到 (r0, c0) 的距离从最小到最大的顺序排，其中，两单元格(r1, c1) 和 (r2, c2) 之间的距离是曼哈顿距离，|r1 - r2| + |c1 - c2|。（你可以按任何满足此条件的顺序返回答案。）

  

 示例 1：

 输入：R = 1, C = 2, r0 = 0, c0 = 0
 输出：[[0,0],[0,1]]
 解释：从 (r0, c0) 到其他单元格的距离为：[0,1]
 示例 2：

 输入：R = 2, C = 2, r0 = 0, c0 = 1
 输出：[[0,1],[0,0],[1,1],[1,0]]
 解释：从 (r0, c0) 到其他单元格的距离为：[0,1,1,2]
 [[0,1],[1,1],[0,0],[1,0]] 也会被视作正确答案。
 示例 3：

 输入：R = 2, C = 3, r0 = 1, c0 = 2
 输出：[[1,2],[0,2],[1,1],[0,1],[1,0],[0,0]]
 解释：从 (r0, c0) 到其他单元格的距离为：[0,1,1,2,2,3]
 其他满足题目要求的答案也会被视为正确，例如 [[1,2],[1,1],[0,2],[1,0],[0,1],[0,0]]。
  

 提示：

 1 <= R <= 100
 1 <= C <= 100
 0 <= r0 < R
 0 <= c0 < C

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/matrix-cells-in-distance-order
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


func allCellsDistOrder(_ R: Int, _ C: Int, _ r0: Int, _ c0: Int) -> [[Int]] {
    
    var arr = [[Int]]()
    
    for i in 0..<R{
        for j in 0..<C{
            arr.append([i,j])
        }
    }

    arr.sort { (a1, a2) -> Bool in
        
        let num1 = abs(a1[0] - r0) + abs(a1[1] - c0)
        let num2 = abs(a2[0] - r0) + abs(a2[1] - c0)
        return num1 < num2
    }
    
    return arr
}


/**
 1528. 重新排列字符串
 
 给你一个字符串 s 和一个 长度相同 的整数数组 indices 。

 请你重新排列字符串 s ，其中第 i 个字符需要移动到 indices[i] 指示的位置。

 返回重新排列后的字符串。



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shuffle-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
  
 */

func restoreString(_ s: String, _ indices: [Int]) -> String {
    
    var arr = [String].init(repeating: "", count: indices.count)
    var index = 0
    for c in s {
        arr[indices[index]] = c.description
        index+=1
    }
    return arr.joined(separator: "")
}



/*
 100. 相同的树
 
 
 给定两个二叉树，编写一个函数来检验它们是否相同。

 如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。

 示例 1:

 输入:       1         1
           / \       / \
          2   3     2   3

         [1,2,3],   [1,2,3]

 输出: true
 示例 2:

 输入:      1          1
           /           \
          2             2

         [1,2],     [1,null,2]

 输出: false
 示例 3:

 输入:       1         1
           / \       / \
          2   1     1   2

         [1,2,1],   [1,1,2]

 输出: false

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/same-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    
    
    func getStrArr(node: TreeNode?, arr: [String]) -> [String] {
        guard let node = node else {
            return arr + [""]
        }
        let tmp = arr + ["\(node.val)"]
        return tmp + getStrArr(node: node.left, arr: arr) + getStrArr(node: node.right, arr: arr)
    }
    let arr1 = getStrArr(node: p, arr: [])
    let arr2 = getStrArr(node: q, arr: [])
    return arr1 == arr2
}


/**
 105. 从前序与中序遍历序列构造二叉树
 
 根据一棵树的前序遍历与中序遍历构造二叉树。

 注意:
 你可以假设树中没有重复的元素。

 例如，给出

 前序遍历 preorder = [3,9,20,15,7]
 中序遍历 inorder = [9,3,15,20,7]
 返回如下的二叉树：

     3
    / \
   9  20
     /  \
    15   7
 
 */


func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    
    var hashMap = [Int:Int]()
    
    for i in 0..<inorder.count {
        hashMap[inorder[i]] = i
    }
    
    func deal(preorder: [Int], inorder: [Int], pLeft: Int, pRight: Int, iLeft: Int, iRight: Int) -> TreeNode? {
        if pLeft > pRight { return nil }
        
        //前序遍历的最左侧是根节点数据的位置
        let pVal = preorder[pLeft]
        //根据根节点数据在inorder处理的map中寻找对应的下标
        let iRoot = hashMap[pVal]!
        
        let node = TreeNode.init(pVal)
        
        //得到中序遍历中左子树组的大小
        let lSize = iRoot - iLeft
        
        node.left = deal(preorder: preorder, inorder: inorder, pLeft: pLeft + 1, pRight: pLeft + lSize, iLeft: iLeft, iRight: iRoot - 1)
        
        node.right = deal(preorder: preorder, inorder: inorder, pLeft: pLeft + lSize + 1, pRight: pRight, iLeft: iRoot + 1, iRight: iRight)
        return node
        
    }
    
    return deal(preorder: preorder, inorder: inorder, pLeft: 0, pRight: preorder.count - 1, iLeft: 0, iRight: inorder.count - 1)
}
