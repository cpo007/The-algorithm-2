//
//  main.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/10.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

import Foundation


func missingNumber(_ nums: [Int]) -> Int {
    

    var a = 0
    var map = [Int: Int]()
    for num in nums{
        map[num] = 1
    }
    while map[a] != nil {
        a+=1
    }
    return a
}



func sortedListToBST(_ head: ListNode?) -> TreeNode? {
    
    var head = head
    var arr = [Int]()
    while head != nil {
        arr.append(head!.val)
        head = head?.next
    }
    
    func buildBST(start: Int, end: Int) -> TreeNode? {
        if start > end { return nil }
        let mid = (start + end) / 2
        let node = TreeNode.init(arr[mid])
        node.left = buildBST(start: start, end: mid - 1)
        node.right = buildBST(start: mid + 1, end: end)
        return node
    }
        
    return buildBST(start: 0, end: arr.count - 1)
    
}
