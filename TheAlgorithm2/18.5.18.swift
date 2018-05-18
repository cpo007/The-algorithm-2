//
//  18.5.18.swift
//  TheAlgorithm2
//
//  Created by cpo007@qq.com on 2018/5/18.
//  Copyright © 2018年 cpo007@qq.com. All rights reserved.
//

import Foundation

/*
 637. Average of Levels in Binary Tree
 
 Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array.
 Example 1:
 Input:
 3
 / \
 9  20
 /  \
 15   7
 Output: [3, 14.5, 11]
 Explanation:
 The average value of nodes on level 0 is 3,  on level 1 is 14.5, and on level 2 is 11. Hence return [3, 14.5, 11].
 Note:
 The range of node's value is in the range of 32-bit signed integer.
 
 */


func averageOfLevels(_ root: TreeNode?) -> [Double] {
    
    var dict = [Int: (Int,Int)]()
    test(root: root, dict: &dict, level: 0)
    
    let a = dict.sorted { (a, b) in a.key < b.key }
    var arr = [(Int,Int)]()
    for b in a {
        arr.append(b.value)
    }
    let output = arr.map { (arg0) -> Double in
        return Double(arg0.0) / Double(arg0.1)
    }
    return output
}

func test(root: TreeNode?, dict:inout [Int:(Int,Int)],level: Int) {
    guard let r = root else { return }
    var level = level
    let tuple = dict[level] ?? (0,0)
    dict.updateValue((tuple.0 + r.val,tuple.1 + 1), forKey: level)
    level+=1
    test(root: r.left, dict: &dict, level: level)
    test(root: r.right, dict: &dict, level: level)
    return
}

let a = TreeNode.init(3)
a.left = TreeNode.init(9)
a.right = TreeNode.init(20)
a.right?.left = TreeNode.init(15)
a.right?.right = TreeNode.init(7)

print(averageOfLevels(a))
/*
 824. Goat Latin
 
 A sentence S is given, composed of words separated by spaces. Each word consists of lowercase and uppercase letters only.
 
 We would like to convert the sentence to "Goat Latin" (a made-up language similar to Pig Latin.)
 
 The rules of Goat Latin are as follows:
 
 If a word begins with a vowel (a, e, i, o, or u), append "ma" to the end of the word.
 For example, the word 'apple' becomes 'applema'.
 
 If a word begins with a consonant (i.e. not a vowel), remove the first letter and append it to the end, then add "ma".
 For example, the word "goat" becomes "oatgma".
 
 Add one letter 'a' to the end of each word per its word index in the sentence, starting with 1.
 For example, the first word gets "a" added to the end, the second word gets "aa" added to the end and so on.
 Return the final sentence representing the conversion from S to Goat Latin.
 
 
 
 Example 1:
 
 Input: "I speak Goat Latin"
 Output: "Imaa peaksmaaa oatGmaaaa atinLmaaaaa"
 Example 2:
 
 Input: "The quick brown fox jumped over the lazy dog"
 Output: "heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa"
 
 */


func toGoatLatin(_ S: String) -> String {
    
    let strArr = S.components(separatedBy: " ")
    
    var index = 1
    var output = [String]()
    for str in strArr {
        var str = str
        if "aeiouAEIOU".contains(str.first!) {
            str.append("ma")
            for _ in 0..<index{
                str.append("a")
            }
        } else {
            let c = str.first!
            str.removeFirst()
            str.insert(c, at: str.endIndex)
            str.append("ma")
            for _ in 0..<index{
                str.append("a")
            }
        }
        output.append(str)
        index+=1
    }
    
    var outputString = ""
    for str in output{
        outputString.append(str)
        outputString.append(" ")
    }
    outputString.removeLast()
    return outputString
}



/*
 762. Prime Number of Set Bits in Binary Representation
 
 Given two integers L and R, find the count of numbers in the range [L, R] (inclusive) having a prime number of set bits in their binary representation.
 
 (Recall that the number of set bits an integer has is the number of 1s present when written in binary. For example, 21 written in binary is 10101 which has 3 set bits. Also, 1 is not a prime.)
 
 Example 1:
 
 Input: L = 6, R = 10
 Output: 4
 Explanation:
 6 -> 110 (2 set bits, 2 is prime)
 7 -> 111 (3 set bits, 3 is prime)
 9 -> 1001 (2 set bits , 2 is prime)
 10->1010 (2 set bits , 2 is prime)
 Example 2:
 
 Input: L = 10, R = 15
 Output: 5
 Explanation:
 10 -> 1010 (2 set bits, 2 is prime)
 11 -> 1011 (3 set bits, 3 is prime)
 12 -> 1100 (2 set bits, 2 is prime)
 13 -> 1101 (3 set bits, 3 is prime)
 14 -> 1110 (3 set bits, 3 is prime)
 15 -> 1111 (4 set bits, 4 is not prime)
 */

func countPrimeSetBits(_ L: Int, _ R: Int) -> Int {
    var primeNum = 0
    for i in L...R{
        let num = String(i,radix:2)
        var count = 0
        for n in num {
            if n == "1"{
                count+=1
            }
        }
        
        print(count)
        if count <= 1 { continue }
        var isPrime = true
        
        if count > 2 {
            for j in 2..<count {     //判断item是不是素数
                if count % j == 0 {
                    isPrime = false
                    break
                }
            }
        }
        
        if isPrime {
            print(num)
            primeNum+=1
        }
    }
    return primeNum
}

/*
 496. Next Greater Element I
 
 You are given two arrays (without duplicates) nums1 and nums2 where nums1’s elements are subset of nums2. Find all the next greater numbers for nums1's elements in the corresponding places of nums2.
 
 The Next Greater Number of a number x in nums1 is the first greater number to its right in nums2. If it does not exist, output -1 for this number.
 
 Example 1:
 Input: nums1 = [4,1,2], nums2 = [1,3,4,2].
 Output: [-1,3,-1]
 Explanation:
 For number 4 in the first array, you cannot find the next greater number for it in the second array, so output -1.
 For number 1 in the first array, the next greater number for it in the second array is 3.
 For number 2 in the first array, there is no next greater number for it in the second array, so output -1.
 Example 2:
 Input: nums1 = [2,4], nums2 = [1,2,3,4].
 Output: [3,-1]
 Explanation:
 For number 2 in the first array, the next greater number for it in the second array is 3.
 For number 4 in the first array, there is no next greater number for it in the second array, so output -1.
 Note:
 All elements in nums1 and nums2 are unique.
 The length of both nums1 and nums2 would not exceed 1000.
 */


func nextGreaterElement(_ findNums: [Int], _ nums: [Int]) -> [Int] {
    
    var dict = [Int: Int]()
    var stack = [Int]()
    nums.forEach {
        while (!stack.isEmpty && stack.last ?? 0 < $0) {
            dict[stack.popLast() ?? 0] = $0
        }
        stack.append($0)
    }
    return findNums.map { dict[$0] ?? -1 }
}


