//
//  16.12.25.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 16/12/25.
//  Copyright © 2016年 eggplant. All rights reserved.
//

import Foundation


/*
 Invert Binary Tree
 
 
 Invert a binary tree.
 
 4
 /   \
 2     7
 / \   / \
 1   3 6   9
 to
 4
 /   \
 7     2
 / \   / \
 9   6 3   1
 */


func invertTree(_ root: TreeNode?) -> TreeNode? {
    if root != nil {
        invertTree(root?.left)
        invertTree(root?.right)
        swap(&root!.left, &root!.right)
        return root
    } else {
        return root
    }
    
}

/*
 Assign Cookies
 
 Assume you are an awesome parent and want to give your children some cookies. But, you should give each child at most one cookie. Each child i has a greed factor gi, which is the minimum size of a cookie that the child will be content with; and each cookie j has a size sj. If sj >= gi, we can assign the cookie j to the child i, and the child i will be content. Your goal is to maximize the number of your content children and output the maximum number.
 
 Note:
 You may assume the greed factor is always positive.
 You cannot assign more than one cookie to one child.
 
 Example 1:
 Input: [1,2,3], [1,1]
 
 Output: 1
 
 Explanation: You have 3 children and 2 cookies. The greed factors of 3 children are 1, 2, 3.
 And even though you have 2 cookies, since their size is both 1, you could only make the child whose greed factor is 1 content.
 You need to output 1.
 Example 2:
 Input: [1,2], [1,2,3]
 
 Output: 2
 
 Explanation: You have 2 children and 3 cookies. The greed factors of 2 children are 1, 2.
 You have 3 cookies and their sizes are big enough to gratify all of the children,
 You need to output 2.
 
 */

//你有N个孩子以及M个饼干，每个孩子的胃口不一样，需求不同大小的饼干，若饼干的大小大于等于小孩的胃口则视为该小孩满足


func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
    if g.count == 0 || s.count == 0 { return 0 }
    var g = g.sorted{$0<$1}
    var s = s.sorted{$0<$1}
    var output = 0
    var scount = s.count - 1
    for i in (0..<g.count).reversed(){
        if s[scount] >= g[i] {
            output+=1
            scount-=1
            if scount < 0 { break }
        }
    }
    print(output)
    return output
}
