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
    var faker : Faker!
    var emptyTestStringStack : Stack<String>!
    var emptyTestIntStack : Stack<Int>!
    var emptyTestDoubleStack : Stack<Double>!
    
    var testStringStack : Stack<String>!
    var testIntStack : Stack<Int>!
    var testDoubleStack : Stack<Double>!
    override func setUp() {
        super.setUp()
        faker = Faker()
        emptyTestIntStack = Stack<Int>()
        emptyTestStringStack = Stack<String>()
        emptyTestDoubleStack = Stack<Double>()
        
        testStringStack = Stack<String>()
        testIntStack = Stack<Int>()
        testDoubleStack = Stack<Double>()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        emptyTestIntStack = nil
        emptyTestStringStack = nil
        emptyTestDoubleStack = nil
    }
    
    func testStringStackPush(){
        let random : Int = faker.number.randomInt(min: 24, max: 301)
        for _ in 1...random {
            testStringStack.push(data: faker.address.city())
        }
        
        XCTAssert(testStringStack.size() == random)
        let randomRemove : Int = faker.number.randomInt(min: 2, max: 23)
        for _ in 1...randomRemove{
            do {
                try testStringStack.pop()
            } catch {
                print(error.localizedDescription)
            }
        }
        XCTAssert(testStringStack.size() == random - randomRemove)
    }
    
    func testIntStackPush(){
        let random : Int = faker.number.randomInt(min: 24, max: 301)
        for _ in 1...random {
            testIntStack.push(data: faker.number.randomInt())
        }
        
        let randomRemove : Int = faker.number.randomInt(min: 2, max: 23)
        XCTAssert(testIntStack.size() == random)
        for _ in 1...randomRemove{
            do {
                try testIntStack.pop()
            } catch {
                print(error.localizedDescription)
            }
        }
        XCTAssert(testIntStack.size() == random - randomRemove, "Stack Size: \(testIntStack.size())")
    }
    
    func testDoubleStackPush(){
        let random : Int = faker.number.randomInt(min: 24, max: 301)
        for _ in 1...random {
            testDoubleStack.push(data: faker.number.randomDouble())
        }
        
        XCTAssert(testDoubleStack.size() == random)
        let randomRemove : Int = faker.number.randomInt(min: 2, max: 23)
        for _ in 1...randomRemove{
            do {
                try testDoubleStack.pop()
            } catch {
                print(error.localizedDescription)
            }
        }
        XCTAssert(testDoubleStack.size() == random - randomRemove)
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
    
    func testStringStackEmptyStackPopThrowsError(){
        //This function asserts that this method will throw an error if attempting to pop from an empty stack.
        XCTAssertThrowsError(try emptyTestStringStack.pop())
    }
    
    func testIntStackPeekEmptyStackPopThrowsError(){
        //This function asserts that this method will throw an error if attempting to pop from an empty stack.
        XCTAssertThrowsError(try emptyTestIntStack.pop())
    }
    
    func testDoubleStackPeekEmptyStackPopThrowsError(){
        //This function asserts that this method will throw an error if attempting to pop from an empty stack.
        XCTAssertThrowsError(try emptyTestDoubleStack.pop())
    }
    
    func testStringStackPeek(){
        //This function assert that this method returns the last item that was pushed onto the stack.
        let random : Int = faker.number.randomInt(min: 24, max: 301)
        var lastItem : String = ""
        for _ in 1...random {
            lastItem = faker.address.city()
            testStringStack.push(data: lastItem)
        }
        
        XCTAssert(try testStringStack.peek() == lastItem)
        
    }
    
    func testIntStackPeek(){
        //This function assert that this method returns the last item that was pushed onto the stack.
        let random : Int = faker.number.randomInt(min: 1, max: 301)
        var lastItem : Int = 0
        for _ in 1...random{
            lastItem = faker.number.randomInt()
            testIntStack.push(data: lastItem)
        }
        XCTAssert(try testIntStack.peek() == lastItem)
    }
    
    func testDoubleStackPeek(){
        //This function assert that this method returns the last item that was pushed onto the stack.
        let random : Int = faker.number.randomInt(min: 1, max: 306)
        var lastItem : Double = 0
        for _ in 1...random{
            lastItem = faker.number.randomDouble()
            testDoubleStack.push(data: lastItem)
        }
        XCTAssert(try testDoubleStack.peek() == lastItem)
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
