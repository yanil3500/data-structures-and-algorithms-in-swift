//
//  StackTests.swift
//  data-structures
//
//  Created by Elyanil Liranzo Castro on 7/11/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

import XCTest

@testable import dataStructures
class StackTests: XCTestCase {
    var testStringStack : Stack<String>!
    var testIntStack : Stack<Int>!
    var testDoubleStack : Stack<Double>!
    override func setUp() {
        super.setUp()
        testIntStack = Stack<Int>()
        testStringStack = Stack<String>()
        testDoubleStack = Stack<Double>()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        testIntStack = nil
        testStringStack = nil
        testDoubleStack = nil
    }
    
    func testStringStackEmptyStackPeekThrowsError(){
        XCTAssertThrowsError(try testStringStack.peek())
    }
    
    func testIntStackPeekEmptyStackPeekThrowsError(){
        XCTAssertThrowsError(try testIntStack.peek())
    }
    
    func testDoubleStackPeekEmptyStackPeekThrowsError(){
        XCTAssertThrowsError(try testDoubleStack.peek())
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
