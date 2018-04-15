//
//  HydrateManager.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-13.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation

struct HydrateManager {
    var interval1Total = 0
    var interval1Goal = 1250
    var interval2Total = 0
    var interval2Goal = 1250
    var interval3Total = 0
    var interval3Goal = 1250
    var interval4Total = 0
    var interval4Goal = 1250
    var dailyGoal = 5000
    var currentInterval = 1
    var hoursSinceStart = 0
    var metric = true
    
    var dailyStartTimeHour = 8
    var dailyStartTimeMinute = 0
    
    var lastDayStarted = Date().yesterday
    
    func getCurrentIntervalsTotal() -> Int{
        if currentInterval == 1 {
            return interval1Total
        } else if currentInterval == 2 {
            return interval2Total
        } else if currentInterval == 3 {
            return interval3Total
        } else {
            return interval4Total
        }
    }
    
    func getCurrentIntervalsGoal() -> Int{
        if currentInterval == 1 {
            return interval1Goal
        } else if currentInterval == 2 {
            return interval2Goal
        } else if currentInterval == 3 {
            return interval3Goal
        } else {
            return interval4Goal
        }
    }
    
    func getCurrentInterval() {
//        let currentDate
    }
    
    mutating func addWater(amount: Int) {
        dailyGoal += amount
        if currentInterval == 1 {
            interval1Total += amount
        } else if currentInterval == 2 {
            interval2Total += amount
        } else if currentInterval == 3 {
            interval3Total += amount
        } else {
            interval4Total +=  amount
        }
    }
}
var hydrateManager = HydrateManager()

extension Date {
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return tomorrow.month != month
    }
}
