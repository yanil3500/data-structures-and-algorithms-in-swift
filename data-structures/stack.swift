//
//  stack.swift
//  data-structures
//
//  Created by Elyanil Liranzo Castro on 7/11/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

import Foundation

class Node<Element>{
    /*This will be used as a supporting class for Stack ADT.*/
    var data : Element
    var next : Node?
    init(data: Element){
        self.data = data
    }
}

class Stack<Element>: CustomStringConvertible {
    fileprivate var top : Node<Element>?
    fileprivate var length : Int = 0
    internal var description : String {
        var str : String = "[Stack] -> "
        var curr : Node? = top
        while curr != nil, let val = curr?.data {
            str += "[\(val)] -> "
            curr = curr?.next
        }
        str += "[nil]"
        return str
    }
}

extension Stack {
    func push(data: Element){
        /*
         This method adds a new element to the top of the stack.
         Complexity: O(1) Constant Time
         */
        if self.top == nil {
            self.top = Node(data: data)
            self.length += 1
        } else {
            let newItem : Node = Node(data: data)
            newItem.next = self.top
            self.top = newItem
            self.length += 1
        }
    }
}
