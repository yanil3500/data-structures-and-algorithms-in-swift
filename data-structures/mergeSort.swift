//
//  File.swift
//  dataStructures
//
//  Created by Elyanil Liranzo Castro on 7/17/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

import Foundation

struct MergeSort {
    static func mergesort(collection: [Int]) -> [Int]{
        if collection.count < 2 {
            return collection
        }
        
        var left = [Int]()
        var right = [Int]()
        var mid : Int = collection.count / 2
        
        for i in stride(from: 0, to: mid, by: 1){
            left.append(collection[i])
        }
        for i in stride(from: mid, to: collection.count, by: 1){
            right.append(collection[i])
        }
        
        left = mergesort(collection: left)
        right = mergesort(collection: right)
        func merge(left:[Int], right:[Int]) -> [Int]{
            var collection : [Int] = []
            var i : Int = 0, j : Int = 0
            while i < left.count && j < right.count {
                if left[i] <= right[j]{
                    collection.append(left[i])
                    i += 1
                } else {
                    collection.append(right[j])
                    j += 1
                }
            }
            
            //Check for leftovers
            while i < left.count {
                collection.append(left[i])
                i += 1
            }
            
            while j < right.count {
                collection.append(right[j])
                j += 1
            }
            return collection
        }
        
        return merge(left: left, right: right)
        
    }
    
    static func randomInts(min: Int, max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max - min + 1))) + min
    }

}
