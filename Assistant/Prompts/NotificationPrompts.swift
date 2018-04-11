//
//  NotificationPrompts.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-17.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
//Spelling And Grammar Checked
struct NotificationPrompts {
func createWouldYouLikeADailyNotificationPrompt() -> Prompt { //Spelling And Grammar Checked
    let titleDivider = createTitleDivider(text: "Set Daily Reminder?")
    let message = createAssistantMessageItem(text: "Would you like to set a daily reminder to practise pranayama?")
    let selectDaysMessage = createAssistantMessageItem(text: "Don't worry, I get that notifications can be annoying. I do my best to help you select only the days and time you wish to be recieve them.")
    let setButton = ButtonData(title: "Set Reminder", action: .setDailyNotification, global: false, premium: false)
    let noSetButton = ButtonData(title: "No", action: .continueWhatYouWereDoing, global: false, premium: false)
    let buttonCloud = createButtonCloud(buttons: [setButton, noSetButton], promptType: .wouldYouLikeToSetNotification)
    buttonCloud.typeableAnswer = false
    return Prompt(promptType: .wouldYouLikeToSetNotification, itemSegments: [[titleDivider, message], [selectDaysMessage, buttonCloud]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .setDailyNotification)
}

func chooseDaysForNotifications() -> Prompt { //Spelling And Grammar Checked
    let titleDivider = createTitleDivider(text: "Choose Days")
    let message = createAssistantMessageItem(text: "Select the days you would like to be reminded to Breathe.")
    let daySelectWidget = createDayOfWeekSelectionWidget()
    let continueButton = ButtonData(title: "Set Days", action: .setNotificationDays, global: false, premium: false)
    let buttonCloud = createButtonCloud(buttons: [continueButton], promptType: .chooseDaysForNotification)
    buttonCloud.typeableAnswer = false

    return Prompt(promptType: .chooseDaysForNotification, itemSegments: [[titleDivider, message, daySelectWidget, buttonCloud]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .setNotificationDays)
}



func chooseTimeForNotifications() -> Prompt { //Spelling And Grammar Checked
    let titleDivider = createTitleDivider(text: "Choose Time")
    let message = createAssistantMessageItem(text: "Select the time you wish to be reminded. (Or you can type a custom time by tapping the chat bar at the bottom.)")
    //        let launchKeyboard = createLaunchKeyboardItem()
    let sixAMButton = ButtonData(title: "6 am", action: .setNotificationTime, global: false, premium: false)
    let eightAMButton = ButtonData(title: "8am", action: .setNotificationTime, global: false, premium: false)
    let eightPMButton = ButtonData(title: "8:30 pm", action: .setNotificationTime, global: false, premium: false)
    let tenPMButton = ButtonData(title: "10pm", action: .setNotificationTime, global: false, premium: false)
    let buttonCloud = createButtonCloud(buttons: [sixAMButton, eightAMButton, eightPMButton, tenPMButton], promptType: .chooseTimeForNotification )
    return Prompt(promptType: .chooseTimeForNotification, itemSegments: [[titleDivider, message, buttonCloud]], userInputUnrecognizedString: "I'm sorry I didn't understand what you said. I am looking for a time. For example '4pm'.", category: .other, answerFormat: [], action: .setNotificationTime)
}

func createAskPermissionToSendNotifications() -> Prompt {//Spelling And Grammar Checked
    let titleDivider = createTitleDivider(text: "Permission")
    let message = createAssistantMessageItem(text: "I haven't gotten your permission to send you notifications yet.")
    let confirmMessage = createAssistantMessageItem(text: "I promise I will never abuse my privileges by sending notifications you don't request. You will have complete control over the notifications I send you.")
    let noAccessButton = ButtonData(title: "No, I don't want notifications", action: .refuseToGiveNotificationPermission, global: false, premium: false)
    let giveAccessButton = ButtonData(title: "Yes, I'll give permission", action: .givePermissionForNotifications, global: false, premium: false)
    let buttonCloud = createButtonCloud(buttons: [noAccessButton, giveAccessButton], promptType: .askPermissionToSendNotifications)
    buttonCloud.typeableAnswer = false

    return Prompt(promptType: .askPermissionToSendNotifications, itemSegments: [[titleDivider, message], [confirmMessage, buttonCloud]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .varied)
}

func createConfirmSetNotificationPrompt() -> Prompt { //Spelling And Grammar Checked
    let titleDivider = createTitleDivider(text: "Confirmation")
    
    var daysString = ""
    for day in chatManager.dailyNotificationDays {
        if day == .mon {
            daysString += "Monday, "
        }
        if day == .tue {
            daysString += "Tuesday, "
        }
        if day == .wed {
            daysString += "Wednesday, "
        }
        if day == .thu {
            daysString += "Thursday, "
        }
        if day == .fri {
            daysString += "Friday, "
        }
        if day == .sat {
            daysString += "Saturday, "
        }
        if day == .sun {
            daysString += "Sunday, "
        }
    }
    
    let messageText = "OK, I'll will remind you to Breathe on \(daysString)at \(chatManager.dailyNotificationTime)."
    
    let message = createAssistantMessageItem(text: messageText)
    let confirmButton = ButtonData(title: "Confirm", action: .setDailyNotification, global: false, premium: false)
    let cancelButton = ButtonData(title: "Cancel", action: .cancelSetDailyNotification, global: false, premium: false)
    let buttonCloud = createButtonCloud(buttons: [cancelButton, confirmButton], promptType: .showSubscribe)
    buttonCloud.typeableAnswer = false

    return Prompt(promptType: .showSubscribe, itemSegments: [[titleDivider, message, buttonCloud]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .varied)
    
}
}
let notificationPrompts = NotificationPrompts()
