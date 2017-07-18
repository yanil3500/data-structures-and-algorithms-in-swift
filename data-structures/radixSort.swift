//
//  radixSort.swift
//  dataStructures
//
//  Created by Elyanil Liranzo Castro on 7/14/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

import Foundation
/*
 func radixSort(nums: inout [Any]){
 var positiveNums = [Int]()
 //Separates the positive elements from the negative elements
 positiveNums = nums.filter({ (num) -> Bool in
 num >= 0
 })
 nums = nums.filter({ (num) -> Bool in
 num < 0
 })
 
 func sort(nums: inout [Int]){
 var isSorted : Bool = false
 var temp : Int = 0; var divisor : Int = 1
 var buckets : [[Int]] = Array(repeating: [Int](), count: 10)
 while !isSorted {
 isSorted = true
 for num in nums {
 temp = num / divisor
 buckets[abs(temp % 10)].append(num)
 if isSorted && temp > 0 {
 isSorted = false
 }
 }
 var index : Int = 0
 for i in 0..<10 {
 for num in buckets[i] {
 nums[index] = num
 index += 1
 }
 buckets[i] = []
 }
 divisor *= 10
 }
 }
 sort(nums: &positiveNums)
 sort(nums: &nums)
 nums.append(contentsOf: positiveNums)
 }
 */


struct collection<Element: Comparable> {
    private var collection : [Element]
    mutating func radixSort(){
        var positive = [Element]()
        
    }
}
