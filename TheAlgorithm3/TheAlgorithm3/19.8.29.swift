//
//  19.8.28.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/29.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 58. 最后一个单词的长度
 
 给定一个仅包含大小写字母和空格 ' ' 的字符串，返回其最后一个单词的长度。
 
 如果不存在最后一个单词，请返回 0 。
 
 说明：一个单词是指由字母组成，但不包含任何空格的字符串。
 
 示例:
 
 输入: "Hello World"
 输出: 5
 
 */

func lengthOfLastWord(_ s: String) -> Int {
    
    var index = 0
    for c in s.reversed(){
        
        if c == " " && index == 0 {
            continue;
        } else if c == " " && index != 0 {
            break;
        }
        index+=1
    }
    
    return index
}


/*
 49. 字母异位词分组
 
 给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。
 
 示例:
 
 输入: ["eat", "tea", "tan", "ate", "nat", "bat"],
 输出:
 [
 ["ate","eat","tea"],
 ["nat","tan"],
 ["bat"]
 ]
 
 
 */



func groupAnagrams(_ strs: [String]) -> [[String]] {
    
    var map = [[String.Element]: [String]]()
    
    for str in strs{
        
        let a = str.sorted { (e1, e2) -> Bool in e1 < e2 }
        
        var arr = map[a] ?? [String]()
        arr.append(str)
        map[a] = arr
        
    }
    
    var arr = [[String]]()
    
    for (_,v) in map{
        arr.append(v)
    }
    
    
    return arr
}


/*
 47. 全排列 II
 
 给定一个可包含重复数字的序列，返回所有不重复的全排列。
 
 示例:
 
 输入: [1,1,2]
 输出:
 [
 [1,1,2],
 [1,2,1],
 [2,1,1]
 ]
 
 */


func permuteUnique(_ nums: [Int]) -> [[Int]] {
    var output = [[Int]]()
    
    func recursion(arr: [Int],tmp: [Int]) {
        if arr.count == 0 {
            if !output.contains(tmp) {
                output.append(tmp)
            }
            return
        }
        var arr = arr
        for i in (0..<arr.count).reversed(){
            if i > 0 && arr[i] == arr[i - 1] { continue }
            let num = arr[i]
            arr.remove(at: i)
            recursion(arr: arr, tmp: tmp + [num])
            arr.insert(num, at: i)
        }
    }
    
    recursion(arr: nums, tmp: [Int]())
    return output
}

