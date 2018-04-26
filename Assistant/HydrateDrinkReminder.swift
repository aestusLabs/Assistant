//
//  HydrateDrinkReminder.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-18.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications


struct HydrateDailyReminderToLaunchApp {
    func setHydrateDailyRemind() {
        let requestIdentifier = "hydateDailyReminder"
        let content = UNMutableNotificationContent()
        content.title = "Start Day"
        content.subtitle = "Hydrate"
        content.body = "Launch the app to start your day and schedule your reminders to drink."
        var notificationDateComponents = DateComponents()
        notificationDateComponents.hour = 4
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: notificationDateComponents, repeats: true)
        let request = UNNotificationRequest (identifier: requestIdentifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in //4
            if let error = error {
                print(error)
            }
        }
    }
}

struct HydrateDrinkReminderNotificationFunctions {
    
    func setHydrateDrinkReminders(dayStartTime: Date) {
        let requestIdentifiers = getHydrateDrinkReminderRequestIndentifiers()
        let allNotifications = getAllDrinkReminderContent()
        let allSubtitles = getHydrateDrinkRemindersSubTitles()
        let allBodyText = getBodyText()
        let allTimeIntervals = getTimeIntervals()
        //    let todaysDateComponents = dately.dateComponentsFor(date: dayStartTime)
        var count = 0
        for reminder in allNotifications {
            reminder.title = "You Need To Drink Some Water"
            reminder.subtitle = allSubtitles[count]
            reminder.body = allBodyText[count]
            
            let notificationDate = dayStartTime.addingTimeInterval(allTimeIntervals[count])
            
            let components = Calendar.current.dateComponents([Calendar.Component.minute, Calendar.Component.hour, Calendar.Component.day, Calendar.Component.month, Calendar.Component.year], from: notificationDate)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            
            let request = UNNotificationRequest(identifier: requestIdentifiers[count], content: reminder, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { (error) in //4
                if let error = error {
                    print(error)
                }
            }
            count += 1
        }
    }
    func cancelUneededHydrateDrinkReminders() {
        let center = UNUserNotificationCenter.current()
        
        center.getPendingNotificationRequests(completionHandler: { requests in

            
            center.removePendingNotificationRequests(withIdentifiers: self.seeWhichNotificationsShouldFire(currentDate:  Date(), startOfDay:  hydrateManager.lastDayStarted))
            
        })
        
    }


    private func getHydrateDrinkReminderRequestIndentifiers() -> [String] {
        return ["firstInterval1HoursElapsed", "firstInterval2HoursElapsed", "firstInterval2AndHalfHoursElapsed", "firstInterval2AndThreeQuarterHoursElapsed", "secondIntervalStart", "secondInterval1HourElapsed", "secondInterval2HoursElapsed", "secondInterval2AndHalfHoursElapsed", "secondInterval2AndThreeQuarterHoursElapsed", "thirdIntervalStart", "thirdInterval1HourElapsed", "thirdInterval2HoursElapsed", "thirdInterval2AndHalfHoursElapsed", "thirdInterval2AndThreeQuarterHoursElapsed", "fourthIntervalStart", "fourthInterval1HourElapsed", "fourthInterval2HoursElapsed", "fourthInterval2AndHalfHoursElapsed", "fourthInterval2AndThreeQuaterHoursElapsed", "extraTimeStart"]
    }
    private func getHydrateDrinkRemindersSubTitles() -> [String] {
        var subtitles: [String] = []
        for _ in 1...4 {
            subtitles.append("Interval 1")
        }
        for _ in 1...5 {
            subtitles.append("Interval 2")
        }
        for _ in 1...5 {
            subtitles.append("Interval 3")
        }
        for _ in 1...5 {
            subtitles.append("Interval 4")
        }
        subtitles.append("Extra Time")
        return subtitles
    }
    private func getTimeIntervals() -> [TimeInterval] {
        var amountToAdd: [TimeInterval] = [3600, 3600, 1800, 900, 900]
        var total: TimeInterval = 0
        var amountCount = 0
        var timeIntervals: [TimeInterval] = []
        for _ in 1...20 {
            if amountCount == 5 {
                amountCount = 0
            }
            total += amountToAdd[amountCount]
            timeIntervals.append(total)
            
            
            amountCount += 1
        }
        
        return timeIntervals //[3600, 7200, 9000, 9900, 10800, 14400, 18000, 19800, 20700, 21600, ]
    }

    private func getBodyText() -> [String] {
        let startMessage = "3 hours until the end of the interval."
        let oneHourElapsed = "2 hours until the end of the interval."
        let twoHoursElapsed = "1 hour until the end of the interval."
        let twoHalfElapsed = "30 minutes until the end of the interval. You better get drinking."
        let twoThreeQuartersElapsed = "15 minutes until the end of the interval. You better get drinking."
        var bodyText = [oneHourElapsed, twoHoursElapsed, twoHalfElapsed, twoThreeQuartersElapsed]
        for _ in 1...3 {
            bodyText.append(contentsOf: [startMessage, oneHourElapsed, twoHoursElapsed, twoHalfElapsed, twoThreeQuartersElapsed])
        }
        bodyText.append("The intervals are done but you can still add water to your days total.")
        return bodyText
    }

    private func getAllDrinkReminderContent() -> [UNMutableNotificationContent] {
        let firstInterval1HourElapsed = UNMutableNotificationContent()
        let firstInterval2HoursElapsed = UNMutableNotificationContent()
        let firstInterval2AndHalfHoursElapsed = UNMutableNotificationContent()
        let firstInterval2AndThreeQuarterHoursElapsed = UNMutableNotificationContent()
        
        let secondIntervalStart = UNMutableNotificationContent()
        let secondInterval1HourElapsed = UNMutableNotificationContent()
        let secondInterval2HoursElapsed = UNMutableNotificationContent()
        let secondInterval2AndHalfHoursElapsed = UNMutableNotificationContent()
        let secondInterval2AndThreeQuarterHoursElapsed = UNMutableNotificationContent()
        
        let thirdIntervalStart = UNMutableNotificationContent()
        let thirdInterval1HourElapsed = UNMutableNotificationContent()
        let thirdInterval2HoursElapsed = UNMutableNotificationContent()
        let thirdInterval2AndHalfHoursElapsed = UNMutableNotificationContent()
        let thirdInterval2AndThreeQuarterHoursElapsed = UNMutableNotificationContent()
        
        let fourthIntervalStart = UNMutableNotificationContent()
        let fourthInterval1HourElapsed = UNMutableNotificationContent()
        let fourthInterval2HoursElapsed = UNMutableNotificationContent()
        let fourthInterval2AndHalfHoursElapsed = UNMutableNotificationContent()
        let fourthInterval2AndThreeQuaterHoursElapsed = UNMutableNotificationContent()
        
        let extraTimeStart = UNMutableNotificationContent()
        
         return [firstInterval1HourElapsed, firstInterval2HoursElapsed, firstInterval2AndHalfHoursElapsed, firstInterval2AndThreeQuarterHoursElapsed, secondIntervalStart, secondInterval1HourElapsed, secondInterval2HoursElapsed, secondInterval2AndHalfHoursElapsed, secondInterval2AndThreeQuarterHoursElapsed, thirdIntervalStart, thirdInterval1HourElapsed, thirdInterval2HoursElapsed, thirdInterval2AndHalfHoursElapsed, thirdInterval2AndThreeQuarterHoursElapsed, fourthIntervalStart,  fourthInterval1HourElapsed, fourthInterval2HoursElapsed, fourthInterval2AndHalfHoursElapsed, fourthInterval2AndThreeQuaterHoursElapsed, extraTimeStart]
    }


     func seeWhichNotificationsShouldFire(currentDate: Date, startOfDay: Date) -> [String]{

        var notificationsToCancel: [String] = []
        let allIdentifiers = getHydrateDrinkReminderRequestIndentifiers()
        let timeIntervals = getTimeIntervals()
        
        var count = 0
        for identifier in allIdentifiers {
            let notificationDate = startOfDay.addingTimeInterval(timeIntervals[count])
            if dately.isDateBeforeDateTwo(date: currentDate, dateTwo: notificationDate) == false {
                
                notificationsToCancel.append(identifier)
            }
            count += 1
        }
        
        let intervalsToCancel = compareTotalToIntervals(manager: hydrateManager)
        
        let tempIDsToCancel = getIDsToCancelForIntervalsWithGoalAchieved(intervalsToCancel: intervalsToCancel)
        for id in tempIDsToCancel {
            if notificationsToCancel.contains(id) == false{
                notificationsToCancel.append(id)
            }
        }

        
        return notificationsToCancel
    }


    private func getIDsToCancelForIntervalsWithGoalAchieved(intervalsToCancel: [Int]) -> [String] {
        var tempIDsToCancel: [String] = []
        if intervalsToCancel.contains(1) {
            tempIDsToCancel.append(contentsOf: ["firstInterval1HoursElapsed", "firstInterval2HoursElapsed", "firstInterval2AndHalfHoursElapsed", "firstInterval2AndThreeQuarterHoursElapsed"])
        }
        if intervalsToCancel.contains(2) {
            tempIDsToCancel.append(contentsOf: ["secondIntervalStart", "secondInterval1HourElapsed", "secondInterval2HoursElapsed", "secondInterval2AndHalfHoursElapsed", "secondInterval2AndThreeQuarterHoursElapsed"])
        }
        if intervalsToCancel.contains(3) {
            tempIDsToCancel.append(contentsOf: ["thirdIntervalStart", "thirdInterval1HourElapsed", "thirdInterval2HoursElapsed", "thirdInterval2AndHalfHoursElapsed", "thirdInterval2AndThreeQuarterHoursElapsed"])
        }
        if intervalsToCancel.contains(4) {
            tempIDsToCancel.append(contentsOf: ["fourthIntervalStart", "fourthInterval1HourElapsed", "fourthInterval2HoursElapsed", "fourthInterval2AndHalfHoursElapsed", "fourthInterval2AndThreeQuaterHoursElapsed", "extraTimeStart"])
        }
        return tempIDsToCancel
    }

     func compareTotalToIntervals(manager: HydrateManager) -> [Int] {
        let total = manager.getDaysTotal()
      
        
        var intervalsToCancel: [Int] = []
        if total >= manager.interval1Goal {
            intervalsToCancel.append(1)
        }
        if total >= manager.interval2Goal + manager.interval1Goal{
            intervalsToCancel.append(2)
        }
        if total >= manager.interval3Goal + manager.interval2Goal + manager.interval1Goal {
            intervalsToCancel.append(3)
        }
        if total >= manager.interval4Goal + manager.interval3Goal + manager.interval2Goal + manager.interval1Goal {
            intervalsToCancel.append(4)
        }
        return intervalsToCancel
    }
}
let hydrateDrinkReminderNotificationFunctions = HydrateDrinkReminderNotificationFunctions()
