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
    var testCharacters : [Character]!
    var testInts : [Int]!
    var testDouble : [Double]!
    
    override func setUp() {
        super.setUp()
        testCharacters = []
        testInts = []
        testDouble = []
        faker = Faker()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        testCharacters = nil
        testInts = nil
        testDouble = nil
    }
    
    func testCharactersArrayBubbleSort(){
        //Testing bubbleSort with 25 elements
        for _ in 1...25{
            testCharacters.append(Character(faker.lorem.character()))
        }
        print(testCharacters)
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
