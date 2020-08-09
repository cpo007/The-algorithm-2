//
//  20.8.9.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2020/8/9.
//  Copyright © 2020 cpo007@qq.com. All rights reserved.
//

import Foundation



/**
 93. 复原IP地址
 
 给定一个只包含数字的字符串，复原它并返回所有可能的 IP 地址格式。

 有效的 IP 地址正好由四个整数（每个整数位于 0 到 255 之间组成），整数之间用 '.' 分隔。

  

 示例:

 输入: "25525511135"
 输出: ["255.255.11.135", "255.255.111.35"]

 */
var ans = [String]()
var segments = [Int].init(repeating: 0, count: 4)

func restoreIpAddresses(_ s: String) -> [String] {
    dfs(s: s, segId: 0, segStart: 0)
    return ans
}

func dfs(s: String, segId: Int, segStart: Int) {
    
    if segId == 4 {
        if segStart == s.count {
            var ipAddr = ""
            for i in 0..<4{
                ipAddr.append("\(segments[i])")
                if i != 3 {
                    ipAddr.append(".")
                }
            }
            ans.append(ipAddr)
        }
        return
    }
    if segStart == s.count {
        return
    }
    if s[segStart] == "0" {
        segments[segId] = 0
        dfs(s: s, segId: segId + 1, segStart: segStart + 1)
    }
    
    var addr = 0
    for i in segStart..<s.count{
        addr = addr * 10 + Int(s[i])!
        if addr > 0 && addr <= 255 {
            segments[segId] = addr
            dfs(s: s, segId: segId + 1, segStart: i + 1)
        } else {
            break
        }
    }

}
