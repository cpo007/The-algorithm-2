//
//  19.7.23.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 2019/7/23.
//  Copyright © 2019年 eggplant. All rights reserved.
//

import Foundation


/*
 374. 猜数字大小
 
 我们正在玩一个猜数字游戏。 游戏规则如下：
 我从 1 到 n 选择一个数字。 你需要猜我选择了哪个数字。
 每次你猜错了，我会告诉你这个数字是大了还是小了。
 你调用一个预先定义好的接口 guess(int num)，它会返回 3 个可能的结果（-1，1 或 0）：
 
 -1 : 我的数字比较小
 1 : 我的数字比较大
 0 : 恭喜！你猜对了！
 示例 :
 
 输入: n = 10, pick = 6
 输出: 6
 
 
 */


func guess(num: Int) -> Int {
    let pick = 6
    
    if num == pick {
        return 0
    } else if num > pick {
        return 1
    } else {
        return -1
    }
}

func guessNumber(n: Int){
    
    var arr = [1,n]
    
    
    var num = (arr[0] + arr[1]) / 2
    var status = guess(num: num)
    while status != 0 {
        switch status {
        case 1 :
            arr = [arr[0],num]
            break
        case -1 :
            arr = [num,arr[1]]
            break
        default :
            break
        }
        num = (arr[0] + arr[1]) / 2
        status = guess(num: num)
    }
    
    print(num)
}


/*
 112. 路径总和
 
 给定一个二叉树和一个目标和，判断该树中是否存在根节点到叶子节点的路径，这条路径上所有节点值相加等于目标和。
 
 说明: 叶子节点是指没有子节点的节点。
 
 
 */


func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
    
    var hasPS = false
    func getBool(node: TreeNode?, num: Int){
        guard let node = node else { return }
        var num = num
        num+=node.val
        if node.left == nil && node.right == nil {
            if !hasPS {
                hasPS = num == sum
            }
        } else {
            getBool(node: node.left, num: num)
            getBool(node: node.right, num: num)
        }
    }
    getBool(node: root, num: 0)
    return hasPS
}

/*
 129. 求根到叶子节点数字之和
 
 给定一个二叉树，它的每个结点都存放一个 0-9 的数字，每条从根到叶子节点的路径都代表一个数字。
 
 例如，从根到叶子节点路径 1->2->3 代表数字 123。
 
 计算从根到叶子节点生成的所有数字之和。
 
 说明: 叶子节点是指没有子节点的节点。
 
 */

func sumNumbers(_ root: TreeNode?) -> Int {
    
    var strArr = [String]()
    
    func getArr(node: TreeNode?,str: String){
        guard let node = node else { return }
        var str = str
        str.append("\(node.val)")
        if node.left == nil && node.right == nil {
            strArr.append(str)
        } else {
            getArr(node: node.left, str: str)
            getArr(node: node.right, str: str)
        }
    }
    
    getArr(node: root, str: "")
    print(strArr)
    
    var output = 0
    for numStr in strArr{
        output += Int(numStr) ?? 0
    }
    
    return output
}

/*
 988. 从叶结点开始的最小字符串
 
 给定一颗根结点为 root 的二叉树，书中的每个结点都有一个从 0 到 25 的值，分别代表字母 'a' 到 'z'：值 0 代表 'a'，值 1 代表 'b'，依此类推。
 
 找出按字典序最小的字符串，该字符串从这棵树的一个叶结点开始，到根结点结束。
 
 （小贴士：字符串中任何较短的前缀在字典序上都是较小的：例如，在字典序上 "ab" 比 "aba" 要小。叶结点是指没有子结点的结点。）
 
 
 */

func smallestFromLeaf(_ root: TreeNode?) -> String {
    
    var a = "abcdefghijklmnopqrstuvwxyz"
    var ans = "~"
    
    func getStr(node: TreeNode?, str: String){
        guard let node = node else { return }
        if node.left == nil && node.right == nil {
            
            ans = min(ans, a[node.val] + str)
        } else {
            getStr(node: node.left, str: a[node.val] + str)
            getStr(node: node.right, str: a[node.val] + str)
            
        }
        
    }
    getStr(node: root, str: "")
    return ans
}

