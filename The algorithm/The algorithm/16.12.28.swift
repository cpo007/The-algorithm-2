//
//  16.12.28.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 16/12/29.
//  Copyright © 2016年 eggplant. All rights reserved.
//

import Foundation



/*
 Reverse Linked List
 
 Reverse a singly linked list.
 
 
 */

public class Node {
    public var val: Int
    public var children: [Node]?
    public init(_ val: Int, children: [Node]?) {
        self.val = val
        self.children = children
    }
}


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Solution {
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        
        var head = head
        var newhead:ListNode?
        while let h = head {
            let next = h.next
            h.next = newhead
            newhead = head
            head = next
        }
        return newhead
    }
}



/*
 Roman to Integer
 
 Given a roman numeral, convert it to an integer.
 
 Input is guaranteed to be within the range from 1 to 3999.
 */


func romanToInt(_ s: String) -> Int {
    
    let dic = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]
    var sum = dic[s.characters.last?.description ?? "I"] ?? 0
    for i in (0..<s.lengthOfBytes(using: .utf8) - 1).reversed(){
        if let n1 = dic[s[s.characters.index(s.characters.startIndex, offsetBy: i)].description] ,let n2 = dic[s[s.characters.index(s.characters.startIndex, offsetBy: i + 1)].description] {
            if n1 < n2 {
                sum-=n1
            } else {
                sum+=n1
            }
        }
    }
    return sum
}


/*
 Binary Watch
 
 A binary watch has 4 LEDs on the top which represent the hours (0-11), and the 6 LEDs on the bottom represent the minutes (0-59).
 
 Each LED represents a zero or one, with the least significant bit on the right.
 
 
 jpg:https://upload.wikimedia.org/wikipedia/commons/8/8b/Binary_clock_samui_moon.jpg
 Given a non-negative integer n which represents the number of LEDs that are currently on, return all possible times the watch could represent.
 
 */


/*
 以二进制1的数量来统计
 因为所有已有的数字本身二进制只有一个1
 只有当组合时二进制才会产生复数的1，比如11点=2+8+1= 3个1，分钟亦是同理
 因此，只要将小时与分钟产生的1的数量与num进行对比即可知道有哪些时间符合定义
 
 
 */

func getOne(s: String) -> Int {
    var sum = 0
    for c in s.characters {
        if c.description == "1" {
            sum+=1
        }
    }
    return sum
}

func readBinaryWatch(_ num: Int) -> [String] {
    
    var times = [String]()
    for h in 0..<12 {
        for m in 0..<60 {
            if getOne(s: String(h,radix:2)) + getOne(s: String(m,radix:2)) == num {
                times.append("\(h):\(String(format: "%02d", m))")
            }
        }
    }
    return times
}


/*
 Number of Boomerangs
 
 
 Given n points in the plane that are all pairwise distinct, a "boomerang" is a tuple of points (i, j, k) such that the distance between i and j equals the distance between i and k (the order of the tuple matters).
 
 Find the number of boomerangs. You may assume that n will be at most 500 and coordinates of points are all in the range [-10000, 10000] (inclusive).
 
 Example:
 Input:
 [[0,0],[1,0],[2,0]]
 
 Output:
 2
 
 Explanation:
 The two boomerangs are [[1,0],[0,0],[2,0]] and [[1,0],[2,0],[0,0]]
 
 */


//func numberOfBoomerangs(_ points: [[Int]]) -> Int {
//    
//    var output = 0
//    var dic = [Int:Int]()
//    for i in 0..<points.count {
//        for j in 0..<points.count {
//            if points[i] == points[j] { continue }
//            let px = points[i][0] - (points[j][0])
//            let py = points[i][1] - (points[j][1])
//            let plength = px * px + py * py
//            dic.updateValue((dic[plength] ?? 0) + 1, forKey: plength)
//        }
//        for (_,v) in dic {
//            output+=(v * (v - 1))
//        }
//        dic.removeAll()
//    }
//    return output
//}
