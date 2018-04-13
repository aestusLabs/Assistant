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
    var totalForDay = 5000
    var currentInterval = 1
    var hoursSinceStart = 0
    var metric = true
    
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
    
    mutating func addWater(amount: Int) {
        totalForDay += amount
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
