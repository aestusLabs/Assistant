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
        XCTAssertEqual(hydrateManager.getCurrentInterval(dateToCheck: Date()), 3)
        XCTAssertEqual(hydrateManager.getCurrentInterval(dateToCheck: datePlus4hours), 4)
        XCTAssertEqual(hydrateManager.getCurrentInterval(dateToCheck: datePlus7hours), 5)
        
        XCTAssert(dately.isDateBeforeDateTwo(date: Date(), dateTwo: datePlus4hours))
        
    }
    
    func testHydrateDrinkReminderChooseNotificationsToRemove() {
        let startDate = Calendar.current.date(bySettingHour: 9, minute: 0, second: 0, of: Date())!
        let mockCurrentDate = Calendar.current.date(byAdding: .hour, value: 4, to: startDate)!

//        XCTAssertEqual(hydrateDrinkReminderNotificationFunctions.seeWhichNotificationsShouldFire(currentDate: mockCurrentDate, startOfDay: startDate), ["firstInterval1HoursElapsed", "firstInterval2HoursElapsed", "firstInterval2AndHalfHoursElapsed", "firstInterval2AndThreeQuarterHoursElapsed","secondInterval1HourElapsed"])
    }
    
    
    func testCompareTotalToIntervals() {
        var mockHydrateManager = HydrateManager()
        mockHydrateManager.interval4Goal = 1000
        mockHydrateManager.interval3Goal = 1000
        mockHydrateManager.interval2Goal = 1000
        mockHydrateManager.interval1Goal = 1000
        
        mockHydrateManager.interval1Total = 2500
        print(mockHydrateManager.getDaysTotal())
        
//        XCTAssertEqual(hydrateDrinkReminderNotificationFunctions.compareTotalToIntervals(manager: mockHydrateManager), [1,2])
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
