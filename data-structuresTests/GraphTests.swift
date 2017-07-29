//
//  GraphTests.swift
//  dataStructures
//
//  Created by Elyanil Liranzo Castro on 7/28/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

import XCTest
@testable import dataStructures
class GraphTests: XCTestCase {
    var testGraph : Graph<String>!
    override func setUp() {
        testGraph = Graph<String>()
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        testGraph = nil
        super.tearDown()
    }
    
    func testIsEmpty() {
        //Asserts that isEmpty computed property returns true for an empty graph
        XCTAssertTrue(testGraph.isEmpty)
        //Adds elements to the graph and asserts that isEmpty will return false for a graph that contains elements.
        try? testGraph.addEdge(from: "Seattle", to: "New York City", weight: 1000)
        XCTAssertFalse(testGraph.isEmpty)
        
    }
    
    func testAddEdgeThrowsError(){
        //Asserts that the addEdge method will throw an error if an attempt is made to add a pre-existing edge between given vertices.
        try? testGraph.addEdge(from: "Seattle", to: "New York City", weight: 1000)
        
        XCTAssertThrowsError(try testGraph.addEdge(from: "Seattle", to: "New York City", weight: 1000))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
