//
//  QueueTests.swift
//  dataStructures
//
//  Created by Elyanil Liranzo Castro on 7/19/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

import XCTest
@testable import dataStructures
class QueueTests: XCTestCase {
//    lass MyTest: XCTestCase {
//    func testMultiply() {
//    let cases = [(4,3,12), (2,4,8), (3,5,10), (4,6,20)]
//    cases.forEach {
//    XCTAssertEqual(multiply($0, $1), $2)
//    }
//    
    var testQueue : Queue<Int>!
    var testCasesForDequeue : [([Int], Int)]!
    var testCasesForEnqueue : [([Int], Int)]!
    var testCasesForEnqueueAndDequeueAnXAmountOfTimes : [([Int], Int, Int)]!
    override func setUp() {
        super.setUp()
        testQueue = Queue()
        testCasesForDequeue = [
            ([1, 2, 5, 6, 10, 212, 34, 5, 89], 1),
            ([55, 78, 34, 10, 12, 3212, 343, 53, 893], 55),
            ([100, 3, 5, 6, 7, 2], 100),
            ([7],7)
        ]
        testCasesForEnqueue = [
            ([1, 2, 5, 6, 10, 212, 34, 5, 89, 1000], 10),
            ([55, 78, 34, 10, 12, 3212, 343, 53, 893], 9),
            ([100, 3, 5, 6, 7, 2], 6),
            ([7],1)
        ]
        testCasesForEnqueueAndDequeueAnXAmountOfTimes = [
            ([1, 2, 5, 6, 10, 212, 34, 5, 89, 1000], 3, 7),
            ([55, 78, 34, 10, 12, 3212, 343, 53, 893], 4, 5),
            ([100, 3, 5, 6, 7, 2], 5, 1),
            ([7] ,1, 0)
        ]

    }
    
    override func tearDown() {
        super.tearDown()
        testQueue = nil
        testCasesForDequeue = nil
        testCasesForEnqueue = nil
        testCasesForEnqueueAndDequeueAnXAmountOfTimes = nil
    }
    
    func testDequeue(){
        //The test asserts that the first inserted value is the first one to be dequeued.
        for (elements, result) in testCasesForDequeue {
            testQueue = Queue(elements: elements)
            do {
                guard let dequeuedVal : Int = try testQueue.dequeue() else { return }
                XCTAssertEqual(dequeuedVal, result)
            } catch (let description){
                print(description.localizedDescription)
            }
        }
    }
    
    func testPeek(){
        //The test asserts that the first inserted value is the one returned by the peek method.
        for (elements, result) in testCasesForDequeue {
            testQueue = Queue(elements: elements)
            do {
                guard let peekVal : Int = try testQueue.peek() else { return }
                XCTAssertEqual(peekVal, result)
            } catch (let description) {
                print(description.localizedDescription)
            }
        }
    }
    
    func testPeekThrows(){
        //The test asserts that calling peek on an empty queue will throw an error.
        XCTAssertThrowsError(try testQueue.peek(), "Error was thrown.") { (error) in
            print(error.localizedDescription)
        }
    }
    func testDequeueThrowsError(){
        //The test asserts that calling dequeue on an empty queue will throw an error.
        XCTAssertThrowsError(try testQueue.dequeue(), "Error was thrown.") { (error) in
            print(error.localizedDescription)
        }
    }
    
    func testEnqueue(){
        //The test asserts that number of elements enqueued is properly reflected on the queue's length property
        for (elements, result) in testCasesForEnqueue {
            testQueue = Queue(elements: elements)
            XCTAssert(testQueue.length == result)
        }
    }
    
    func testsLengthPropertyToSeeItsIncrementingAndDecrementingProperly(){
        //The test asserts that the length of the queue is being properly decremented with each removal of an element
        for (elements, numberOfRemovals, result) in testCasesForEnqueueAndDequeueAnXAmountOfTimes {
            testQueue = Queue(elements: elements)
            for _ in 0..<numberOfRemovals {
                do {
                    try testQueue.dequeue()
                } catch (let description) {
                    print(description.localizedDescription)
                }
            }
            XCTAssert(testQueue.length == result)
        }
    }
    
    func testIsEmptyWithElements(){
        //The test asserts that isEmpty will evaluate to false if it contains any elements.
        for (elements, _) in testCasesForEnqueue {
            testQueue = Queue(elements: elements)
            print("elements: \(elements)")
            XCTAssertFalse(testQueue.isEmpty)
        }
    }
    
    func testsIsEmpty(){
        //The test asserts that the isEmpty computed property is in fact working.
        XCTAssert(testQueue.isEmpty == true)
    }
    
}
