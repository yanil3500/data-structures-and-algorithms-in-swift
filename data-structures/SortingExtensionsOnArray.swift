//
//  SortingExtensionsOnArray.swift
//  dataStructures
//
//  Created by Elyanil Liranzo Castro on 7/12/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    /*
     Bubble sort is a sorting algorithm that repeatedly steps through a given collection,
     comparing each pair of adjacent elements and swapping them if they are in the wrong order.
     The pass through the collection is repeated until no swaps are needed, resulting in the sorted 
     collection.
     */
    mutating func bubbleSort(){
        //Bubble sort that mutates the existing collection in place.
        guard !isEmpty else { return }
        for i in stride(from: 0, to: self.count, by: 1){
            var didSwap : Bool = false
            for j in stride (from: 1, to: self.count, by: 1){
                if self[i] < self[j]{
                    swap(&self[i], &self[j])
                    didSwap = true
                }
            }
            guard !didSwap else { return }
        }
    }
}
