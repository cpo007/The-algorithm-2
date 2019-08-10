//
//  19.8.10.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/10.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

import Foundation



/*
 11. 盛最多水的容器
 
 给定 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
 
 说明：你不能倾斜容器，且 n 的值至少为 2。
 
 */

func maxArea(_ height: [Int]) -> Int {
    
    var start = 0
    var end = height.count - 1
    
    var area = 0
    while start < end {
        area = max(area, (end - start) * min(height[start], height[end]))
        let a = height[start]
        let b = height[end]
        a < b ? (start+=1) : (end-=1)
        
    }
    return area
}

/*
 1089. 复写零
 
 给你一个长度固定的整数数组 arr，请你将该数组中出现的每个零都复写一遍，并将其余的元素向右平移。
 
 注意：请不要在超过该数组长度的位置写入元素。
 
 要求：请对输入的数组 就地 进行上述修改，不要从函数返回任何东西。
 
   
 
 示例 1：
 
 输入：[1,0,2,3,0,4,5,0]
 输出：null
 解释：调用函数后，输入的数组将被修改为：[1,0,0,2,3,0,0,4]
 示例 2：
 
 输入：[1,2,3]
 输出：null
 解释：调用函数后，输入的数组将被修改为：[1,2,3]
 
 */


func duplicateZeros(_ arr: inout [Int]) {
    
    for (index,num) in arr.enumerated().reversed(){
        if num == 0 {
            arr.insert(0, at: index)
            arr.removeLast()
        }
    }
    
}


/*
 797. 所有可能的路径
 
 给一个有 n 个结点的有向无环图，找到所有从 0 到 n-1 的路径并输出（不要求按顺序）
 
 二维数组的第 i 个数组中的单元都表示有向图中 i 号结点所能到达的下一些结点（译者注：有向图是有方向的，即规定了a→b你就不能从b→a）空就是没有下一个结点了。
 
 示例:
 输入: [[1,2], [3], [3], []]
 输出: [[0,1,3],[0,2,3]]
 解释: 图是这样的:
 0--->1
 |    |
 v    v
 2--->3
 这有两条路: 0 -> 1 -> 3 和 0 -> 2 -> 3.
 提示:
 
 结点的数量会在范围 [2, 15] 内。
 你可以把路径以任意顺序输出，但在路径内的结点的顺序必须保证。
 
 */


func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
    
    var output = [[Int]]()
    
    func getPathsSource(deep: Int, memory: [Int]){
        
        if deep >= graph.count {
            output.append([0] + memory)
            return;
        }
        if graph[deep].count == 0{
            output.append([0] + memory)
            return;
        }
        for num in graph[deep] {
            getPathsSource(deep: num, memory: memory + [num])
        }
    }
    getPathsSource(deep: 0, memory: [])
    
    return output
}
