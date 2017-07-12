//
//  bubbleSort.swift
//  dataStructures
//
//  Created by Elyanil Liranzo Castro on 7/11/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

import Foundation

struct BubbleSort<Element>{
    /*
     Bubble sort is a comparison based, stable, sorting algorithm.
     */
    static func sort<Element: Comparable>(items: [Element]) -> [Element] {
        var sort : [Element] = items
        for i in stride(from: 0, to: items.count, by: 1){
            var didSwap : Bool = false
            for j in  stride(from: 1, to: items.count, by: 1){
                if sort[i] < sort[j]{
                    let temp : Element = sort[j]
                    sort[j] = sort[i]
                    sort[i] = temp
                    didSwap = true
                }
            }
            if !didSwap{
                break
            }
        }
        return sort
    }
    static func sort(string: String) -> String {
        var characters : [Character] = Array(string.characters)
        for i in stride(from: 0, to: characters.count, by: 1){
            var didSwap : Bool = false
            for j in  stride(from: 1, to: characters.count, by: 1){
                if characters[i] < characters[j]{
                    let temp : Character = characters[j]
                    characters[j] = characters[i]
                    characters[i] = temp
                    didSwap = true
                }
            }
            if !didSwap{
                break
            }
        }
        return String(characters)
    }
}
