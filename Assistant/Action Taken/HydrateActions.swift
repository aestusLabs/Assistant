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
        hydrateDrinkReminderNotificationFunctions.cancelUneededHydrateDrinkReminders()

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
        let defaults = UserDefaults.standard
        defaults.setValue(hydrateManager.dailyGoal, forKey: "hydrateDailyGoal")
    }
    
    func setDailyStartTime(userInput: String) {
        let currentDateYear = Calendar.current.component(.year, from: Date())
        let currentDateMonth = Calendar.current.component(.month, from: Date())
        let currentDateDay = Calendar.current.component(.day, from: Date())
        let currentDateHour = Calendar.current.component(.hour, from: Date())
        let currentDateMinute = Calendar.current.component(.minute, from: Date())
        let parsedComponents = timeParser.parseTime(text: userInput)
        
        
        
        var components = DateComponents()
        components.year = currentDateYear
        components.month = currentDateMonth
        components.day = currentDateDay
        components.hour = parsedComponents.hour
        components.minute = parsedComponents.minute
        if userInput == "Start Now" {
            components.hour = currentDateHour
            components.minute = currentDateMinute
        }
        
        let newStartDate = Calendar.current.date(from: components)
//        if let hour = parsedComponents.hour {
//            hydrateManager.dailyStartTimeHour = hour
//        }
//        if let minutes = parsedComponents.minute {
//            hydrateManager.dailyStartTimeMinute = minutes
//        }
        hydrateManager.lastDayStarted = newStartDate!
        
        let defaults = UserDefaults.standard
        defaults.setValue(hydrateManager.lastDayStarted, forKey: "lastDayStarted")
        defaults.setValue(hydrateManager.metric, forKey: "metricBool")
        
     hydrateDrinkReminderNotificationFunctions.setHydrateDrinkReminders(dayStartTime: Date())
        hydrateDrinkReminderNotificationFunctions.cancelUneededHydrateDrinkReminders()
    }
    
    func showGiveMeYourWeightPrompt() {
        chatManager.pendingQueue.insert(.getUsersWeight, at: 0)

    }
    func inputUserWeight(input: String) -> String{
        let weightInPounds = myConvert.stringToWeightInPounds(string: input)
        user.weightInLbs = weightInPounds
        let totalOz = weightInPounds / 2
        if hydrateManager.metric  {
            hydrateManager.dailyGoal = Int(myConvert.ozToMls(ounces: totalOz))
        } else {
            hydrateManager.dailyGoal = Int(totalOz)
        }
        
        return "OK I set your daily goal at \(hydrateManager.dailyGoal)\(hydrateManager.getUnits())"
    }
  
}
