//
//  18.5.17.swift
//  TheAlgorithm2
//
//  Created by cpo007@qq.com on 2018/5/17.
//  Copyright © 2018年 cpo007@qq.com. All rights reserved.
//

import Foundation


/*
 566. Reshape the Matrix
 
 
 In MATLAB, there is a very useful function called 'reshape', which can reshape a matrix into a new one with different size but keep its original data.
 
 You're given a matrix represented by a two-dimensional array, and two positive integers r and c representing the row number and column number of the wanted reshaped matrix, respectively.
 
 The reshaped matrix need to be filled with all the elements of the original matrix in the same row-traversing order as they were.
 
 If the 'reshape' operation with given parameters is possible and legal, output the new reshaped matrix; Otherwise, output the original matrix.
 
 Example 1:
 Input:
 nums =
 [[1,2],
 [3,4]]
 r = 1, c = 4
 Output:
 [[1,2,3,4]]
 Explanation:
 The row-traversing of nums is [1,2,3,4]. The new reshaped matrix is a 1 * 4 matrix, fill it row by row by using the previous list.
 Example 2:
 Input:
 nums =
 [[1,2],
 [3,4]]
 r = 2, c = 4
 Output:
 [[1,2],
 [3,4]]
 Explanation:
 There is no way to reshape a 2 * 2 matrix to a 2 * 4 matrix. So output the original matrix.
 
 */

func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
    if nums.count * nums[0].count != r * c { return nums }
    var arr = [Int]()
    for num in nums {
        arr+=num
    }
    var output = [[Int]]()
    var temporary = [Int]()
    for i in 0..<arr.count{
        temporary.append(arr[i])
        if (i + 1) % c == 0 {
            output.append(temporary)
            temporary.removeAll()
        }
    }
    return output
}

/*
 766. Toeplitz Matrix
 
 A matrix is Toeplitz if every diagonal from top-left to bottom-right has the same element.
 
 Now given an M x N matrix, return True if and only if the matrix is Toeplitz.
 
 
 Example 1:
 
 Input: matrix = [[1,2,3,4],[5,1,2,3],[9,5,1,2]]
 Output: True
 Explanation:
 1234
 5123
 9512
 
 In the above grid, the diagonals are "[9]", "[5, 5]", "[1, 1, 1]", "[2, 2, 2]", "[3, 3]", "[4]", and in each diagonal all elements are the same, so the answer is True.
 Example 2:
 
 Input: matrix = [[1,2],[2,2]]
 Output: False
 Explanation:
 The diagonal "[1, 2]" has different elements.
 Note:
 
 matrix will be a 2D array of integers.
 matrix will have a number of rows and columns in range [1, 20].
 matrix[i][j] will be integers in range [0, 99].
 */


func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
    
    
    var dict = [Int: [Int]]()
    
    for i in 0..<matrix.count{
        for j in 0..<matrix[i].count{
            var arr = dict[i - j] ?? [Int]()
            arr.append(matrix[i][j])
            dict.updateValue(arr, forKey: i - j)
        }
    }
    print(dict)
    
    for (_,v) in dict{
        print(Set(v))
        if Set(v).count > 2 {
            return false
        }
    }
    return true
}


/*
 669. Trim a Binary Search Tree
 Given a binary search tree and the lowest and highest boundaries as L and R, trim the tree so that all its elements lies in [L, R] (R >= L). You might need to change the root of the tree, so the result should return the new root of the trimmed binary search tree.
 
 Example 1:
 Input:
 1
 / \
 0   2
 
 L = 1
 R = 2
 
 Output:
 1
 \
 2
 Example 2:
 Input:
 3
 / \
 0   4
 \
 2
 /
 1
 
 L = 1
 R = 3
 
 Output:
 3
 /
 2
 /
 1
 
 */


func trimBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> TreeNode? {
    guard let r = root else { return root }
    
    if r.val < L {
        return trimBST(r.right, L, R)
    }
    if r.val > R {
        return trimBST(r.left, L, R)
    }
    
    r.left = trimBST(r.left, L, R)
    r.right = trimBST(r.right, L, R)
    return r
}

/*
 575. Distribute Candies
 
 Given an integer array with even length, where different numbers in this array represent different kinds of candies. Each number means one candy of the corresponding kind. You need to distribute these candies equally in number to brother and sister. Return the maximum number of kinds of candies the sister could gain.
 Example 1:
 Input: candies = [1,1,2,2,3,3]
 Output: 3
 Explanation:
 There are three different kinds of candies (1, 2 and 3), and two candies for each kind.
 Optimal distribution: The sister has candies [1,2,3] and the brother has candies [1,2,3], too.
 The sister has three different kinds of candies.
 Example 2:
 Input: candies = [1,1,2,3]
 Output: 2
 Explanation: For example, the sister has candies [2,3] and the brother has candies [1,1].
 The sister has two different kinds of candies, the brother has only one kind of candies.
 Note:
 
 The length of the given array is in range [2, 10,000], and will be even.
 The number in given array is in range [-100,000, 100,000].
 */


func distributeCandies(_ candies: [Int]) -> Int {
    return min(candies.count / 2, Set(candies).count)
}

