//
//  20.11.swift
//  TheAlgorithm3
//
//  Created by cpo007@qq.com on 2020/11/11.
//  Copyright © 2020 cpo007@qq.com. All rights reserved.
//


/**
  面试题 16.19. 水域大小

 你有一个用于表示一片土地的整数矩阵land，该矩阵中每个点的值代表对应地点的海拔高度。若值为0则表示水域。由垂直、水平或对角连接的水域为池塘。池塘的大小是指相连接的水域的个数。编写一个方法来计算矩阵中所有池塘的大小，返回值需要从小到大排序。

 示例：

 输入：
 [
   [0,2,1,0],
   [0,1,0,1],
   [1,1,0,1],
   [0,1,0,1]
 ]
 输出： [1,2,4]
 提示：

 0 < len(land) <= 1000
 0 < len(land[i]) <= 1000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/pond-sizes-lcci
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */

func pondSizes(_ land: [[Int]]) -> [Int] {
    
    var pools = [(Int,Int)]()
    
    func isNewPool(index: (Int, Int)) -> Bool {
        if index.0 >= 0 && index.0 < land.count && index.1 >= 0 && index.1 < land[0].count {
            let isPool = land[index.0][index.1] == 0
            if isPool {
                let isNewPool = !pools.contains { (indexTmp) -> Bool in
                    return index == indexTmp
                }
                if isNewPool {
                    pools.append(index)
                    return true
                }
                return false
            }
            return false
        }
        return false
    }

    // index.0代表lie，index.1代表行
    func getArr(index: (Int, Int), map: inout [(Int, Int)]){
        map.append(index)
        let a = (index.0, index.1 - 1)
        let b = (index.0, index.1 + 1)
        let c = (index.0 + 1, index.1 - 1)
        let d = (index.0 + 1, index.1)
        let e = (index.0 + 1, index.1 + 1)

        if isNewPool(index: a) {
            getArr(index: a, map: &map)
        }
        if isNewPool(index: b) {
            getArr(index: b, map: &map)
        }
        if isNewPool(index: c) {
            getArr(index: c, map: &map)
        }
        if isNewPool(index: d) {
            getArr(index: d, map: &map)
        }
        if isNewPool(index: e) {
            getArr(index: e, map: &map)
        }
    }

    var row = 0
    var col = 0

    var arr = [Int]()
    for items in land {
        for _ in items {
            // 函数传入节点下标，找下标的左右下五个点的数据
            // 同时传入记录数组记录已被标记的位置
            // 找到下标为0则不断递归深入，直到找不到位置，此时记录的下标数组的count就是该水域大小
            let index = (col, row)
            if isNewPool(index: index) {
                var map = [(Int,Int)]()
                getArr(index: index, map: &map)
                arr.append(map.count)
            }
            row += 1
        }
        row = 0
        col += 1
    }
    return arr.sorted()
}

/**
 面试题 17.10. 主要元素

 数组中占比超过一半的元素称之为主要元素。给定一个整数数组，找到它的主要元素。若没有，返回-1。

 示例 1：

 输入：[1,2,5,9,5,9,5,5,5]
 输出：5
  

 示例 2：

 输入：[3,2]
 输出：-1
  

 示例 3：

 输入：[2,2,1,1,1,2,2]
 输出：2

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-majority-element-lcci
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */

func majorityElement2(_ nums: [Int]) -> Int {
    var map = [Int: Int]()
    for num in nums {
        map[num] = (map[num] ?? 0) + 1
    }

    var max = 0
    var key = 0
    for (k, v) in map {
        if v > max {
            max = v
            key = k
        }
    }
    return max >= (nums.count / 2) ? key : -1
}

func transpose(_ A: [[Int]]) -> [[Int]] {
    let countI = A.count
    let countJ = A[0].count
    var arr = [[Int]].init(repeating: [Int].init(repeating: 0, count: countI), count: countJ)

    for i in 0 ..< A.count {
        for j in 0 ..< A[i].count {
            arr[j][i] = A[i][j]
        }
    }
    return arr
}
