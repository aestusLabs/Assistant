//
//  DailyNotification.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-15.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
import UserNotifications

func askUserPermissionToShowNotifications() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) {(accepted, error) in
        if !accepted {
            print("Notification access denied.")
        } else {
            user.permissionToShowNotifications = true
            user.saveToDefaults()
        }
    }
}
func setDailyNotification() {

//    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 92, repeats: false)
//    UNUserNotificationCenter.current().requestAuthorization(options: [], completionHandler: <#T##(Bool, Error?) -> Void#>)
    
    
    
    let requestIdentifiers = ["monRequest", "tueRequest", "wedRequest", "thuRequest", "friRequest", "satRequest", "sunRequest"]
    let days = chatManager.dailyNotificationDays
    var time = chatManager.dailyNotificationTime
    
    let mondayNotification = UNMutableNotificationContent()
    let tuesdayNotification = UNMutableNotificationContent()
    let wednesdayNotification = UNMutableNotificationContent()
    let thursdayNotification = UNMutableNotificationContent()
    let fridayNotification = UNMutableNotificationContent()
    let saturdayNotification = UNMutableNotificationContent()
    let sundayNotification = UNMutableNotificationContent()
    
    var activeDays: [UNMutableNotificationContent] = []
    
    for day in days {
        switch day {
        case .mon:
            activeDays.append(mondayNotification)
        case .tue:
            activeDays.append(tuesdayNotification)
        case .wed:
            activeDays.append(wednesdayNotification)
        case .thu:
            activeDays.append(thursdayNotification)
        case .fri:
            activeDays.append(fridayNotification)
        case .sat:
            activeDays.append(saturdayNotification)
        case .sun:
            activeDays.append(sundayNotification)
        default:
            print("Unrecognized day")
        }
    }

    var count = 0
    for day in activeDays {
        day.title = "Breathe Reminder"
        day.subtitle = "Take A Minute For Yourself"
        day.body = "If you want to conquer the anxiety of life, live in the moment, live in the breath. - Amit Ray"
        
//        time = "1:16pm"
        var dateComponents = timeParser.parseTime(text: time)
        dateComponents.weekday = days[count].rawValue
//        dateComponents.hour = 11
//        dateComponents.minute = 28
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: requestIdentifiers[count], content: day, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in //4
            if let error = error {
                print(error)
            }
        }
        count += 1
    }
    
    
    
}





