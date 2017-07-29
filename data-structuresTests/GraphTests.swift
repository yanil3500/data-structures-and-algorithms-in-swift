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
        XCTAssertTrue(testGraph.isEmpty)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
