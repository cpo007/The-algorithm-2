//
//  19.9.2.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/9/2.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation



/*
 1160. 拼写单词
 
 给你一份『词汇表』（字符串数组） words 和一张『字母表』（字符串） chars。
 
 假如你可以用 chars 中的『字母』（字符）拼写出 words 中的某个『单词』（字符串），那么我们就认为你掌握了这个单词。
 
 注意：每次拼写时，chars 中的每个字母都只能用一次。
 
 返回词汇表 words 中你掌握的所有单词的 长度之和。
 
   
 
 示例 1：
 
 输入：words = ["cat","bt","hat","tree"], chars = "atach"
 输出：6
 解释：
 可以形成字符串 "cat" 和 "hat"，所以答案是 3 + 3 = 6。
 示例 2：
 
 输入：words = ["hello","world","leetcode"], chars = "welldonehoneyr"
 输出：10
 解释：
 可以形成字符串 "hello" 和 "world"，所以答案是 5 + 5 = 10。
   
 
 提示：
 
 1 <= words.length <= 1000
 1 <= words[i].length, chars.length <= 100
 所有字符串中都仅包含小写英文字母
 
 
 */


func countCharacters(_ words: [String], _ chars: String) -> Int {
    
    var map = [String: Int]()
    
    for char in chars{
        map[char.description] = (map[char.description] ?? 0) + 1
    }
    var length = 0
    for word in words {
        var copyMap = map
        var isRight = true
        for char in word {
            copyMap[char.description] = (copyMap[char.description] ?? 0) - 1
            if copyMap[char.description]! < 0 {
                isRight = false
                break
            }
        }
        if isRight {
            length+=word.count
        }
    }
    return length
}


/*
 1169. 查询无效交易
 
 如果出现下述两种情况，交易 可能无效：
 
 交易金额超过 ¥1000
 或者，它和另一个城市中同名的另一笔交易相隔不超过 60 分钟（包含 60 分钟整）
 每个交易字符串 transactions[i] 由一些用逗号分隔的值组成，这些值分别表示交易的名称，时间（以分钟计），金额以及城市。
 
 给你一份交易清单 transactions，返回可能无效的交易列表。你可以按任何顺序返回答案。
 
   
 
 示例 1：
 
 输入：transactions = ["alice,20,800,mtv","alice,50,100,beijing"]
 输出：["alice,20,800,mtv","alice,50,100,beijing"]
 解释：第一笔交易是无效的，因为第二笔交易和它间隔不超过 60 分钟、名称相同且发生在不同的城市。同样，第二笔交易也是无效的。
 示例 2：
 
 输入：transactions = ["alice,20,800,mtv","alice,50,1200,mtv"]
 输出：["alice,50,1200,mtv"]
 示例 3：
 
 输入：transactions = ["alice,20,800,mtv","bob,50,1200,mtv"]
 输出：["bob,50,1200,mtv"]
   
 
 提示：
 
 transactions.length <= 1000
 每笔交易 transactions[i] 按 "{name},{time},{amount},{city}" 的格式进行记录
 每个交易名称 {name} 和城市 {city} 都由小写英文字母组成，长度在 1 到 10 之间
 每个交易时间 {time} 由一些数字组成，表示一个 0 到 1000 之间的整数
 每笔交易金额 {amount} 由一些数字组成，表示一个 0 到 2000 之间的整数
 
 
 
 */


func invalidTransactions(_ transactions: [String]) -> [String] {
    
    var map = [String: [String]]()
    var output = [String]()
    for transaction in transactions{
        
        let tmpArr = transaction.components(separatedBy: ",");
        
        
        if let arr = map[tmpArr[0]] {
            for tran in arr {
                if let amount = Int(tmpArr[2]), amount > 1000 {
                    if !output.contains(transaction) {
                        output.append(transaction)
                    }
                }
                let tmpArr2 = tran.components(separatedBy: ",");
                let absTime = abs(Int(tmpArr[1])! - Int(tmpArr2[1])!)
                if tmpArr2[3] != tmpArr[3] && absTime <= 60 {
                    if !output.contains(transaction) {
                        output.append(transaction)
                    }
                    if !output.contains(tran) {
                        output.append(tran)
                    }
                }
                
            }
            
            map[tmpArr[0]] = map[tmpArr[0]]! + [transaction]
        } else {
            if let amount = Int(tmpArr[2]), amount > 1000 {
                if !output.contains(transaction) {
                    output.append(transaction)
                }
            }
            var arr = [String]()
            arr.append(transaction)
            map[tmpArr[0]] = arr
        }
        
    }
    
    return output
    
}

