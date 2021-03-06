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
    fileprivate var adjacencyDict : [Vertex<Element>: Array<(vertex: Vertex<Element>, weight: Double)>] = [:]
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
        guard let values : Array<(vertex: Vertex<Element>, weight: Double)> = adjacencyDict[sourceV] else { return }
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
        guard let edges : Array<(vertex: Vertex<Element>, weight: Double)> = adjacencyDict[Vertex(data: source)] else { throw GraphError.VertexDoesNotExist("The vertex does not exist.") }
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
    
    func removeVertex(from source: Element) throws {
        //Removes the given vertex from the Graph, as well as edge pointers that reference the given vertex.
        let vertexToRemove : Vertex<Element> = Vertex(data: source)
        if hasVertex(from: source){
            //Remove vertex from keys
            adjacencyDict.removeValue(forKey: vertexToRemove)
            guard let allEdges = edges() else { fatalError() }
            for (aSource, _) in allEdges {
                try? removeEdge(from: aSource.data, to: source)
            }
        } else {
            throw GraphError.VertexDoesNotExist("The vertex does not exist.")
        }
        
    }
    
    func vertices() throws -> Array<Vertex<Element>> {
        if !self.isEmpty {
            let allVertices : Array<Vertex<Element>> = Array(adjacencyDict.keys)
            return allVertices
        } else {
            throw GraphError.EmptyGraph("The graph is empty.")
        }
    }
    
    func edges() -> Array<(source: Vertex<Element>, edges:Array<Any>)>? {
        if !self.isEmpty {
            do {
                var allEdges = Array<(source: Vertex<Element>, edges:Array<Any>)>()
                let sourceVertices = try vertices()
                for source in sourceVertices {
                    guard let edges = adjacencyDict[source] else { return nil }
                    allEdges.append((source, edges))
                }
                return allEdges
                
            } catch (let error) {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func hasVertex(from source: Element) -> Bool {
        //Checks the graph to see if it contains the given vertex.
        return adjacencyDict.keys.contains(Vertex(data: source))
    }
    
    func neighbors(from source: Element) throws -> Array<Vertex<Element>> {
        //Returns all the vertices connected to the given vertex.
        let sourceVertex : Vertex<Element> = Vertex(data: source)
        if self.hasVertex(from: source){
            var allNeighbors = Array<Vertex<Element>>()
            for (neighbor, _) in adjacencyDict[sourceVertex]!{
                allNeighbors.append(neighbor)
            }
            return allNeighbors
        }
        throw GraphError.VertexDoesNotExist("The vertex does not exist.")
    }
    
    func isAdjacent(from source: Element, to destination: Element) -> Bool {
        //Return true if edge exists between the given vertices.
        if hasVertex(from: source) && hasVertex(from: destination) {
            for (vertex, _) in adjacencyDict[Vertex(data: source)]! {
                if destination == vertex.data {
                    return true
                }
            }
            return false
        }
        return false
    }
}

