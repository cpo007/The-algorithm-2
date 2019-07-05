//
//  17.2.9（2）.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 17/2/9.
//  Copyright © 2017年 eggplant. All rights reserved.
//

import Foundation


/*
 345. Reverse Vowels of a String
 
 Write a function that takes a string as input and reverse only the vowels of a string.
 
 Example 1:
 Given s = "hello", return "holle".
 
 Example 2:
 Given s = "leetcode", return "leotcede".
 
 Note:
 The vowels does not include the letter "y".
 
 */


func reverseVowels(s: String) -> String {
    let vowels:[Character] = ["a","e","i","o","u","A","E","I","O","U"]
    var Carr:[Character] = Array(s.characters)
    var start = 0 , end = Carr.count - 1
    while start < end {
        if !vowels.contains(Carr[start]) {
            start+=1
        } else if !vowels.contains(Carr[end]) {
            end-=1
        } else {
            Carr.swapAt(start, end)
            start+=1
            end-=1
        }
    }
    return String(Carr)
}
