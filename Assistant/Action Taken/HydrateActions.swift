//
//  HydrateActions.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-13.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation

struct HydrateActions {
    func addWater(userInput: String) {
        let amountToAdd = myConvert.liquidAmount(userInput: userInput)
        hydrateManager.addWater(amount: amountToAdd)
        print("It wor98y98ked \(hydrateManager.interval1Total)")
        
    }
    
    func setMeasurementUnits(userInput: String) {
        if userInput == "Metric" {
            hydrateManager.metric = true
        } else {
            hydrateManager.metric = false
        }
    }
    
    func setDailyGoal(userInput: String) {
        hydrateManager.dailyGoal =  myConvert.liquidAmount(userInput: userInput) 
    }
    
    func setDailyStartTime(userInput: String) {
        let parsedComponents = timeParser.parseTime(text: userInput)
        if let hour = parsedComponents.hour {
            hydrateManager.dailyStartTimeHour = hour
        }
        if let minutes = parsedComponents.minute {
            hydrateManager.dailyStartTimeMinute = minutes
        }
    }
}
