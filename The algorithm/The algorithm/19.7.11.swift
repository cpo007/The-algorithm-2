//
//  19.7.11.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 2019/7/11.
//  Copyright © 2019年 eggplant. All rights reserved.
//

import Foundation


/*
 102. 二叉树的层次遍历
 
 给定一个二叉树，返回其按层次遍历的节点值。 （即逐层地，从左到右访问所有节点）。
 
 
 */
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    
    var map = [Int: [Int]]()
    
    func output(node: TreeNode?, deep: Int) {
        guard let node = node else { return }
        output(node: node.left, deep: deep + 1)
        output(node: node.right, deep: deep + 1)
        var arr = map[deep] ?? [Int]()
        arr.append(node.val)
        map.updateValue(arr, forKey: deep)
    }
    
    output(node: root, deep: 1)
    
    let b = map.sorted { (keyAndValue1, keyAndValue2) -> Bool in
        let (key1,_) = keyAndValue1
        let (key2,_) = keyAndValue2
        return key1 < key2
    }
    
    let a = b.map { (keyAndValue) -> [Int] in
        let (_,value) = keyAndValue
        return value
    }
    return a
    
}

/*
 429. N叉树的层序遍历
 
 给定一个 N 叉树，返回其节点值的层序遍历。 (即从左到右，逐层遍历)。
 
 */

func levelOrder(root: Node?) -> [[Int]] {
    
    var map = [Int: [Int]]()
    getLevelOrderOutput(map: &map, node: root, deep: 1)
    
    let a = map.map { (keyAndValue) -> [Int] in
        let (_,value) = keyAndValue
        return value
    }
    
    return a
}

func getLevelOrderOutput(map: inout [Int: [Int]], node: Node?, deep: Int) {
    guard let node = node else { return }
    
    var arr = map[deep] ?? [Int]()
    arr.append(node.val)
    map.updateValue(arr, forKey: deep)
    for node in node.children ?? [Node](){
        getLevelOrderOutput(map: &map, node: node, deep: deep + 1)
    }
}


/*
 589. N叉树的前序遍历
 
 
 */


func postOrderForFirst(root: Node?) -> [Int] {
    guard let root = root else { return [Int]() }
    
    var arr = [Int]()
    arr.append(root.val)
    for node in root.children ?? [Node]() {
        
        arr+=postOrder(root: node)
    }
    return arr
}
/*
 590. N叉树的后序遍历
 
 给定一个 N 叉树，返回其节点值的后序遍历。
 
 例如，给定一个 3叉树 :
 
 返回其后序遍历: [5,6,3,2,4,1].
 
   
 
 说明: 递归法很简单，你可以使用迭代法完成此题吗?
 
 
 */


func postOrder(root: Node?) -> [Int] {
    guard let root = root else { return [Int]() }
    
    var arr = [Int]()
    for node in root.children ?? [Node]() {
        
        arr+=postOrder(root: node)
    }
    arr.append(root.val)
    return arr
}

//12738459
/*
 650. 只有两个键的键盘
 最初在一个记事本上只有一个字符 'A'。你每次可以对这个记事本进行两种操作：
 
 Copy All (复制全部) : 你可以复制这个记事本中的所有字符(部分的复制是不允许的)。
 Paste (粘贴) : 你可以粘贴你上一次复制的字符。
 给定一个数字 n 。你需要使用最少的操作次数，在记事本中打印出恰好 n 个 'A'。输出能够打印出 n 个 'A' 的最少操作次数。
 
 示例 1:
 
 输入: 3
 输出: 3
 解释:
 最初, 我们只有一个字符 'A'。
 第 1 步, 我们使用 Copy All 操作。
 第 2 步, 我们使用 Paste 操作来获得 'AA'。
 第 3 步, 我们使用 Paste 操作来获得 'AAA'。
 说明:
 
 n 的取值范围是 [1, 1000] 。
 
 */

func minSteps(_ n: Int) -> Int {
    
    if n == 1 { return 0}
    var count = 0
    
    getCount(count: &count, n: n)
    
    return count + 1
}

func getCount(count:inout Int, n: Int) {
    if n == 1 { return }
    if n % 29 == 0 && n != 29 {
        count+=29
        getCount(count: &count, n: n / 29)
    } else if n % 23 == 0 && n != 23 {
        count+=23
        getCount(count: &count, n: n / 23)
    } else if n % 19 == 0 && n != 19 {
        count+=19
        getCount(count: &count, n: n / 19)
    } else if n % 17 == 0 && n != 17 {
        count+=17
        getCount(count: &count, n: n / 17)
    } else if n % 13 == 0 && n != 13 {
        count+=13
        getCount(count: &count, n: n / 13)
    } else if n % 11 == 0 && n != 11 {
        count+=11
        getCount(count: &count, n: n / 11)
    } else if n % 7 == 0 && n != 7 {
        count+=7
        getCount(count: &count, n: n / 7)
    } else if n % 5 == 0 && n != 5 {
        count+=5
        getCount(count: &count, n: n / 5)
    } else if n % 3 == 0 && n != 3 {
        count+=3
        getCount(count: &count, n: n / 3)
    } else if n % 2 == 0 && n != 2 {
        getCount(count: &count, n: n / 2)
        count+=2
    } else {
        count+=(n - 1)
    }
}

