//
//  SortingExtensionsOnArray.swift
//  dataStructures
//
//  Created by Elyanil Liranzo Castro on 7/12/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

import Foundation

extension Array where Iterator.Element: Comparable{
    /*
     Bubble sort is a sorting algorithm that repeatedly steps through a given collection,
     comparing each pair of adjacent elements and swapping them if they are in the wrong order.
     The pass through the collection is repeated until no swaps are needed, resulting in the sorted 
     collection.
     */
    func bubbleSort() -> [Element]?{
        //Bubble sort that returns a sorted collection.
        var arr = self
        guard !arr.isEmpty else { return nil }
        for i in stride(from: 0, to: self.count, by: 1){
            var didSwap : Bool = false
            for j in stride (from: i + 1, to: self.count, by: 1){
                if arr[j] < arr[i]{
                    swap(&arr[j], &arr[i])
                    didSwap = true
                }
            }
            guard didSwap else { break }
        }
        return arr
    }
}
