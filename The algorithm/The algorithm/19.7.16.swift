//
//  19.7.16.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 2019/7/21.
//  Copyright © 2019年 eggplant. All rights reserved.
//

import Foundation

/*
 1046. 最后一块石头的重量
 
 有一堆石头，每块石头的重量都是正整数。
 
 每一回合，从中选出两块最重的石头，然后将它们一起粉碎。假设石头的重量分别为 x 和 y，且 x <= y。那么粉碎的可能结果如下：
 
 如果 x == y，那么两块石头都会被完全粉碎；
 如果 x != y，那么重量为 x 的石头将会完全粉碎，而重量为 y 的石头新重量为 y-x。
 最后，最多只会剩下一块石头。返回此石头的重量。如果没有石头剩下，就返回 0。
 
 */

func lastStoneWeight(_ stones: [Int]) -> Int {
    
    var stones = stones
    while stones.count >= 2 {
        
        stones.sort { (e1, e2) -> Bool in
            return e1 < e2
        }
        let e1 = stones.last!
        let e2 = stones[stones.count - 2]
        stones.removeLast()
        stones.removeLast()
        let rw = abs(e1 - e2)
        if rw > 0 {
            stones.append(rw)
        }
    }
    return stones.last ?? 0
}

/*
 447. 回旋镖的数量
 
 给定平面上 n 对不同的点，“回旋镖” 是由点表示的元组 (i, j, k) ，其中 i 和 j 之间的距离和 i 和 k 之间的距离相等（需要考虑元组的顺序）。
 
 找到所有回旋镖的数量。你可以假设 n 最大为 500，所有点的坐标在闭区间 [-10000, 10000] 中。
 
 示例:
 
 输入:
 [[0,0],[1,0],[2,0]]
 
 输出:
 2
 
 解释:
 两个回旋镖为 [[1,0],[0,0],[2,0]] 和 [[1,0],[2,0],[0,0]]
 
 */

func dist(i: [Int],j: [Int]) -> Int {
    return (i[0]-j[0])*(i[0]-j[0]) + (i[1]-j[1])*(i[1]-j[1])
}

func numberOfBoomerangs(_ points: [[Int]]) -> Int {
    var count = 0
    var map = [Int:Int]()
    
    for i in 0..<points.count{
        
        for j in 0..<points.count{
            if i == j { continue }
            let d = dist(i: points[i], j: points[j])
            if (map[d] ?? 0) > 0 {
                count += (map[d] ?? 0) * 2
            }
            map[d] = (map[d] ?? 0) + 1
        }
        map = [Int: Int]()
    }
    return count
}

/*
 884. 两句话中的不常见单词
 
 给定两个句子 A 和 B 。 （句子是一串由空格分隔的单词。每个单词仅由小写字母组成。）
 
 如果一个单词在其中一个句子中只出现一次，在另一个句子中却没有出现，那么这个单词就是不常见的。
 
 返回所有不常用单词的列表。
 
 您可以按任何顺序返回列表。
 
   
 
 示例 1：
 
 输入：A = "this apple is sweet", B = "this apple is sour"
 输出：["sweet","sour"]
 示例 2：
 
 输入：A = "apple apple", B = "banana"
 输出：["banana"]
   
 
 提示：
 
 0 <= A.length <= 200
 0 <= B.length <= 200
 A 和 B 都只包含空格和小写字母
 
 
 */

func uncommonFromSentences(_ A: String, _ B: String) -> [String] {
    
    let a = A.components(separatedBy: " ")
    let b = B.components(separatedBy: " ")
    
    var map = [String: Int]()
    
    for s in a {
        map[s] = (map[s] ?? 0) + 1
    }
    for s in b {
        map[s] = (map[s] ?? 0) + 1
    }
    var output = [String]()
    for (k,v) in map {
        if v == 1 {
            output.append(k)
        }
    }
    
    return output
}


/*
 5129. 表现良好的最长时间段
 
 给你一份工作时间表 hours，上面记录着某一位员工每天的工作小时数。
 
 我们认为当员工一天中的工作小时数大于 8 小时的时候，那么这一天就是「劳累的一天」。
 
 所谓「表现良好的时间段」，意味在这段时间内，「劳累的天数」是严格 大于「不劳累的天数」。
 
 请你返回「表现良好时间段」的最大长度。
 
 
 示例 1：
 
 输入：hours = [9,9,6,0,6,6,9]
 输出：3
 解释：最长的表现良好时间段是 [9,9,6]。
 */

func longestWPI(_ hours: [Int]) -> Int {
    
    var total = 0
    
    for i in (0..<hours.count).reversed(){
        var goodOrNot = Array<Int>.init(repeating: 0, count: 2)
        hours[i] > 8 ? (goodOrNot[0] = 1) : (goodOrNot[1] = 1)
        if goodOrNot[0] > goodOrNot[1] {
            total = max(total, goodOrNot[0] + goodOrNot[1])
        }
        for j in (0..<i).reversed(){
            
            let value = hours[j]
            if value > 8 {
                goodOrNot[0]+=1
            } else {
                goodOrNot[1]+=1
            }
            if goodOrNot[0] > goodOrNot[1] {
                total = max(total, goodOrNot[0] + goodOrNot[1])
            }
        }
    }
    return total
    
}

func logestWPI2(_ hours: [Int]) -> Int {
    
    var score = Array<Int>.init(repeating: 0, count: hours.count)
    
    for i in 0..<score.count{
        score[i] = hours[i] > 8 ? 1 : -1
    }
    var presum = Array<Int>.init(repeating: 0, count: hours.count + 1)
    
    for i in 1..<presum.count{
        presum[i] = presum[i - 1] + score[i - 1]
    }
    var stack = [Int]()
    for i in 0..<presum.count{
        if stack.count == 0 || presum[stack.last ?? 0] > presum[i]{
            stack.append(i)
        }
    }
    var ans = 0
    var i = hours.count
    while i > ans {
        while stack.count > 0 && presum[stack.last ?? 0] < presum[i] {
            ans = max(ans, i - (stack.last ?? 0))
            stack.popLast()
        }
        i-=1
    }
    return ans
}
