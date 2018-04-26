//
//  HydrateOnboardingPrompts.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-13.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation


struct HydrateOnboardingPrompts {
    
    func hydrateOnboardingPromptFor(promptType: PromptType) -> Prompt? {
        var prompt: Prompt? = nil
        switch promptType {
        case .explainHydrateIntervals:
            prompt = hydrateOnboardingPrompts.intervalsExplanation()
        case .selectMeasurementUnits:
            prompt = hydrateOnboardingPrompts.selectUnits()
            
        case .hydrateSelectDailyGoal:
            prompt = hydrateOnboardingPrompts.selectGoal()
        case .enterWaterAlreadyConsumed:
            prompt = hydrateOnboardingPrompts.enterWaterAlreadyConsumedToday()
            
        case .explainWaterDangers:
            prompt = hydrateOnboardingPrompts.waterDangers()
        case .explainHydrateNotifcations:
            prompt = hydrateOnboardingPrompts.notifications()
        case .getUsersWeight:
            prompt = getWeight()
        default:
            print("Not an Hydrate onboarding prompt")
        }
        
        return prompt
    }
    
    func intervalsExplanation() -> Prompt {
        let titleDivider = createTitleDivider(text: "Intervals Explanation")
        let message = createAssistantMessageItem(text: "Hydrate takes a bit of an opinionated stance on hydration.")
        let maintainMessage = createAssistantMessageItem(text: "Namely that you should maintain your hydration throughout the day.")
        
        let intervalsMessage = createAssistantMessageItem(text: "So even though you select a daily goal. You also have 4 interval goals per day.")
        let descriptionMessage = createAssistantMessageItem(text: "Each interval is 3 hours long and there are 4 of them.")
        let defaultMessage = createAssistantMessageItem(text: "By default each interval goal is a quarter of your daily goal.")
        let continueButton = ButtonData(title: "Continue", action: .continueWhatYouWereDoing, global: false, premium: false)
        let cloud = createButtonCloud(buttons: [continueButton], promptType: .explainHydrateIntervals)
        return Prompt(promptType: .explainHydrateIntervals, itemSegments: [[titleDivider, message], [maintainMessage], [intervalsMessage],  [descriptionMessage], [defaultMessage, cloud]], userInputUnrecognizedString: "", category: .onboarding, answerFormat: [], action: .continueWhatYouWereDoing)
    }
   
//    func timeToStartDay() -> Prompt {
//        let titleDivider = createTitleDivider(text: "Daily Start Time")
//        let message =  createAssistantMessageItem(text: "What time do you usually start your day?")
//        let intervalsMessage = "I use this to know when to start the first interval."
//        let chooseMessage = "Choose your start time or type your answer if none of my suggestions work for you."
//        let buttonTitles = ["4am", "6am", "8am", "10am"]
//        var buttons: [ButtonData] = []
//        for title in buttonTitles {
//            buttons.append(ButtonData(title: title, action: .setHydrateStartTime, global: false, premium: false))
//        }
//            let cloud = createButtonCloud(buttons: buttons, promptType: .showHydrateSetStartOfDay)
//        return Prompt(promptType: .showHydrateSetStartOfDay, itemSegments: [[titleDivider, message], [intervalsMessage], [chooseMessage, cloud]], userInputUnrecognizedString: "I am sorry I didn't understand you. Try phrasing your answer like this: '2 a.m.', '3a.m.', '7am'.", category: .onboarding, answerFormat: [], action: .setHydrateStartTime)
//    }
    
    func selectUnits() -> Prompt {
        let titleDivider = createTitleDivider(text: "Select Units")
        let message = createAssistantMessageItem(text: "Would you like to use metric or imperial units?")
        let metricButton = ButtonData(title: "Metric", action: .setMeasurementUnits, global: false, premium: false)
        let imperialButton = ButtonData(title: "Imperial", action: .setMeasurementUnits, global: false, premium: false)
        let cloud = createButtonCloud(buttons: [imperialButton, metricButton], promptType: .selectMeasurementUnits)
        return Prompt(promptType: .selectMeasurementUnits, itemSegments: [[titleDivider,message, cloud]], userInputUnrecognizedString: "", category: .onboarding, answerFormat: [], action: .setMeasurementUnits)
    }
    
