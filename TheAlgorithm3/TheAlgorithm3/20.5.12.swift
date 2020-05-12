//
//  20.5.12.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2020/5/12.
//  Copyright © 2020 cpo007@qq.com. All rights reserved.
//

import Foundation

/**
 面试题58 - I. 翻转单词顺序
 
 输入一个英文句子，翻转句子中单词的顺序，但单词内字符的顺序不变。为简单起见，标点符号和普通字母一样处理。例如输入字符串"I am a student. "，则输出"student. a am I"。
 
 
 示例 1：

 输入: "the sky is blue"
 输出: "blue is sky the"
 示例 2：

 输入: "  hello world!  "
 输出: "world! hello"
 解释: 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
 示例 3：

 输入: "a good   example"
 输出: "example good a"
 解释: 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。

 
 */

func reverseWords(_ s: String) -> String {
    if s.isEmpty {
        return ""
    }
    let sArr = s.components(separatedBy: " ").split { (str) -> Bool in
        return str.isEmpty
        }
    var output = ""
    for stmp in sArr.reversed(){
        for s in stmp.reversed(){
            output.append("\(s) ")
        }
    }
    if output.count > 0 {
        output.removeLast()
    }
    
    return output
}

/**
 面试题55 - I. 二叉树的深度
 
 输入一棵二叉树的根节点，求该树的深度。从根节点到叶节点依次经过的节点（含根、叶节点）形成树的一条路径，最长路径的长度为树的深度。

 例如：

 给定二叉树 [3,9,20,null,null,15,7]，

     3
    / \
   9  20
     /  \
    15   7
 返回它的最大深度 3 。

  

 提示：

 节点总数 <= 10000

 */

func maxDepth(_ root: TreeNode?) -> Int {
    
    func getDeep(node: TreeNode?,deep: Int) -> Int {
        guard let node = node else {
            return deep
        }
        let deep = deep + 1
        return max(getDeep(node: node.left, deep: deep), getDeep(node: node.right, deep: deep))
    }
    return getDeep(node: root, deep: 0)
}

/**
 
 155. 最小栈
 
 设计一个支持 push ，pop ，top 操作，并能在常数时间内检索到最小元素的栈。

 push(x) —— 将元素 x 推入栈中。
 pop() —— 删除栈顶的元素。
 top() —— 获取栈顶元素。
 getMin() —— 检索栈中的最小元素。


 示例:

 输入：
 ["MinStack","push","push","push","getMin","pop","top","getMin"]
 [[],[-2],[0],[-3],[],[],[],[]]

 输出：
 [null,null,null,null,-3,null,0,-2]

 解释：
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin();   --> 返回 -3.
 minStack.pop();
 minStack.top();      --> 返回 0.
 minStack.getMin();   --> 返回 -2.
  

 提示：

 pop、top 和 getMin 操作总是在 非空栈 上调用。


 */

class MinStack {

    /** initialize your data structure here. */
    var stack = [Int]()
    var min_stack = [Int]()
    
    init() {
        
    }
    
    func push(_ x: Int) {
        stack.append(x)
        min_stack.append(min(x, min_stack.last ?? Int.max))
    }
    
    func pop() {
        stack.removeLast()
        min_stack.removeLast()
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func getMin() -> Int {
        return min_stack.last!
    }
}
