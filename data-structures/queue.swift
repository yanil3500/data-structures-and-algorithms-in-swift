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
        return ""
    }
}

extension Queue{
    func enqueue(data: Element){
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
}
