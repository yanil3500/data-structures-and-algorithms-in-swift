//
//  MergeSortTests.swift
//  dataStructures
//
//  Created by Elyanil Liranzo Castro on 7/17/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

import XCTest
import Fakery
@testable import dataStructures
class MergeSortTests: XCTestCase {
    var faker : Faker!
    var nums : [Int]!
    
    override func setUp() {
        super.setUp()
        faker = Faker()
        nums = [Int]()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        faker = nil
        nums = nil
    }
    
    func testMergeSortWith1000Element() {
        for _ in 0...1000 {
            let random : Int = MergeSort.randomInts(min: -10, max: 1234)
            print(random)
            nums.append(random)
        }
        
        self.measure {
            self.nums = MergeSort.mergesort(collection: self.nums)
        }
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
