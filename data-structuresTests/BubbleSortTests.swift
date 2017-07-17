//
//  BubbleSortTests.swift
//  dataStructures
//
//  Created by Elyanil Liranzo Castro on 7/12/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

import XCTest
import Fakery

@testable import dataStructures
class BubbleSortTests: XCTestCase {
    var faker: Faker!
    var testInts : [Int]!
    
    override func setUp() {
        super.setUp()
        testInts = [Int]()
        faker = Faker()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        testInts = nil
    }
    
    func testIntsArraySortingAMillionInt(){
        self.measure{
            //Testing bubbleSort with 10000 elements.
            for _ in 1...1000{
                self.testInts.append(self.faker.number.randomInt())
            }
            self.testInts.bubbleSort()  
        }
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        
        self.measure {
            // Put the code you want to measure the time of here.

        }
    }
    
}
