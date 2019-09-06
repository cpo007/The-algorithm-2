//
//  tmp.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/9/6.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation



/*
 1162. 地图分析
 
 你现在手里有一份大小为 N x N 的『地图』（网格） grid，上面的每个『区域』（单元格）都用 0 和 1 标记好了。其中 0 代表海洋，1 代表陆地，你知道距离陆地区域最远的海洋区域是是哪一个吗？请返回该海洋区域到离它最近的陆地区域的距离。
 
 我们这里说的距离是『曼哈顿距离』（ Manhattan Distance）：(x0, y0) 和 (x1, y1) 这两个区域之间的距离是 |x0 - x1| + |y0 - y1| 。
 
 如果我们的地图上只有陆地或者海洋，请返回 -1。
 
 示例 1：
 
 
 输入：[[1,0,1],[0,0,0],[1,0,1]]
 输出：2
 解释：
 海洋区域 (1, 1) 和所有陆地区域之间的距离都达到最大，最大距离为 2。
 示例 2：
 
 
 
 输入：[[1,0,0],[0,0,0],[0,0,0]]
 输出：4
 解释：
 海洋区域 (2, 2) 和所有陆地区域之间的距离都达到最大，最大距离为 4。
 
 */

func maxDistance(_ grid: [[Int]]) -> Int {
    
    var lands = [(x: Int,y: Int)]()
    
    var seas = [(x: Int,y: Int)]()
    
    for i in 0..<grid.count{
        for j in 0..<grid[i].count{
            if grid[i][j] == 1 {
                lands.append((x: i, y: j))
            } else {
                seas.append((x: i, y: j))
            }
        }
    }
    if lands.count == 0 || seas.count == 0 { return -1 }
    
    var arr = [Int]()
    for sea in seas {
        
        var minOffset = Int.max
        for land in lands {
            
            let offsetX = abs(sea.x - land.x)
            let offsetY = abs(sea.y - land.y)
            minOffset = min(offsetX + offsetY, minOffset)
        }
        arr.append(minOffset)
    }
    
    print(arr)
    return arr.sorted().last ?? -1
}




/*
 5176. 猜字谜
 
 外国友人仿照中国字谜设计了一个英文版猜字谜小游戏，请你来猜猜看吧。
 
 字谜的迷面 puzzle 按字符串形式给出，如果一个单词 word 符合下面两个条件，那么它就可以算作谜底：
 
 单词 word 中包含谜面 puzzle 的第一个字母。
 单词 word 中的每一个字母都可以在谜面 puzzle 中找到。
 例如，如果字谜的谜面是 "abcdefg"，那么可以作为谜底的单词有 "faced", "cabbage", 和 "baggage"；而 "beefed"（不含字母 "a"）以及 "based"（其中的 "s" 没有出现在谜面中）。
 返回一个答案数组 answer，数组中的每个元素 answer[i] 是在给出的单词列表 words 中可以作为字谜迷面 puzzles[i] 所对应的谜底的单词数目。
 
   
 
 示例：
 
 输入：
 words = ["aaaa","asas","able","ability","actt","actor","access"],
 puzzles = ["aboveyz","abrodyz","abslute","absoryz","actresz","gaswxyz"]
 输出：[1,1,3,2,4,0]
 解释：
 1 个单词可以作为 "aboveyz" 的谜底 : "aaaa"
 1 个单词可以作为 "abrodyz" 的谜底 : "aaaa"
 3 个单词可以作为 "abslute" 的谜底 : "aaaa", "asas", "able"
 2 个单词可以作为 "absoryz" 的谜底 : "aaaa", "asas"
 4 个单词可以作为 "actresz" 的谜底 : "aaaa", "asas", "actt", "access"
 没有单词可以作为 "gaswxyz" 的谜底，因为列表中的单词都不含字母 'g'。
   
 
 提示：
 
 1 <= words.length <= 10^5
 4 <= words[i].length <= 50
 1 <= puzzles.length <= 10^4
 puzzles[i].length == 7
 words[i][j], puzzles[i][j] 都是小写英文字母。
 每个 puzzles[i] 所包含的字符都不重复。
 
 */

func findNumOfValidWords(_ words: [String], _ puzzles: [String]) -> [Int] {
    
    var arr = Array<Int>.init(repeating: 0, count: puzzles.count)
    for i in 0..<puzzles.count{
        
        for j in 0..<words.count{
            let word = words[j]
            if word.contains(puzzles[i].first!.description){
                var isHas = true
                for c in word{
                    if !puzzles[i].contains(c.description) {
                        isHas = false
                        break
                    }
                }
                if isHas {
                    arr[i]+=1
                }
            }
        }
    }
    return arr
}

