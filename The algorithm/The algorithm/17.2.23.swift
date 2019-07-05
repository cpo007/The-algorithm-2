//
//  17.2.22.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 17/2/23.
//  Copyright © 2017年 eggplant. All rights reserved.
//

import Foundation

/*
 172. Factorial Trailing Zeroes
 
 Given an integer n, return the number of trailing zeroes in n!.
 
 Note: Your solution should be in logarithmic time complexity.
 
 
 这里我们要求n!末尾有多少个0，因为我们知道0是2和5相乘得到的，而在1到n这个范围内，2的个数要远多于5的个数，所以这里只需计算从1到n这个范围内有多少个5就可以了。
 
 思路已经清楚，下面就是一些具体细节，这个细节还是很重要的。
 
 我在最开始的时候就想错了，直接返回了n / 5，但是看到题目中有要求需要用O(logn)的时间复杂度，就能够想到应该没这么简单。举连个例子：
 
 例1
 
 n=15。那么在15! 中 有3个5(来自其中的5, 10, 15)， 所以计算n/5就可以。
 
 例2
 
 n=25。与例1相同，计算n/5，可以得到5个5，分别来自其中的5, 10, 15, 20, 25，但是在25中其实是包含2个5的，这一点需要注意。
 
 所以除了计算n/5， 还要计算n/5/5, n/5/5/5, n/5/5/5/5, ..., n/5/5/5,,,/5直到商为0，然后就和，就是最后的结果。
 */


func trailingZeroes(_ n: Int) -> Int {
    return n == 0 ? 0 : n / 5 + trailingZeroes(n / 5)
}



/*
 9. Palindrome Number
 
 Determine whether an integer is a palindrome. Do this without extra space.
 
 
 思路：回文数的首位一一对应，那么，将回文数不断取余，除10并将数字添加到另一个数上，因为此数是假定回文数从尾部依次乘加而得，若这个数与假定回文数不相等则这个假定回文数不是回文数，若相等则假定回文数是回文数。
 */



func isPalindrome(_ x: Int) -> Bool {
    if x <= 0 || x % 10 == 0 { return false }
    var num = x
    var rev = 0
    while num >= rev {
        rev = rev * 10 + num % 10
        num = num / 10
    }
    
    return rev == x
}
