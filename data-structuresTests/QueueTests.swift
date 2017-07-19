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
    var testCasesForDequeue : [([Int], Int)]
    override func setUp() {
        super.setUp()
        testQueue = Queue()
        testCasesForDequeue = [
            ([1, 2, 5, 6, 10, 212, 34, 5, 89], 1),
            ([55, 78, 34, 10, 12, 3212, 343, 53, 893], 55),
            ([100, 3, 5, 6, 7, 2], 100),
            ([7],7)
        ]
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        testQueue = nil
        testCasesForDequeue = nil
    }
    
    func testDequeue(){
        for (elements, result) in testCasesForDequeue {
            testQueue = Queue(elements: elements)
        }
    }
    
}
