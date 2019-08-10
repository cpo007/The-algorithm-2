//
//  18.5.15.swift
//  TheAlgorithm2
//
//  Created by cpo007@qq.com on 2018/5/15.
//  Copyright © 2018年 cpo007@qq.com. All rights reserved.
//

import Foundation



/*
 561. Array Partition I
 Given an array of 2n integers, your task is to group these integers into n pairs of integer, say (a1, b1), (a2, b2), ..., (an, bn) which makes sum of min(ai, bi) for all i from 1 to n as large as possible.
 
 Example 1:
 Input: [1,4,3,2]
 
 Output: 4
 Explanation: n is 2, and the maximum sum of pairs is 4 = min(1, 2) + min(3, 4).
 Note:
 n is a positive integer, which is in the range of [1, 10000].
 All the integers in the array will be in the range of [-10000, 10000].
 
 */




/*
 728. Self Dividing Numbers
 
 A self-dividing number is a number that is divisible by every digit it contains.
 
 For example, 128 is a self-dividing number because 128 % 1 == 0, 128 % 2 == 0, and 128 % 8 == 0.
 
 Also, a self-dividing number is not allowed to contain the digit zero.
 
 Given a lower and upper number bound, output a list of every possible self dividing number, including the bounds if possible.
 
 Example 1:
 Input:
 left = 1, right = 22
 Output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15, 22]
 Note:
 
 The boundaries of each input argument are 1 <= left <= right <= 10000.
 
 */

func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
    var arr = [Int]()
    for i in left...right{
        if isSelfDividingNumber(num: i) {
            arr.append(i)
        }
    }
    return arr
}

func isSelfDividingNumber(num: Int) -> Bool {
    
    var canRemainder = num
    
    var b = false
    while canRemainder > 0 {
        
        let a = canRemainder % 10
        
        if a == 0 { return false }
        
        if num % a != 0 {
            return false
        }
        b = true
        
        canRemainder = canRemainder / 10
    }
    return b
}

/*
 
 617. Merge Two Binary Trees
 
 Given two binary trees and imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not.
 
 You need to merge them into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of new tree.
 
 Example 1:
 Input:
 Tree 1                     Tree 2
 1                         2
 / \                       / \
 3   2                     1   3
 /                           \   \
 5                             4   7
 Output:
 Merged tree:
 3
 / \
 4   5
 / \   \
 5   4   7
 Note: The merging process must start from the root nodes of both trees.
 */



func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
    
    if t1 == nil { return t2 }
    if t2 == nil { return t1 }
    
    let nodel = mergeTrees(t1?.left, t2?.left)
    let noder = mergeTrees(t1?.right, t2?.right)
    
    t1?.val = t1!.val + t2!.val
    t1?.left = nodel
    t1?.right = noder
    return t1
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
}


/*
 657. Judge Route Circle
 
 Initially, there is a Robot at position (0, 0). Given a sequence of its moves, judge if this robot makes a circle, which means it moves back to the original place.
 
 The move sequence is represented by a string. And each move is represent by a character. The valid robot moves are R (Right), L (Left), U (Up) and D (down). The output should be true or false representing whether the robot makes a circle.
 
 Example 1:
 Input: "UD"
 Output: true
 Example 2:
 Input: "LL"
 Output: false
 */



func judgeCircle(_ moves: String) -> Bool {
    
    var position = (0,0)
    
    for move in moves{
        switch move {
        case "U" :
            position.0+=1
        case "D":
            position.0-=1
        case "L":
            position.1+=1
        case "R":
            position.1-=1
        default:
            break
        }
    }
    return position == (0,0)
}



/*
 804. Unique Morse Code Words
 International Morse Code defines a standard encoding where each letter is mapped to a series of dots and dashes, as follows: "a" maps to ".-", "b" maps to "-...", "c" maps to "-.-.", and so on.
 
 For convenience, the full table for the 26 letters of the English alphabet is given below:
 
 [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
 Now, given a list of words, each word can be written as a concatenation of the Morse code of each letter. For example, "cab" can be written as "-.-.-....-", (which is the concatenation "-.-." + "-..." + ".-"). We'll call such a concatenation, the transformation of a word.
 
 Return the number of different transformations among all words we have.
 
 Example:
 Input: words = ["gin", "zen", "gig", "msg"]
 Output: 2
 Explanation:
 The transformation of each word is:
 "gin" -> "--...-."
 "zen" -> "--...-."
 "gig" -> "--...--."
 "msg" -> "--...--."
 
 There are 2 different transformations, "--...-." and "--...--.".
 
 */

let arr = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]

func uniqueMorseRepresentations(_ words: [String]) -> Int {
    
    var dict = [String:Int]()
    
    for word in words{
        var str = "";
        for ascii in word.unicodeScalars {
            let index = Int(ascii.value - 97)
            str.append(arr[index])
        }
        dict.updateValue((dict[str] ?? 0) + 1, forKey: str)
    }
    return dict.keys.count
}

/*
 832. Flipping an Image
 
 Given a binary matrix A, we want to flip the image horizontally, then invert it, and return the resulting image.
 
 To flip an image horizontally means that each row of the image is reversed.  For example, flipping [1, 1, 0] horizontally results in [0, 1, 1].
 
 To invert an image means that each 0 is replaced by 1, and each 1 is replaced by 0. For example, inverting [0, 1, 1] results in [1, 0, 0].
 
 Example 1:
 
 Input: [[1,1,0],[1,0,1],[0,0,0]]
 Output: [[1,0,0],[0,1,0],[1,1,1]]
 Explanation: First reverse each row: [[0,1,1],[1,0,1],[0,0,0]].
 Then, invert the image: [[1,0,0],[0,1,0],[1,1,1]]
 Example 2:
 
 Input: [[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]
 Output: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]
 Explanation: First reverse each row: [[0,0,1,1],[1,0,0,1],[1,1,1,0],[0,1,0,1]].
 Then invert the image: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]
 */


func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
    
    var reArrs = [[Int]]()
    
    for arr in A {
        let arr2 = arr.reversed()
        let reArr = arr2.map({ (num)in
            num == 0 ? 1 : 0
        })
        reArrs.append(reArr)
    }
    
    return reArrs
}


/*
 771. Jewels and Stones
 
 You're given strings J representing the types of stones that are jewels, and S representing the stones you have.  Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.
 
 The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".
 
 Example 1:
 
 Input: J = "aA", S = "aAAbbbb"
 Output: 3
 Example 2:
 
 Input: J = "z", S = "ZZ"
 Output: 0
 */



func numJewelsInStones(_ J: String, _ S: String) -> Int {
    
    var count = 0
    for c in S {
        if J.contains(c){
            count+=1
        }
    }
    return count
}

