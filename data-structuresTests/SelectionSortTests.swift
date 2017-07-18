//
//  SelectionSortTests.swift
//  dataStructures
//
//  Created by Elyanil Liranzo Castro on 7/13/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

import XCTest
import Fakery
@testable import dataStructures
class SelectionSortTests: XCTestCase {
    var faker : Faker!
    var ints : [Int]!
    var doubles : [Int]!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        faker = Faker()
        ints = []
        doubles = []

    }
    
    func testsSelectionSortWithInts(){
        let random : Int = faker.number.randomInt(min: 24, max: 301)
        var nums = [Int]()
        for i in 1...random{
            nums.append(i)
            ints.append(faker.number.randomInt())
        }
        self.measure {
            self.ints.selectionSort()
        }
        XCTAssertNotEqual(nums, ints)
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        faker = nil
        ints = nil
        doubles = nil
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
