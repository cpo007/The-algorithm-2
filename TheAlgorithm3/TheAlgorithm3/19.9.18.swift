//
//  19.9.18.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/9/19.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 1078. Bigram 分词
 
 给出第一个词 first 和第二个词 second，考虑在某些文本 text 中可能以 "first second third" 形式出现的情况，其中 second 紧随 first 出现，third 紧随 second 出现。
 
 对于每种这样的情况，将第三个词 "third" 添加到答案中，并返回答案。
 
   
 
 示例 1：
 
 输入：text = "alice is a good girl she is a good student", first = "a", second = "good"
 输出：["girl","student"]
 示例 2：
 
 输入：text = "we will we will rock you", first = "we", second = "will"
 输出：["we","rock"]
   
 
 提示：
 
 1 <= text.length <= 1000
 text 由一些用空格分隔的单词组成，每个单词都由小写英文字母组成
 1 <= first.length, second.length <= 10
 first 和 second 由小写英文字母组成
 
 
 */


func findOcurrences(_ text: String, _ first: String, _ second: String) -> [String] {
    
    var arr = text.components(separatedBy: " ")
    var output = [String]()
    for i in 0..<(arr.count - 2){
        
        if arr[i] == first && arr[i + 1] == second {
            output.append(arr[i + 2])
        }
    }
    
    return output
}
