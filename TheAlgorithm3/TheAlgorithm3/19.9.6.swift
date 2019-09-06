//
//  19.9.6.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/9/6.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 1047. 删除字符串中的所有相邻重复项
 
 给出由小写字母组成的字符串 S，重复项删除操作会选择两个相邻且相同的字母，并删除它们。
 
 在 S 上反复执行重复项删除操作，直到无法继续删除。
 
 在完成所有重复项删除操作后返回最终的字符串。答案保证唯一。
 
   
 
 示例：
 
 输入："abbaca"
 输出："ca"
 解释：
 例如，在 "abbaca" 中，我们可以删除 "bb" 由于两字母相邻且相同，这是此时唯一可以执行删除操作的重复项。之后我们得到字符串 "aaca"，其中又只有 "aa" 可以执行重复项删除操作，所以最后的字符串为 "ca"。
 
 
 */

func removeDuplicates2(_ S: String) -> String {
    
    var output = ""
    
    for c in S{
        //        let index = output.count - 1
        if c == output.last {
            output.removeLast()
        } else {
            output.append(c)
        }
    }
    return output
}

func removeDuplicates(_ S: String) -> String {
    
    var chars = S
    var index = chars.count - 1
    while index > 0 {
        
        let a = chars[index]
        let b = chars[index - 1]
        if a == b {
            chars.remove(at: chars.index(chars.startIndex, offsetBy: index))
            chars.remove(at: chars.index(chars.startIndex, offsetBy: index - 1))
            if index - 1 < chars.count {
                index-=1
            } else {
                index-=2
            }
        } else {
            index-=1
        }
    }
    return chars
}

