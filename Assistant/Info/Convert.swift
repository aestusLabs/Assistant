//
//  Convert.swift
//  Breathe
//
//  Created by Ian Kohlert on 2017-12-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

struct Convert {
    
    func getImageForBreathe(sessionType: SessionType) -> UIImage {
        switch sessionType {
        case .deepBreathing:
            return #imageLiteral(resourceName: "Lotus")
        case .counted:
            return #imageLiteral(resourceName: "Candle")
        case .calming:
            return #imageLiteral(resourceName: "Calm")
        case .alternateNostril:
            return #imageLiteral(resourceName: "Alt Nostril")
        case .bellows:
            return #imageLiteral(resourceName: "Bellows")
        case .shiningSkull:
            return #imageLiteral(resourceName: "Skull")
        default:
            return #imageLiteral(resourceName: "SettingsPlaceholder")
        }
    }
    
    func liquidAmount(userInput: String) -> Int {
        var letters = ""
        var numbers = ""
        for char in userInput {
            if let number = Int(String(char)) {
                numbers += String(char)
            } else {
                letters += String(char)
            }
        }
        var returnNumber = Int(numbers)!
        if letters == "l" || letters == "litre" || letters == "litres" || letters == "liter" || letters == "liters" {
            returnNumber *= 1000
        }
        return returnNumber
    }
    
    func time(userInput: String) -> Int { // return in seconds
        var time = 0
        let components = userInput.components(separatedBy: " ")
        if let timeFromUserString = Int(components[0]) {
            time = timeFromUserString
        }
        if components[1] == "minutes" || components[1] == "minute"{
            time = time * 60
        }
//        print(time)
        return time
    }
    func cycles(userInput: String) -> Int {
        var cycles = 0
        let components = userInput.components(separatedBy: " ")
        if let numOfCycles = Int(components[0]) {
            cycles = numOfCycles
        }
        return cycles
        
    }
    
    func imageFrom(sessionType: SessionType) -> UIImage {
        switch sessionType {
            //        case .alternateNostril:
            
        default:
            return #imageLiteral(resourceName: "Lungs")
        }
    }
    
    func displaySessionTypeToUser(sessionType: SessionType) -> String {
        switch sessionType {
        case .alternateNostril:
            return "Alternate Nostril"
        case .bellows:
            return "Bellows Breath"
        case .calming:
            return "Calming Breath"
        case .counted:
            return "Counted Breath"
        case .deepBreathing:
            return "Deep Breathing"
        case .shiningSkull:
            return "Shining Skull"
        default:
            return "Error"
        }
    }
    func sessionTypeFrom(string: String) -> SessionType {
        switch string {
        case "Alternate Nostril":
            return .alternateNostril
        case "Bellows Breath":
            return .bellows
        case "Calming Breath":
            return .calming
        case "Deep Breathing":
            return .deepBreathing
        case "Shining Skull":
            return .shiningSkull
        case "Shining Skull Breath":
            return .shiningSkull
        default:
            return .unassigned
        }
    }
    
    func stringFrom(sessionType: SessionType) -> String {
        
        switch sessionType {
        case .alternateNostril:
            return "Alternate Nostril"
        case .bellows:
            return "Bellows Breath"
        case .calming:
            return "Calming Breath"
        case .counted:
            return "Counted Breath"
        case .deepBreathing:
            return "Deep Breathing"
        case .shiningSkull:
            return "Shining Skull Breath"
        default:
            return "Error"
        }
        
    }
    
    func displayTimeFrom(seconds: Int) -> String {
        
        
        if seconds < 60 {
            return "\(seconds)s"
        }
        
        if seconds < 3600 {
            var timeString = "\(seconds / 60)m"
            if seconds % 60 != 0 {
                timeString += "\(seconds % 60)s"
            }
            return timeString //"\(seconds / 60)m\(seconds % 60)s"
        }
        
        if seconds < 86400 {
            let hour = seconds / 3600
            let secondsLeftFromHour = seconds % 3600
            let minutes = secondsLeftFromHour / 60
            let secondsLeft = secondsLeftFromHour % 60
         var timeString = ""
            if hour != 0 {
                timeString = "\(hour)h"
            }
            if minutes != 0 {
                timeString += "\(minutes)m"
            }
            if secondsLeft != 0 {
                timeString += "\(secondsLeft)"
            }
            return timeString //"\(hour)h\(minutes)m\(secondsLeft)s"
        }
        
        return "Error"
    }
    
    func numberOf(breaths: String) -> Int {
        let words = breaths.components(separatedBy: " ")
        if let number = Int(words[0]) {
            return number
        }
        return 15
    }
    func userSkillEnumValueFrom(string: String) -> UserSkillLevel{

        switch string {
        case "newby":
            return .newby
        case "beginner":
            return .beginner
        case "intermediate":
            return .intermediate
        case "advanced":
            return .advanced
        default:
            return .beginner
            
        }
    }
    func userMessageSpeedFrom(string: String) -> ReadingSpeeds {
        switch string {
        case "superSlow":
            return .superSlow
        case "slow":
            return .slow
        case "average":
            return .average
        case "fast":
            return .fast
        case "superFast":
            return .superFast
        case "instant":
            return .instant
        default:
            return .average
        }
    }
    func colourThemeFrom(string: String) -> ColourTheme {
        if string == "light" {
            return .light
        } else {
            return .dark
        }
    }
    func dayFrom(string: String) -> Day {
  
        
        switch string {
        case "Sunday":
        return .sun
        case "Monday":
        return .mon
        case "Tuesday":
            return .tue
        case "Wednesday":
            return .wed
        case "Thursday":
            return .thu
        case "Friday":
            return .fri
        case "Saturday":
            return .sat
        case "Sunday":
            return .sun
        default:
        return .unassigned
        }
    }
    
    func stringToWeightInPounds(string: String) -> Double {
        if let number = Double(string) {
            if hydrateManager.metric  {
                return kgToLbs(kg: number)
            } else {
                return number
            }
        }
        var numbers = ""
        var letters = ""
        for char in string {
            if let _ =  Int(String(char)) {
                numbers += String(char)
            } else {
                if char != " " {
                    letters += String(char)
                }
            }
        }
        if letters == "kg" || letters == "kgs" {
            if let number = Double(numbers) {
               return kgToLbs(kg: number)
            }
        } else {
            if let number =  Double(numbers) {
                return number
            }
        }
        return 9999.9
    }
    func kgToLbs(kg: Double) -> Double {
        return kg * 2.2
    }
    func ozToMls(ounces: Double) -> Int {
        let mls = ounces * 29.57
        print(mls)
        
        return Int(mls)
    }
}

let myConvert = Convert()
