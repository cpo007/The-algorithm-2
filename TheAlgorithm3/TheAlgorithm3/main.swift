//
//  main.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2019/8/10.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

import Foundation


class MinStack {
    
    var arr = [Int]()
    var set = [Int]()
    
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        arr.append(x)
        set.append(x)
    }
    
    func pop() {
        let num = arr.removeLast()
        set.remove(at: num)
        print(set)
    }
    
    func top() -> Int {
        let num = arr.removeLast()
        return num
    }
    
    func getMin() -> Int {
        return set.first!
    }
    
}

//let stack = MinStack.init()
//stack.push(-2)
//stack.push(0)
//stack.push(-3)
//
