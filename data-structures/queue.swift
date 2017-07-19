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

class QueueNode<Element>: Node<Element>{
    override init(data: Element) {
        super.init(data: data)
    }
}


class Queue<Element>: CustomStringConvertible {
    var front : QueueNode<Element>?
    var rear : QueueNode<Element>?
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
            front = QueueNode(data: data)
            rear = front
        }
    }
}