    func selectGoal() -> Prompt {
        let titleDivider = createTitleDivider(text: "Daily Goal")
        let message = createAssistantMessageItem(text: "I need your daily goal.")
        
        let manualMessage = createAssistantMessageItem(text: "You can select an amount, type it in (tap the chat bar at the bottom), or I can calculate it from your height, weight, gender and level of activity.")
        var buttonTitles: [String] = []
        if hydrateManager.metric {
            buttonTitles = ["2000ml", "3000ml", "4000ml"]
        } else {
            buttonTitles = ["64oz", "96oz", "128oz"]
        }
        var buttons : [ButtonData] = []
        for title in buttonTitles {
            buttons.append(ButtonData(title: title, action: .setDailyHydrationGoal, global: false, premium: false))
        }
        buttons.append(ButtonData(title: "Calculate It For Me", action: .showCalculateDailyHydrationGoalPrompt, global: false, premium: false))
        let cloud = createButtonCloud(buttons: buttons, promptType: .hydrateSelectDailyGoal)
        return Prompt(promptType: .hydrateSelectDailyGoal, itemSegments: [[titleDivider, message], [manualMessage, cloud]], userInputUnrecognizedString: "I am sorry I didn't understand what you said. Try something like '2500ml' or '50oz'", category: .onboarding, answerFormat: [], action: .setDailyHydrationGoal)
        
    }
    
    func enterWaterAlreadyConsumedToday() -> Prompt {
        let titleDivider = createTitleDivider(text: "Water Drank")
        let message = createAssistantMessageItem(text: "Tap the bar at the bottom and enter in how much water you've already drank today.")
        let button = ButtonData(title: "None", action: .continueWhatYouWereDoing, global: false, premium: false)
        let cloud = createButtonCloud(buttons: [button], promptType: .enterWaterAlreadyConsumed)
        return Prompt(promptType: .enterWaterAlreadyConsumed, itemSegments: [[titleDivider, message, cloud]], userInputUnrecognizedString: "I am sorry, I didn't understand you. Try phrasing it like this: '3 litres', '1000ml', '30 ounces', etc", category: .onboarding, answerFormat: [], action: .addWater)
    }
    
    
    func waterDangers() -> Prompt {
        let titleDivider = createTitleDivider(text: "Health Warning")
        let message = createAssistantMessageItem(text: "Drinking too much water can lead to death.")
        let doctorMessage = createAssistantMessageItem(text: "Consult your doctor before making drastic changes to the amount of water you consume.")
        
        let continueButton = ButtonData(title: "Got It", action: .continueWhatYouWereDoing, global: false, premium: false)
        let cloud = createButtonCloud(buttons: [continueButton], promptType: .explainWaterDangers)
        return Prompt(promptType: .explainWaterDangers, itemSegments: [[titleDivider, message], [doctorMessage, cloud]], userInputUnrecognizedString: "", category: .onboarding, answerFormat: [], action: .continueWhatYouWereDoing)
    }
    
    func notifications() -> Prompt {
        let titleDivider = createTitleDivider(text: "Notifications")
        let message = createAssistantMessageItem(text: "Notificiations are a big part of Hydrate.")
        let whyMessage = createAssistantMessageItem(text: "While you can use Hydrate without enabling notifications, the thing that makes Hydrate special is how its unique reminders system.")
        let systemMessage = createAssistantMessageItem(text: "It will remind you every morning to launch the app.")
        let remindersMessage = createAssistantMessageItem(text: "Once you do it will then remind you to drink thoughout the day.")
        let uniqueMessage = createAssistantMessageItem(text: "Which doesn't sound unique at all. The unique part is if you are above the current intervals goal it won't remind you.")
        let lastMessage = createAssistantMessageItem(text: "So it reminds you when you need to drink and doesn't when you don't.")
        let notificationsIntegrationWidget = createIntegrationWidget(text: "Notifications", image: #imageLiteral(resourceName: "Bell"), isToggled: false)
        let continueButton = ButtonData(title: "Got It", action: .continueWhatYouWereDoing, global: false, premium: false)
        let cloud = createButtonCloud(buttons: [continueButton], promptType: .explainHydrateNotifcations)
        return Prompt(promptType: .explainHydrateNotifcations, itemSegments: [[titleDivider, message], [whyMessage], [systemMessage], [remindersMessage], [uniqueMessage], [lastMessage, notificationsIntegrationWidget, cloud]], userInputUnrecognizedString: "", category: .onboarding, answerFormat: [], action: .continueWhatYouWereDoing)
    }
    func getWeight() -> Prompt {
        let titleDivider = createTitleDivider(text: "Your Weight")
        let message = createAssistantMessageItem(text: "I need your weight so I can calculate your daily water needs.")
        let pleaseMessage = createAssistantMessageItem(text: "Please use the keyboard to input it now.")
        let keyboardPopUp = createLaunchKeyboardItem()
        return Prompt(promptType: .getUsersWeight, itemSegments: [[titleDivider, message], [pleaseMessage, keyboardPopUp]], userInputUnrecognizedString: "I am sorry I didn't understand.", category: .onboarding, answerFormat: [], action: .inputUserWeight)
        
    }
}
let hydrateOnboardingPrompts = HydrateOnboardingPrompts()
