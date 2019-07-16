//
//  19.7.15.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 2019/7/15.
//  Copyright © 2019年 eggplant. All rights reserved.
//

import Foundation


/*
 5128. 最深叶节点的最近公共祖先
 
 给你一个有根节点的二叉树，找到它最深的叶节点的最近公共祖先。
 
 回想一下：
 
 叶节点 是二叉树中没有子节点的节点
 树的根节点的 深度 为 0，如果某一节点的深度为 d，那它的子节点的深度就是 d+1
 如果我们假定 A 是一组节点 S 的 最近公共祖先，<font color="#c7254e" face="Menlo, Monaco, Consolas, Courier New, monospace">S</font> 中的每个节点都在以 A 为根节点的子树中，且 A 的深度达到此条件下可能的最大值。
 
 提示：
 
 给你的树中将有 1 到 1000 个节点。
 树中每个节点的值都在 1 到 1000 之间。
 */


func lcaDeepestLeaves(_ root: TreeNode?) -> TreeNode? {
    
    var map = [Int:[[Int]]]()
    func getDeepMap(node: TreeNode? ,deep: Int,nodeLinkArr: [Int]){
        guard let node = node else { return }
        
        var nodeLinkArr = nodeLinkArr
        nodeLinkArr.append(node.val)
        
        if node.left == nil && node.right == nil {
            var arr = map[deep] ?? [[Int]]()
            arr.append(nodeLinkArr)
            map.updateValue(arr, forKey: deep)
        } else {
            getDeepMap(node: node.left, deep: deep + 1, nodeLinkArr: nodeLinkArr)
            getDeepMap(node: node.right, deep: deep + 1, nodeLinkArr: nodeLinkArr)
        }
    }
    
    getDeepMap(node: root, deep: 1, nodeLinkArr: [Int]())
    
    var Imax = 0
    
    for (k,_) in map {
        Imax = max(Imax, k)
    }
    
    guard let arr = map[Imax] else { return nil }
    print(arr)
    
    func getFatherVal(arr: [[Int]]) -> Int? {
        var index = arr.first!.count - 1
        
        while index >= 0 {
            
            var oldVal = arr.first![index]
            var isFatherVal = true
            for nodeLinkArr in arr {
                let val = nodeLinkArr[index]
                if oldVal != val {
                    isFatherVal = false
                    break
                }
                oldVal = val
            }
            if isFatherVal {
                return oldVal
            }
            index-=1
        }
        return nil
    }
    
    guard let val = getFatherVal(arr: arr) else { return nil }
    print(val)
    
    func getFatherNode(node: TreeNode?,val: Int) -> TreeNode? {
        guard let node = node else { return nil }
        if node.val == val {
            return node
        }
        if let node1 = getFatherNode(node: node.left, val: val) {
            return node1
        }
        if let node2 = getFatherNode(node: node.right, val: val) {
            return node2
        }
        return nil
    }
    
    return getFatherNode(node: root, val: val)
}



/*
 5127. 数组的相对排序
 
 给你两个数组，arr1 和 arr2，
 
 arr2 中的元素各不相同
 arr2 中的每个元素都出现在 arr1 中
 对 arr1 中的元素进行排序，使 arr1 中项的相对顺序和 arr2 中的相对顺序相同。未在 arr2 中出现过的元素需要按照升序放在 arr1 的末尾。
 
 
 
 示例：
 
 输入：arr1 = [2,3,1,3,2,4,6,7,9,2,19], arr2 = [2,1,4,3,9,6]
 输出：[2,2,2,1,4,3,3,9,6,7,19]
 
 提示：
 
 arr1.length, arr2.length <= 1000
 0 <= arr1[i], arr2[i] <= 1000
 arr2 中的元素 arr2[i] 各不相同
 arr2 中的每个元素 arr2[i] 都出现在 arr1 中
 */


func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    
    var map = [Int: [Int]]()
    
    for value in arr1 {
        var arr = map[value] ?? [Int]()
        arr.append(value)
        map.updateValue(arr, forKey: value)
    }
    
    var arr = [Int]()
    for value in arr2{
        arr+=(map[value])!
        map.removeValue(forKey: value)
    }
    let map2 = map.sorted { (e1, e2) -> Bool in
        let (key1,_) = e1
        let (key2,_) = e2
        return key1 < key2
    }
    
    for (_,v) in map2{
        arr+=v
    }
    return arr
}
