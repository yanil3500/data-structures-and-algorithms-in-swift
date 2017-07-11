//
//  stack.swift
//  data-structures
//
//  Created by Elyanil Liranzo Castro on 7/11/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

import Foundation

enum StackError : Error {
    case EmptyStack(String)
}

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
    var isEmpty : Bool {
        return self.length == 0
    }
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
    
    func pop() throws -> Element? {
        /*
         This method removes the last item added to the stack and reassigns a new top item.
         Complexity: O(1) Constant Time
         */
        if self.isEmpty{
            throw StackError.EmptyStack("Cannot remove items from an empty stack.")
        } else {
            guard let removed : Element = self.top?.data else { return nil }
            self.length -= 1
            self.top = self.top?.next
            return removed
        }
    }
    
}
