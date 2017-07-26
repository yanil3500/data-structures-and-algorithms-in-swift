//
//  graph.swift
//  dataStructures
//
//  Created by Elyanil Liranzo Castro on 7/26/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

import Foundation

/* Directed Graph Implementation */
enum GraphError: Error {
    case EmptyGraph(String)
    case EdgeAlreadyExists(String)
    case EdgeDoesNotExist(String)
    case VertexDoesNotExist(String)
}

class Vertex<Element: Hashable>{
    var data : Element
    init(data: Element) {
        self.data = data
    }
}

extension Vertex: Hashable {
    var hashValue : Int {
        return "\(data)".hashValue
    }
    final class func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data == rhs.data
    }
}

extension Vertex: CustomStringConvertible {
    var description: String {
        return "\(data)"
    }
}


class Graph<Element: Hashable>{
    typealias arrayOfVertexAndWeight = Array<(vertex: Vertex<Element>, weight: Double)>
    fileprivate var adjacencyDict : [Vertex<Element>: arrayOfVertexAndWeight] = [:]
}

extension Graph {
    var isEmpty : Bool {
        return adjacencyDict.count == 0
    }
}


extension Graph {
    fileprivate func addVertex(data: Element) -> Vertex<Element>{
        //Create vertex based on the data that is passed in
        let vertex : Vertex<Element> = Vertex(data: data)
        //Check to see if vertex exists, if it doesn't, create an empty array of edges and return the vertex
        if adjacencyDict[vertex] == nil {
           adjacencyDict[vertex] = []
        }
        return vertex
    }
    
    
}

