//
//  AllAppsActions.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-11.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
struct Actions {
    
    let breatheActions = BreatheActions()
    
    func showTestPrompt() {
        chatManager.pendingQueue.append(.test)
    }
    
    // MARK: App
    func showHowAppWorks() {
        chatManager.pendingQueue.insert(.showHowAppWorks, at: 0)
        
    }
    
    // MARK: User
    func setName(input: String) -> String{
        user.name = input
        user.saveToDefaults()
        return "OK, I will call you \(user.name). If you wish to change it at any time you can tap the chat bar and type 'Change my name'."
    }
    
    // MARK: Onboarding
    func showOnboarding() {
        chatManager.pendingQueue.append(contentsOf: paths.onboardingPromptTypes)
    }
    
    func finishOnboarding() {
        user.finishedOnboarding = true
        user.saveToDefaults()
    }
    
    // MARK: Message Speed
    func showReadingSpeed()  {
        chatManager.pendingQueue.insert(.showReadingSpeedWidget, at: 0)
    }
    
    func incrementMessageSpeed(increase: Bool) {
        let arrayOfSpeeds: [ReadingSpeeds] = [.superSlow, .slow, .average, .fast, .superFast, .instant]
        var currentNumber = -1
        switch user.readingSpeed {
        case .superSlow:
            currentNumber = 0
        case .slow:
            currentNumber = 1
        case .average:
            currentNumber = 2
        case .fast:
            currentNumber = 3
        case .superFast:
            currentNumber = 4
        case .instant:
            currentNumber = 5
        }
        if increase {
            currentNumber += 1
            if currentNumber == 6 {
                currentNumber = 5
            }
        } else {
            currentNumber -= 1
            if currentNumber == -1 {
                currentNumber = 0
            }
        }
        user.readingSpeed = arrayOfSpeeds[currentNumber]
        user.saveToDefaults()
        
    }
    
    func increaseReadingSpeed()  {
        incrementMessageSpeed(increase: true)
        chatManager.continueMessage = "OK, I increased your reading speed to \(user.readingSpeed)."
        //        chatManager.pendingQueue.insert(.continueMessage, at: 0)
        
    }
    
    func decreaseReadingSpeed() -> String {
        if user.readingSpeed == .superSlow {
            return "I'm sorry, I can't slow down the message speed any further. Contact my developer via this apps settings page to request slower speeds."
        }
        
        incrementMessageSpeed(increase: false)
        return "OK, I decreased your message speed to \(user.readingSpeed)"
    }
    
    // MARK: Subscription
    func showSubscribe() {
        chatManager.pendingQueue.insert(.showSubscribe, at: 0)
    }

    // MARK: Dark Mode
    func turnOnDarkMode() -> String {
        user.colourScheme = .dark
        user.saveToDefaults()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshColours"), object: nil)
        return  "OK, I turned on dark mode."
    }
    func turnOffDarkMode() -> String {
        user.colourScheme = .light
        user.saveToDefaults()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshColours"), object: nil)
        return "OK, I turned off dark mode."
    }
    
    // MARK: Reading Speed
    
    func setReadingSpeed(userInput: String) -> String{
        //"Super Slow", "Slow", "Average", "Fast", "Super Fast", "Instant"
        switch userInput {
        case "Super Slow":
            user.readingSpeed = .superSlow
        case "Slow":
            user.readingSpeed = .slow
        case "Average":
            user.readingSpeed = .average
        case "Fast":
            user.readingSpeed = .fast
        case "Super Fast":
            user.readingSpeed = .superFast
        case "Instant":
            user.readingSpeed = .instant
        default:
            print("Error with message speed assignment")
        }
        user.saveToDefaults()
        return "OK, I set your message speed to \(userInput). You can change this at any time by tapping the Chat Bar at the bottom of the screen and typing 'message speed'"
        
    }
    
    // MARK: Notifications
    func showChooseNotificationDays() {
        chatManager.pendingQueue.insert(.chooseDaysForNotification, at: 0)
    }
    
    func setNotificationsDays() -> String {
        chatManager.pendingQueue.insert(.chooseTimeForNotification, at: 0)
        var days = ""
        var count = 0
        user.notificationDays = chatManager.dailyNotificationDays
        user.saveToDefaults()
        for day in chatManager.dailyNotificationDays {
            days += getDayStringFrom(day: day)
            if count < chatManager.dailyNotificationDays.count - 1 {
                days += ", "
            }
            count += 1
        }
        
        return "OK, I set these days to be reminded: \(days). "
    }
    func setNotificationTime() -> String {
        user.notificationTime = chatManager.dailyNotificationTime
        user.saveToDefaults()
        if user.permissionToShowNotifications {
            chatManager.pendingQueue.insert(.showConfirmSetNotification, at: 0)
        } else {
            chatManager.pendingQueue.insert(.askPermissionToSendNotifications, at: 0)
        }
        return "OK, I set the time at \(chatManager.dailyNotificationTime)."
    }
    func confirmSetNotification() -> String{
        setDailyNotification()
        var s = ""
        if chatManager.dailyNotificationDays.count > 1 {
            s = "s"
        }
        return "OK, I scheduled your notification\(s) at \(chatManager.dailyNotificationTime) on the days you selected."
    }
    
    func givePermissionToShowNotifications() {
        askUserPermissionToShowNotifications()
        chatManager.pendingQueue.insert(.showConfirmSetNotification, at: 0)
    }
    func refuseGivePermissionToShowNotifications() -> String{
        return "That's OK if you don't want to get notifications. Swipe Home to do something else."
    }
    
    func turnOnNotifications() -> String{
        return "OK I will send you a reminder you on the days your set."
    }
    
    func turnOffNotifications() -> String {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["monRequest", "tueRequest", "wedRequest", "thuRequest", "friRequest", "satRequest", "sunRequest"])
        
        return "OK I turned off notifications. You can re-eneable them by typing 'turn on notifications'."
    }
    
    // MARK: Unused
    func showAllGlobalCommands() {
        //        chatManager.pendingQueue.insert(.showAllGlobalCommands, at: 0)
    }
    func showSettings() {
        
        
        //chatManager.pendingQueue.append(.settings)
    }
  
}
