//
//  20.11.12.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2020/11/12.
//  Copyright © 2020 cpo007@qq.com. All rights reserved.
//

import Foundation


/**
 145. 二叉树的后序遍历

 给定一个二叉树，返回它的 后序 遍历。

 示例:

 输入: [1,null,2,3]
    1
     \
      2
     /
    3

 输出: [3,2,1]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-postorder-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


func postorderTraversal(_ root: TreeNode?) -> [Int] {
    
    guard let node = root else {
        return []
    }

    var arr = [Int]()
    arr += postorderTraversal(node.left)
    arr += postorderTraversal(node.right)
    arr += [node.val]
    return arr
}



/**
 922. 按奇偶排序数组 II
 
 给定一个非负整数数组 A， A 中一半整数是奇数，一半整数是偶数。

 对数组进行排序，以便当 A[i] 为奇数时，i 也是奇数；当 A[i] 为偶数时， i 也是偶数。

 你可以返回任何满足上述条件的数组作为答案。

  

 示例：

 输入：[4,2,5,7]
 输出：[4,5,2,7]
 解释：[4,7,2,5]，[2,5,4,7]，[2,7,4,5] 也会被接受。
  

 提示：

 2 <= A.length <= 20000
 A.length % 2 == 0
 0 <= A[i] <= 1000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sort-array-by-parity-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


func sortArrayByParityII(_ A: [Int]) -> [Int] {
    
    var output = [Int].init(repeating: 0, count: A.count)
    var tmpA = A
    //将A反转
    //output从下标0开始输入数据，而A从最后一个数开始输出数据
    //每次A输出后移除元素，再次从最后一个数输出数据
    //当A为0时结束
    while tmpA.count != 0 {
        let num = tmpA.last!
        
        var index = num % 2 == 0 ? 0 : 1
        while output[index] != 0 {
            index+=2
        }
        output[index] = num
        tmpA.removeLast()
    }
    return output
}
