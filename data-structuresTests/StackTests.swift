//
//  StackTests.swift
//  data-structures
//
//  Created by Elyanil Liranzo Castro on 7/11/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

import XCTest
import Fakery

@testable import dataStructures
class StackTests: XCTestCase {
    var emptyTestStringStack : Stack<String>!
    var emptyTestIntStack : Stack<Int>!
    var emptyTestDoubleStack : Stack<Double>!
    override func setUp() {
        super.setUp()
        emptyTestIntStack = Stack<Int>()
        emptyTestStringStack = Stack<String>()
        emptyTestDoubleStack = Stack<Double>()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        print("The tearDown called")
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        emptyTestIntStack = nil
        emptyTestStringStack = nil
        emptyTestDoubleStack = nil
    }
    
    func testStringStackEmptyStackPeekThrowsError(){
        //This function asserts that this method will throw an error if attempting to peek into an empty stack.
        XCTAssertThrowsError(try emptyTestStringStack.peek())
    }
    
    func testIntStackPeekEmptyStackPeekThrowsError(){
        //This function asserts that this method will throw an error if attempting to peek into an empty stack.
        XCTAssertThrowsError(try emptyTestIntStack.peek())
    }
    
    func testDoubleStackPeekEmptyStackPeekThrowsError(){
        //This function asserts that this method will throw an error if attempting to peek into an empty stack.
        XCTAssertThrowsError(try emptyTestDoubleStack.peek())
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
