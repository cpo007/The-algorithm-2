//
//  19.9.1.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/9/1.
//  Copyright © 2019 cpo007@qq.com. All rights reserved.
//

import Foundation

/*
 5174. 健身计划评估
 
 你的好友是一位健身爱好者。前段日子，他给自己制定了一份健身计划。现在想请你帮他评估一下这份计划是否合理。
 
 他会有一份计划消耗的卡路里表，其中 calories[i] 给出了你的这位好友在第 i 天需要消耗的卡路里总量。
 
 计划的统计周期通常是 k 天，你需要计算他在每一段连续的 k 天内消耗的总卡路里 T：
 
 如果 T < lower，那么这份计划相对糟糕，并失去 1 分；
 如果 T > upper，那么这份计划相对优秀，并获得 1 分；
 否则，这份计划普普通通，分值不做变动。
 请返回统计完所有 calories.length 天后得到的总分作为评估结果。
 
 注意：总分可能是负数。
 
   
 
 示例 1：
 
 输入：calories = [1,2,3,4,5], k = 1, lower = 3, upper = 3
 输出：0
 解释：calories[0], calories[1] < lower 而 calories[3], calories[4] > upper, 总分 = 0.
 示例 2：
 
 输入：calories = [3,2], k = 2, lower = 0, upper = 1
 输出：1
 解释：calories[0] + calories[1] > upper, 总分 = 1.
 示例 3：
 
 输入：calories = [6,5,0,0], k = 2, lower = 1, upper = 5
 输出：0
 解释：calories[0] + calories[1] > upper, calories[2] + calories[3] < lower, 总分 = 0.
   
 
 */

func dietPlanPerformance(_ calories: [Int], _ k: Int, _ lower: Int, _ upper: Int) -> Int {
    
    
    var calorieSum = 0
    
    for i in 0..<k - 1{
        calorieSum+=calories[i]
    }
    
    var point = 0
    var index = 0
    for i in (k - 1)..<calories.count {
        calorieSum+=calories[i]
        if calorieSum < lower {
            point-=1
        } else if calorieSum > upper {
            point+=1
        }
        calorieSum-=calories[index]
        index+=1
    }
    
    return point
}



/*
 1170. 比较字符串最小字母出现频次
 
 我们来定义一个函数 f(s)，其中传入参数 s 是一个非空字符串；该函数的功能是统计 s  中（按字典序比较）最小字母的出现频次。
 
 例如，若 s = "dcce"，那么 f(s) = 2，因为最小的字母是 "c"，它出现了 2 次。
 
 现在，给你两个字符串数组待查表 queries 和词汇表 words，请你返回一个整数数组 answer 作为答案，其中每个 answer[i] 是满足 f(queries[i]) < f(W) 的词的数目，W 是词汇表 words 中的词。
 
   
 
 示例 1：
 
 输入：queries = ["cbd"], words = ["zaaaz"]
 输出：[1]
 解释：查询 f("cbd") = 1，而 f("zaaaz") = 3 所以 f("cbd") < f("zaaaz")。
 示例 2：
 
 输入：queries = ["bbb","cc"], words = ["a","aa","aaa","aaaa"]
 输出：[1,2]
 解释：第一个查询 f("bbb") < f("aaaa")，第二个查询 f("aaa") 和 f("aaaa") 都 > f("cc")。
   
 
 提示：
 
 1 <= queries.length <= 2000
 1 <= words.length <= 2000
 1 <= queries[i].length, words[i].length <= 10
 queries[i][j], words[i][j] 都是小写英文字母
 
 */

func numSmallerByFrequency(_ queries: [String], _ words: [String]) -> [Int] {
    
    func getMin(str: String) -> Int {
        var count = 0
        var min = str.first!.description
        for c in str{
            if c.description < min {
                min = c.description
                count = 0
            }
            
            if c.description == min {
                count+=1
            }
        }
        return count
    }
    
    var wordCount = [Int]()
    for word in words {
        wordCount.append(getMin(str: word))
    }
    
    var arr = Array<Int>.init(repeating: 0, count: queries.count)
    
    var index = 0
    for querie in queries{
        let count = getMin(str: querie)
        var tmp = 0
        
        for wc in wordCount{
            if count < wc {
                tmp+=1
            }
        }
        arr[index] = tmp
        
        index+=1
    }
    return arr
}

