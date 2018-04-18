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
    var extraIntervalTotal = 0
    
    
    var dailyGoal = 5000
    var currentInterval = 1 //: Int {
    //    return getCurrentInterval(dateToCheck: Date())
    //}
    var hoursSinceStart = 0
    var metric = true
    
//    var dailyStartTimeHour = 8
//    var dailyStartTimeMinute = 0
    
    var lastDayStarted = Date().twoDaysAgo
    
    mutating func zeroOutHydrationManager() {
        interval4Total = 0
        interval3Total = 0
        interval2Total = 0
        interval1Total = 0
        extraIntervalTotal = 0
    }
    
    mutating func getCurrentIntervalsTotal() -> Int{
//        currentInterval = getCurrentInterval(dateToCheck: Date())
        if currentInterval == 1 {
            return interval1Total
        } else if currentInterval == 2 {
            return interval2Total
        } else if currentInterval == 3 {
            return interval3Total
        } else if currentInterval == 4{
            return interval4Total
        } else {
            return extraIntervalTotal 
        }
        
    }
    
    mutating func getCurrentIntervalsGoal() -> Int{
//        currentInterval = getCurrentInterval(dateToCheck: Date())
        if currentInterval == 1 {
            return interval1Goal
        } else if currentInterval == 2 {
            return interval2Goal
        } else if currentInterval == 3 {
            return interval3Goal
        } else if currentInterval == 4 {
            return interval4Goal
        } else {
            return 1000
        }
        
    }
    
    func getCurrentInterval(dateToCheck: Date) -> Int {
        let date = hydrateManager.lastDayStarted
        print(date)
        
        if  dateToCheck <  date.addingTimeInterval(10800) {
            print("Current Interval: 1")
            return 1
        } else if dateToCheck < date.addingTimeInterval(21600) {
            print("Current Interval: 2")
            return 2
        } else if dateToCheck < date.addingTimeInterval(32400) {
            print("Current Interval: 3")
            return 3
        } else if dateToCheck < date.addingTimeInterval(43200) {
            print("Current Interval: 4")
            return 4
        }
        print("Current Interval: 5")
        return 5
    
    }
    
    func getDaysTotal() -> Int {
        return interval1Total + interval2Total + interval3Total + interval4Total + extraIntervalTotal
    }
    
    mutating func addWater(amount: Int) {
//        dailyTotal += amount
//         currentInterval = getCurrentInterval(dateToCheck: Date())
        if currentInterval == 1 {
            interval1Total += amount
        } else if currentInterval == 2 {
            interval2Total += amount
        } else if currentInterval == 3 {
            interval3Total += amount
        } else if currentInterval == 4{
            interval4Total +=  amount
        } else {
            extraIntervalTotal += amount
        }
    }
    
    func getUnits() -> String{
        if metric {
            return "ml"
        } else {
            return "oz"
        }
    }
    
    func calculateIntervalGoals(dailyGoal: Int) -> Int{
        return (dailyGoal / 4)
        
    }
}
var hydrateManager = HydrateManager()


