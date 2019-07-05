//
//  17.11.28.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 2017/11/28.
//  Copyright © 2017年 eggplant. All rights reserved.
//

import Foundation

/*
 661. Image Smoother
 Given a 2D integer matrix M representing the gray scale of an image, you need to design a smoother to make the gray scale of each cell becomes the average gray scale (rounding down) of all the 8 surrounding cells and itself. If a cell has less than 8 surrounding cells, then use as many as you can.
 
 Example 1:
 Input:
 [[1,1,1],
 [1,0,1],
 [1,1,1]]
 Output:
 [[0, 0, 0],
 [0, 0, 0],
 [0, 0, 0]]
 Explanation:
 For the point (0,0), (0,2), (2,0), (2,2): floor(3/4) = floor(0.75) = 0
 For the point (0,1), (1,0), (1,2), (2,1): floor(5/6) = floor(0.83333333) = 0
 For the point (1,1): floor(8/9) = floor(0.88888889) = 0
 Note:
 The value in the given matrix is in the range of [0, 255].
 The length and width of the given matrix are in the range of [1, 150].
 
 */


func getSum(indexPath:(Int,Int), array:[[Int]]) -> [(Int,Int)] {
    var indexPathArray = [(Int,Int)]()
    let array = [-1,0,1]
    for i in 0..<9{
        let a = i % 3
        let b = i / 3
        if indexPath.0 + array[a] >= 0 && indexPath.0 + array[a] < array.count && indexPath.1 + array[b] >= 0 && indexPath.1 + array[b] < array.count {
            indexPathArray.append((indexPath.0 + array[a],indexPath.1 + array[b]))
        }
    }
    return indexPathArray
}



func imageSmoother(_ M: [[Int]]) -> [[Int]] {
    var array = M
    for i in 0..<M.count{
        for j in 0..<M[i].count{
            let arr = getSum(indexPath: (i, j), array: M)
            if arr.count > 0 {
                var sum = 0
                for index in arr {
                    sum+=M[index.0][index.1]
                }
                array[i][j] = sum / arr.count
            }
        }
    }
    return array
}


/*
 506. Relative Ranks
 
 
 Given scores of N athletes, find their relative ranks and the people with the top three highest scores, who will be awarded medals: "Gold Medal", "Silver Medal" and "Bronze Medal".
 
 Example 1:
 Input: [5, 4, 3, 2, 1]
 Output: ["Gold Medal", "Silver Medal", "Bronze Medal", "4", "5"]
 Explanation: The first three athletes got the top three highest scores, so they got "Gold Medal", "Silver Medal" and "Bronze Medal".
 For the left two athletes, you just need to output their relative ranks according to their scores.
 Note:
 N is a positive integer and won't exceed 10,000.
 All the scores of athletes are guaranteed to be unique
 
 */



func findRelativeRanks(_ nums: [Int]) -> [String] {
    
    var array = [(Int,Int)]()
    
    for i in 0..<nums.count{
        let num:(Int,Int) = (nums[i],i)
        array.append(num)
    }
    array.sort { return $0.0 > $1.0 }
    var result = [String].init(repeating: "", count: nums.count)
    for i in 0..<nums.count{
        if i == 0 {
            result[array[i].1] = "Gold Medal"
        } else if i == 1 {
            result[array[i].1] = "Silver Medal"
        } else if i == 2 {
            result[array[i].1] = "Bronze Medal"
        } else {
            result[array[i].1] = "\(i)"
        }
    }
    return result
}

/*
 599. Minimum Index Sum of Two Lists
 
 Suppose Andy and Doris want to choose a restaurant for dinner, and they both have a list of favorite restaurants represented by strings.
 
 You need to help them find out their common interest with the least list index sum. If there is a choice tie between answers, output all of them with no order requirement. You could assume there always exists an answer.
 
 Example 1:
 Input:
 ["Shogun", "Tapioca Express", "Burger King", "KFC"]
 ["Piatti", "The Grill at Torrey Pines", "Hungry Hunter Steakhouse", "Shogun"]
 Output: ["Shogun"]
 Explanation: The only restaurant they both like is "Shogun".
 Example 2:
 Input:
 ["Shogun", "Tapioca Express", "Burger King", "KFC"]
 ["KFC", "Shogun", "Burger King"]
 Output: ["Shogun"]
 Explanation: The restaurant they both like and have the least index sum is "Shogun" with index sum 1 (0+1).
 */


func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
    
    var dict = [String: Int]()
    
    for i in 0..<list1.count{
        dict[list1[i]] = i
    }
    var array = [String]()
    
    var sum = list2.count + list1.count
    for i in 0..<list2.count{
        if let num = dict[list2[i]] {
            if (num + i == sum) {
                array.append(list2[i])
            }
            if (num + i < sum){
                array.removeAll()
                sum = num + i
                array.append(list2[i])
            }
        }
    }
    return array
}
