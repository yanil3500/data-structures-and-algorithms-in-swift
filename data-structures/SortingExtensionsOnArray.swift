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
    mutating func bubbleSort(){
        //Bubble sort that returns a sorted collection.
        guard !self.isEmpty else { return  }
        for i in stride(from: 0, to: self.count, by: 1){
            var didSwap : Bool = false
            for j in stride (from: i + 1, to: self.count, by: 1){
                if self[j] < self[i]{
                    swap(&self[j], &self[i])
                    didSwap = true
                }
            }
            guard didSwap else { break }
        }
    }
}


extension Array where Iterator.Element: Comparable {
    /*
     Selection sort is an in-place comparison-based sorting algorithm.
     Selection sort runs in O(n^2), making it inefficient on a large collection of elements.
     Selection sort does have some performance advantages over more complicated sorts in certain situations, particularly
     where external memory is limited.
     The sort divides the input collection into two parts: the subcollection of items already sorted, built from left to
     right at the front of the collection, and, the subcollection of items remaining to be sorted that occupy the rest of
     the list.
     Algorithms proceeds by finding the smallest element in the unsorted subcollection, exchanging it with the leftmost
     unsorted element (putting it in sorted order) and moving the sublist boundaries one element to the right.
     */
    mutating func selectionSort(){
        for i in stride(from: 0, to: self.count, by: 1){
            //Assumes the first element is the smallest.
            var minIndex : Int = i
            for j in stride(from: i + 1, to: self.count, by: 1){
                //Tests against elements after j to find the smallest element.
                if self[j] < self[minIndex]{
                    minIndex = j
                }
            }
            //swap teh value of the index number with new min
            if minIndex != i {
                swap(&self[i], &self[minIndex])
            }
        }
    }
}









