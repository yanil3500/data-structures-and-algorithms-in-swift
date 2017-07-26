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
