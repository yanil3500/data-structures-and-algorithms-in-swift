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
    
    func addEdge(from source: Element, to destination: Element, weight: Double) throws {
        //Adds vertices to adjacency list
        let sourceV : Vertex<Element> = addVertex(data: source)
        let destinationV : Vertex<Element> = addVertex(data: destination)
        guard let values : arrayOfVertexAndWeight = adjacencyDict[sourceV] else { return }
        for (v, w) in values {
            if v == destinationV && w == weight {
                //If an edge exists between source and destination vertices, no need to add edge and return
                throw GraphError.EdgeAlreadyExists("Edge already exists.")
            }
        }
        adjacencyDict[sourceV]?.append((vertex: destinationV, weight: weight))
    }
    
    func removeEdge(from source: Element, to destination: Element) throws {
        //Remove the edge between the given vertices, if such an edge exists.
        var index : Int = 0
        var edgeDoesExist : Bool = false
        guard let edges : arrayOfVertexAndWeight = adjacencyDict[Vertex(data: source)] else { throw GraphError.VertexDoesNotExist("The vertex does not exist.") }
        for (i, edge) in edges.enumerated() {
            if edge.vertex == Vertex(data: destination) {
                index = i
                edgeDoesExist =  true
                break
            }
        }
        if edgeDoesExist {
            adjacencyDict[Vertex(data: source)]?.remove(at: index)
        } else {
            throw GraphError.EdgeDoesNotExist("There is no such edge between provided vertices.")
        }
    }
}

