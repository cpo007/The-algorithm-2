//
//  main.swift
//  The algorithm
//
//  Created by cpo007@qq.com on 16/12/16.
//  Copyright © 2016年 eggplant. All rights reserved.
//

import Foundation


/*
 1041. 困于环中的机器人
 
 在无限的平面上，机器人最初位于 (0, 0) 处，面朝北方。机器人可以接受下列三条指令之一：
 
 "G"：直走 1 个单位
 "L"：左转 90 度
 "R"：右转 90 度
 机器人按顺序执行指令 instructions，并一直重复它们。
 
 只有在平面中存在环使得机器人永远无法离开时，返回 true。否则，返回 false。
 
 示例 1：
 
 输入："GGLLGG"
 输出：true
 解释：
 机器人从 (0,0) 移动到 (0,2)，转 180 度，然后回到 (0,0)。
 重复这些指令，机器人将保持在以原点为中心，2 为半径的环中进行移动。
 示例 2：
 
 输入："GG"
 输出：false
 解释：
 机器人无限向北移动。
 示例 3：
 
 输入："GL"
 输出：true
 解释：
 机器人按 (0, 0) -> (0, 1) -> (-1, 1) -> (-1, 0) -> (0, 0) -> ... 进行移动。
   
 
 提示：
 
 1 <= instructions.length <= 100
 instructions[i] 在 {'G', 'L', 'R'} 中

 */

func isRobotBounded(_ instructions: String) -> Bool {
    
    var direction = 0
    var x = 0
    var y = 0
    
    for c in instructions {
        
        switch c {
        case "L" :
            direction-=1
            break
        case "R" :
            direction+=1
            break
        case "G" :
            direction = direction % 4
            print(direction)
            if direction == 0 {
                y+=1
            } else if direction == 1 {
                x+=1
            } else if direction == 2 {
                y-=1
            } else {
                x-=1
            }
        default :
            break
        }
    }
//    print(x)
//    print(y)
    return (direction % 4 != 0) || (x == 0 && y == 0)
}
print(isRobotBounded("GLRLLGLL"))
/*
 553. 最优除法
 
 给定一组正整数，相邻的整数之间将会进行浮点除法操作。例如， [2,3,4] -> 2 / 3 / 4 。
 
 但是，你可以在任意位置添加任意数目的括号，来改变算数的优先级。你需要找出怎么添加括号，才能得到最大的结果，并且返回相应的字符串格式的表达式。你的表达式不应该含有冗余的括号。
 

 示例：
 
 输入: [1000,100,10,2]
 输出: "1000/(100/10/2)"
 解释:
 1000/(100/10/2) = 1000/((100/10)/2) = 200
 但是，以下加粗的括号 "1000/((100/10)/2)" 是冗余的，
 因为他们并不影响操作的优先级，所以你需要返回 "1000/(100/10/2)"。
 
 其他用例:
 1000/(100/10)/2 = 50
 1000/(100/(10/2)) = 50
 1000/100/10/2 = 0.5
 1000/100/(10/2) = 2
 说明:
 
 输入数组的长度在 [1, 10] 之间。
 数组中每个元素的大小都在 [2, 1000] 之间。
 每个测试用例只有一个最优除法解。
 
 */


//第一个是分子  后面的都是分母，分母尽可能小
func optimalDivision(_ nums: [Int]) -> String {
    if nums.count == 0 {
        return ""
    } else if nums.count == 1 {
        return "\(nums[0])"
    } else if nums.count == 2 {
        return "\(nums[0])/\(nums[1])"
    }
    
    var outputStr = "\(nums[0])" + "/("
    for i in 1..<(nums.count - 1){
        outputStr = outputStr + "\(nums[i])" + "/"
    }
    outputStr = outputStr + "\(nums[nums.count - 1])" + ")"
    return outputStr
}


/*
 848. 字母移位
 
 有一个由小写字母组成的字符串 S，和一个整数数组 shifts。
 
 我们将字母表中的下一个字母称为原字母的 移位（由于字母表是环绕的， 'z' 将会变成 'a'）。
 
 例如·，shift('a') = 'b'， shift('t') = 'u',， 以及 shift('z') = 'a'。
 
 对于每个 shifts[i] = x ， 我们会将 S 中的前 i+1 个字母移位 x 次。
 
 返回将所有这些移位都应用到 S 后最终得到的字符串。
 
 示例：
 
 输入：S = "abc", shifts = [3,5,9]
 输出："rpl"
 解释：
 我们以 "abc" 开始。
 将 S 中的第 1 个字母移位 3 次后，我们得到 "dbc"。
 再将 S 中的前 2 个字母移位 5 次后，我们得到 "igc"。
 最后将 S 中的这 3 个字母移位 9 次后，我们得到答案 "rpl"。
 提示：
 
 1 <= S.length = shifts.length <= 20000
 0 <= shifts[i] <= 10 ^ 9
 

 */


func shiftingLetters(_ S: String, _ shifts: [Int]) -> String {
    
    let cArr = S.map { (char) -> Character in
        return char
    }
    
    var arr = Array<Int>.init(repeating: 0, count: shifts.count)
    
    var addValue = 0
    for (i,value) in shifts.enumerated().reversed(){
        addValue+=value
        arr[i] = addValue % 26
    }
    
    var outputStr = ""
    for (i,value) in arr.enumerated(){
        if let asciiValue = cArr[i].unicodeScalars.first?.value {
            var newValue = asciiValue + UInt32(value)
            if newValue > 122 {
                newValue = newValue - 26
            }
            outputStr.append(Character.init(UnicodeScalar(newValue)!))
        }
    }

    
    return outputStr
}

