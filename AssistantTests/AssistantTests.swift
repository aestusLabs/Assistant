//
//  AssistantTests.swift
//  AssistantTests
//
//  Created by Ian Kohlert on 2018-04-11.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import XCTest
@testable import Assistant

class AssistantTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
       XCTAssert(dately.isSecondDateWithin24HoursOfFirstDate(firstDate: Date().noon, secondDate: Date()))
        
        let datePlus4hours = Calendar.current.date(byAdding: .hour, value: 4, to: Date())!
                let datePlus7hours = Calendar.current.date(byAdding: .hour, value: 7, to: Date())!
                let datePlus11hours = Calendar.current.date(byAdding: .hour, value: 7, to: Date())!
        XCTAssertEqual(hydrateManager.getCurrentInterval(dateToCheck: Date()), 1)
        XCTAssertEqual(hydrateManager.getCurrentInterval(dateToCheck: datePlus4hours), 2)
        XCTAssertEqual(hydrateManager.getCurrentInterval(dateToCheck: datePlus7hours), 3)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
