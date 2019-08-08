//
//  19.8.8.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 2019/8/8.
//  Copyright © 2019年 eggplant. All rights reserved.
//

import Foundation


/*
 319. 灯泡开关
 
 初始时有 n 个灯泡关闭。 第 1 轮，你打开所有的灯泡。 第 2 轮，每两个灯泡你关闭一次。 第 3 轮，每三个灯泡切换一次开关（如果关闭则开启，如果开启则关闭）。第 i 轮，每 i 个灯泡切换一次开关。 对于第 n 轮，你只切换最后一个灯泡的开关。 找出 n 轮后有多少个亮着的灯泡。
 
 示例:
 
 输入: 3
 输出: 1
 解释:
 初始时, 灯泡状态 [关闭, 关闭, 关闭].
 第一轮后, 灯泡状态 [开启, 开启, 开启].
 第二轮后, 灯泡状态 [开启, 关闭, 开启].
 第三轮后, 灯泡状态 [开启, 关闭, 关闭].
 
 你应该返回 1，因为只有一个灯泡还亮着。
 
 */

func bulbSwitch(_ n: Int) -> Int {
    if n <= 1 { return n }
    
    var flag = 0
    var index = 1
    var count = 2
    while index <= n {
        flag+=1
        index+=count
        index+=1
        count+=2
    }
    return flag
    
}

/*
 777. 在LR字符串中交换相邻字符
 
 在一个由 'L' , 'R' 和 'X' 三个字符组成的字符串（例如"RXXLRXRXL"）中进行移动操作。一次移动操作指用一个"LX"替换一个"XL"，或者用一个"XR"替换一个"RX"。现给定起始字符串start和结束字符串end，请编写代码，当且仅当存在一系列移动操作使得start可以转换成end时， 返回True。
 
 示例 :
 
 输入: start = "RXXLRXRXL", end = "XRLXXRRLX"
 输出: True
 解释:
 我们可以通过以下几步将start转换成end:
 RXXLRXRXL ->
 XRXLRXRXL ->
 XRLXRXRXL ->
 XRLXXRRXL ->
 XRLXXRRLX
 注意:
 
 1 <= len(start) = len(end) <= 10000。
 start和end中的字符串仅限于'L', 'R'和'X'。
 
 */

func canTransform(_ start: String, _ end: String) -> Bool {
    if start.count != end.count { return false }
    
    var i = 0
    var j = 0
    while i < start.count && j < start.count {
        while start[i] == "X" && i < start.count - 1 { i += 1 }
        while end[j] == "X" && j < end.count - 1 { j += 1 }
        if start[i] != end[j] { return false }
        if start[i] == "L" && i < j { return false }
        if start[i] == "R" && i > j { return false }
        i+=1
        j+=1
    }
    return true
}



/*
 1033. 移动石子直到连续
 
 三枚石子放置在数轴上，位置分别为 a，b，c。
 
 每一回合，我们假设这三枚石子当前分别位于位置 x, y, z 且 x < y < z。从位置 x 或者是位置 z 拿起一枚石子，并将该石子移动到某一整数位置 k 处，其中 x < k < z 且 k != y。
 
 当你无法进行任何移动时，即，这些石子的位置连续时，游戏结束。
 
 要使游戏结束，你可以执行的最小和最大移动次数分别是多少？ 以长度为 2 的数组形式返回答案：answer = [minimum_moves, maximum_moves]
 
 示例 1：
 
 输入：a = 1, b = 2, c = 5
 输出：[1, 2]
 解释：将石子从 5 移动到 4 再移动到 3，或者我们可以直接将石子移动到 3。
 示例 2：
 
 输入：a = 4, b = 3, c = 2
 输出：[0, 0]
 解释：我们无法进行任何移动。
 
 */


func numMovesStones(_ a: Int, _ b: Int, _ c: Int) -> [Int] {
    
    var arr = [a,b,c].sorted()
    let a = arr[0]
    let b = arr[1]
    let c = arr[2]
    
    var small = 0
    
    if abs(b - a) > 1 && abs(b - a) != 2 {
        small+=1
    }
    if abs(c - b) > 1 && abs(c - b) != 2  {
        small+=1
    }
    
    if abs(b - a) == 2 || abs(c - b) == 2 {
        small = 1
    }
    
    let big: Int
    if abs(b - a) == 2 {
        big = abs(c - (a + 1)) - 1
    } else if abs(c - b) == 2 {
        big = abs(a - (b + 1)) - 1
    } else {
        big = (abs(b - a) - 1) + (abs(c - b) - 1)
    }
    
    return [small,big];
}
