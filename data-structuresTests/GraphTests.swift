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
    var testCasesForHasVertex : Array<(source: String, destination: String, testVal: String, weight: Double, result: Bool)>!
    override func setUp() {
        super.setUp()
        testGraph = Graph<String>()
        testCasesForHasVertex = [
            (source: "Seattle", destination: "NYC", testVal:"NYC", weight: 1000, result: true),
            (source: "Hong Kong", destination: "Moscow", testVal: "Bangor", weight: 2000 , result: false),
            (source: "Cape Town", destination: "London", testVal: "Budapest", weight: 300 , result: false),
            (source: "San Francisco", destination: "Tokyo", testVal: "Tokyo", weight: 3000, result: true)
        ]
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
    
    func testHasVertex(){
        //This function tests that hasVertex return the expected result when checking if the graph contains the testVal
        for (source, dest, testVal, weight, result) in testCasesForHasVertex {
            try? testGraph.addEdge(from: source, to: dest, weight: weight)
            XCTAssertEqual(testGraph.hasVertex(from: testVal), result)
        }
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
