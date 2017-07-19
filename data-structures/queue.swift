//
//  queue.swift
//  dataStructures
//
//  Created by Elyanil Liranzo Castro on 7/19/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

import Foundation

enum QueueError: Error {
    case emptyQueue(String)
}

class Queue<Element>: CustomStringConvertible {
    var front : Node<Element>?
    var rear : Node<Element>?
    var length : Int = 0
    var isEmpty : Bool {
        return self.length == 0
    }
    var description: String {
        var current : Node<Element>? = front
        var str : String = "Queue: \n"
        while let currVal : Element = current?.data, current != nil {
            str += "[\(currVal)] -> "
            current = current?.next
        }
        str += "[nil]"
        return str
    }
}

extension Queue{
    func enqueue(data: Element){
        // The enqueue method adds items to our queue.
        if front == nil {
            front = Node(data: data)
            self.length += 1
            rear = front
        } else {
            rear?.next = Node(data: data)
            self.length += 1
            rear = rear?.next
        }
    }
    
    
    func dequeue() throws -> Element? {
        // The dequeue method removes items from the queue in the order in which they were added.
        if self.length == 0{
            throw QueueError.emptyQueue("The Queue is empty.")
        } else {
            if let frontVal : Element = self.front?.data, self.front === self.rear && self.front != nil {
                self.front = nil
                self.rear = nil
                self.length -= 1
                return frontVal
            }
            guard let frontVal : Element = self.front?.data else { return nil }
            self.front = self.front?.next
            self.length -= 1
            return frontVal
        }
    }
    
    func peek() throws -> Element? {
        // The peek method returns the next value in queue; The peek method throws an error is attempting to peek at an empty queue.
        guard let peekVal : Element =  self.front?.data else { throw QueueError.emptyQueue("The Queue is empty")}
        return peekVal
    }
}
