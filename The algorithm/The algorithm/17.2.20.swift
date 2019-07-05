//
//  17.2.20.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 17/2/20.
//  Copyright © 2017年 eggplant. All rights reserved.
//

import Foundation



/*
 434. Number of Segments in a String
 
 Count the number of segments in a string, where a segment is defined to be a contiguous sequence of non-space characters.
 
 Please note that the string does not contain any non-printable characters.
 
 Example:
 
 Input: "Hello, my name is John"
 Output: 5
 */


func countSegments(_ s: String) -> Int {
    var num = 0
    var s = s + " "
    let cArr = Array(s.characters)
    for i in 1..<cArr.count{
        if cArr[i] == " " && cArr[i - 1] != " " {
            num+=1
        }
    }
    return num
}
