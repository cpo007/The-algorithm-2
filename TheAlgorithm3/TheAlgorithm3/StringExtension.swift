//
//  StringExtension.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/11.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

import Foundation

extension String {
    /// String使用下标截取字符串
    /// string[index] 例如："abcdefg"[3] // c
    subscript(i: Int) -> String {
        let startIndex = index(self.startIndex, offsetBy: i)
        let endIndex = index(startIndex, offsetBy: 1)
        return String(self[startIndex ..< endIndex])
    }

    /// String使用下标截取字符串
    /// string[index..<index] 例如："abcdefg"[3..<4] // d
    subscript(r: Range<Int>) -> String {
        let startIndex = index(self.startIndex, offsetBy: r.lowerBound)
        let endIndex = index(self.startIndex, offsetBy: r.upperBound)
        return String(self[startIndex ..< endIndex])
    }

    /// String使用下标截取字符串
    /// string[index,length] 例如："abcdefg"[3,2] // de
    subscript(index: Int, length: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: index)
        let endIndex = self.index(startIndex, offsetBy: length)
        return String(self[startIndex ..< endIndex])
    }

    // 截取 从头到i位置
    func substring(to: Int) -> String {
        return self[0 ..< to]
    }

    // 截取 从i到尾部
    func substring(from: Int) -> String {
        return self[from ..< count]
    }
}

// func printNodeVal(node: TreeNode?) {
//    guard let node = node else { return }
//    print(node.val)
//    printNodeVal(node: node.left)
//    printNodeVal(node: node.right)
// }

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public var index: Int = 0
    
    public init(_ val: Int) {
        self.val = val
        left = nil
        right = nil
    }
}

var index = 0
func quickSet(arr: [Any]) -> TreeNode? {
    if index < arr.count - 1 && arr[index] is Int {
        var arr = arr
        let node = TreeNode(arr[index] as! Int)
        index+=1
        node.index = index
        arr.removeFirst()
        node.left = quickSet(arr: arr)
        node.right = quickSet(arr: arr)
        return node
    } else {
        index+=1
        return nil
    }
}


func quickPrint(node: TreeNode?) {
    
    guard let node = node else {
        return
    }
    print(node.val)
    quickPrint(node: node.left)
    quickPrint(node: node.right)
    
}

struct Stack<T> {
    fileprivate var array = [T]()
    
    mutating func push(element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T? {
        return array.popLast()
    }
    
    func peek() -> T? {
        return array.last
    }
    
}
