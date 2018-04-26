//
//  UserInfo.swift
//  Breathe
//
//  Created by Ian Kohlert on 2017-12-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
struct UserInfo {
    var skillLevel: UserSkillLevel = .advanced
    var readingSpeed: ReadingSpeeds = .fast
    var premium: Bool = false
    var colourScheme: ColourTheme = .light
    var permissionToShowNotifications = false
    var brandNew = true
    var name = ""
    var healthIntegration = false
    var finishedOnboarding = false
    var onboardingInProgress = false
    var notificationDays : [Day] = []
    var notificationTime: String = ""
    var weightInLbs: Double = 0.0
    
    func saveToDefaults() {
        let defaults = UserDefaults.standard
        defaults.set(skillLevel.rawValue, forKey: "skillLevel")
        defaults.set(readingSpeed.rawValue, forKey: "messageSpeed")
        defaults.set(premium, forKey: "isPremium")
        defaults.set(colourScheme.rawValue, forKey: "colourTheme")
        defaults.set(permissionToShowNotifications, forKey: "permissionToShowNotifications")
        defaults.set(brandNew, forKey: "isBrandNew")
        defaults.set(name, forKey: "userName")
        defaults.set(healthIntegration, forKey: "healthIntegration")
        defaults.set(finishedOnboarding, forKey: "finishedOnboarding")
        var daysArray: [String] = []
        for day in notificationDays {
            daysArray.append(getDayStringFrom(day: day))
        }
        defaults.set(daysArray, forKey: "notificationDays")
        defaults.set(notificationTime, forKey: "notificationTime")
    }
    
   
    mutating func updateValuesFromDefaults() {
        let defaults = UserDefaults.standard

        if let userSkillLevel =  defaults.object(forKey: "skillLevel")  as? String {
            skillLevel = myConvert.userSkillEnumValueFrom(string: userSkillLevel)
        }
        if let userMessageSpeed = defaults.object(forKey: "messageSpeed") as? String {
            
            readingSpeed = myConvert.userMessageSpeedFrom(string: userMessageSpeed)
        }
        
            premium = defaults.bool(forKey: "isPremium")
        
        if let userColourScheme = defaults.object(forKey: "colourTheme") as? String{
            colourScheme = myConvert.colourThemeFrom(string: userColourScheme)
        }
        
        permissionToShowNotifications = defaults.bool(forKey: "permissionToShowNotifications")
        
        brandNew = defaults.bool(forKey: "isBrandNew")
        
        
        
        if let userName =  defaults.string(forKey: "userName") {
            name = userName
        }
        healthIntegration = defaults.bool(forKey: "healthIntegration")
        finishedOnboarding = defaults.bool(forKey: "finishedOnboarding")
        
        if let userNotificationTime = defaults.string(forKey: "notificationTime") {
            notificationTime = userNotificationTime
        }
        let tempDaysArray = defaults.object(forKey: "notificationDays") as? [String] ?? [String]()
        for day in tempDaysArray {
            notificationDays.append(myConvert.dayFrom(string: day)) 
        }
        
    }
}
var user = UserInfo()
