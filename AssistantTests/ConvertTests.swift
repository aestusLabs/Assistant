//
//  ConvertTests.swift
//  AssistantTests
//
//  Created by Ian Kohlert on 2018-04-26.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import XCTest
@testable import Assistant

class ConvertTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testKgToLbsConversion() {
//     let convert = Convert()
//        XCTAssertEqual(convert.kgToLbs(kg: 90), 198.0)
//        XCTAssertEqual(convert.kgToLbs(kg: 32), 70.4)
//
//
//
//    }

    func testConvertingStringToLbs() {
        XCTAssertEqual(myConvert.stringToWeightInPounds(string: "110lbs"), 110)
        XCTAssertEqual(myConvert.stringToWeightInPounds(string: "100 lbs"), 100)
        
        XCTAssertEqual(myConvert.stringToWeightInPounds(string: "110kg"), 242.0, accuracy: 0.2, "")
  
        XCTAssertEqual(myConvert.stringToWeightInPounds(string: "110 kgs"), 242.0, accuracy: 0.2, "")

    }
    
  
}
