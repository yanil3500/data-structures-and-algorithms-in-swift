//
//  BinarySearchTreeTests.swift
//  dataStructures
//
//  Created by Elyanil Liranzo Castro on 7/20/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

import XCTest
@testable import dataStructures
class BinarySearchTreeTests: XCTestCase {
    var testBST : BST<Double>!
    var testCasesForInsert : [([Double], Int)]!
    override func setUp() {
        super.setUp()
        testBST = BST<Double>()
        testCasesForInsert = [
            ([1, 6, 7,3, 1000, -1, -10, 4],8),
            ([45, 67, 1, 2, 3, 4, 6, -9, 1, 21, -123, 234, 11212, -19],14),
            ([7, -10, 35.6],3),
            ([1.2],1),
            ([56, 23.32, 23.1, 23.3455, 1294.13, -1],6)
        ]
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        testBST = nil
    }
    
    func testInsert() {
        for (elements, result) in testCasesForInsert {
            testBST = BST(collection: elements)
            XCTAssert(testBST.length == result)
        }
    }
    
    func testIsEmpty(){
        //Assert that isEmpty will return true
        XCTAssertTrue(testBST.isEmpty)
        testBST.insert(data: 8.9)
        //Assert that isEmpty will return false as a result of having inserted a single element.
        XCTAssertFalse(testBST.isEmpty)
    }
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
