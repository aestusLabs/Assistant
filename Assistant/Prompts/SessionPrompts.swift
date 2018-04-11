//
//  SessionPrompts.swift
//  Breathe
//
//  Created by Ian Kohlert on 2017-12-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation

import UIKit


//func createButtonCloudButtonsArray(titles: [String], premiumButtonsTitles: [String], action: ButtonAction) -> ButtonCloudData {
//    var array: [(title: String, action: ButtonAction)] = []
//    var premiumArray: [(title: String, action: ButtonAction)] = []
//    for title in titles {
//        array.append((title: title, action: action))
//    }
//
//
//
//    return createButtonCloud(buttons: array)
//
//
//}


//Spelling And Grammar Checked
struct SessionPrompts {
    func selectExercise() -> Prompt{//Spelling And Grammar Checked
        let titleDivider = createTitleDivider(text: "Create New Session")
        let message = createAssistantMessageItem(text: "Select the exercise you'd like to do:" )
        
        let button1 = ButtonData(title: "Deep Breathing", action: .selectedExercise, global: false, premium: false)
        let button5 = ButtonData(title: "Shining Skull Breath", action: .selectedExercise, global: false, premium: true)
        let button6 = ButtonData(title: "Bellows Breath", action: .selectedExercise, global: false, premium: true)
        let button4 = ButtonData(title: "Calming Breath", action: .selectedExercise, global: false, premium: true)
        let button2 = ButtonData(title: "Counted Breath", action: .selectedExercise, global: false, premium: true)
        let button3 = ButtonData(title: "Alternate Nostril Breathing", action: .selectedExercise, global: false, premium: true)
        
        let buttons = createButtonCloud(buttons: [button1, button2, button3, button4, button5, button6], promptType: .selectExercise)
        buttons.typeableAnswer = false
        
        
        var messageWithButtonsArray: [Item] = [titleDivider, message]
        messageWithButtonsArray.append(buttons)
        
//        print(messageWithButtonsArray)
        
        
        let prompt = Prompt(promptType: .selectExercise, itemSegments: [messageWithButtonsArray], userInputUnrecognizedString: "", category: .session, answerFormat: [], action: .none)
        return prompt
    }
    func guidedStart() -> Prompt { //Spelling And Grammar Checked
        let titleDivider = createTitleDivider(text: "Guided Start")
        let message = createAssistantMessageItem(text: "I'm happy to help you find the right exercise.")
        let goalMessage = createAssistantMessageItem(text: "What is the goal of this session?")
        
        return Prompt(promptType: .guidedStart, itemSegments: [[titleDivider, message, goalMessage]], userInputUnrecognizedString: "", category: .session, answerFormat: [], action: .none)
    }
    
    func learnMoreAboutDeepBreathing() { //Spelling And Grammar Checked
        let titleDiver = createTitleDivider(text: "Learn About Deep Breathing")
        let message1 = "Deep Breathing is the conscious monitoring and lengthening of your breath."
        let message2 = """
                Deep Breathing offers many benefits. Including:
                * Slowing your heart rate
                * Lowering your blood pressure
                * Reduce stress and anxiety
                * Train your lungs to absorb more oxygen
                * And more
            """
        let message3 = """
                Practicing Deep Breathing is quite straight forward.
            * Sit up straight (from the floor or on a chair)
                * Breathe from your abdomen
        You want your breath to be as deep as possible. (Without straining)
        """
    }
    
    
    func inhale(sessionType: SessionType) -> Prompt {//Spelling And Grammar Checked
        var message = ""
        var buttonTitles: [String] = []
        
        
        let titleDivider = createTitleDivider(text: "Inhalation Length")
        switch sessionType {
        case .deepBreathing:
            message = "How many seconds would you like to inhale for? Don't strain yourself, the shorter the easier it will be. (If you're not seeing the length you want, just type the number in.)"
            
            if user.skillLevel == .beginner {
                buttonTitles = ["2 seconds", "3 seconds", "4 seconds"]
            } else if user.skillLevel == .intermediate {
                buttonTitles = ["3 seconds", "4 seconds", "5 seconds"]
            } else if user.skillLevel == .advanced {
                buttonTitles = ["4 seconds", "5 seconds", "6 seconds"]
               
            }
            
            
        case .shiningSkull:
            message = "How many seconds would you like to inhale for? (Beginners should select longer inhalation length.)"
            buttonTitles = ["1 second", "2 seconds", "3 seconds"]
            
        case .bellows:
            message = "How many seconds would you like to inhale for? (Beginners should select longer inhale length.)"
            buttonTitles = ["1 second", "2 seconds", "3 seconds"]
            
            //        case "Calming Breath":
            //            message = "How many seconds would you like to inhale for? (Beginners should select longer inhale length)"
            //            buttonTitles = ["1 seconds", "2 seconds", "3 seconds"]
            
        case .counted:
            message = "How many seconds would you like to inhale for?"
            buttonTitles = ["2 seconds", "3 seconds", "4 seconds"]
            
        case .alternateNostril:
            message = "How many seconds would you like to inhale for?"
            buttonTitles = ["2 seconds", "3 seconds", "4 seconds"]
            
            
        default:
            print("Error")
        }

        var buttons: [ButtonData] = [] // createButtonCloudButtonsArray(titles: buttonTitles, premiumButtonsTitles: [], action: .inhale)

        
   
        
        for title in buttonTitles {
           let premiumBool = checkIfPremiumButtonForNumberButtons(buttonTitle: title, maxNumber: 4)
            let button = ButtonData(title: title, action: .inhale, global: false, premium: premiumBool)
            buttons.append(button)
        }
        
        let buttonCloud = createButtonCloud(buttons: buttons, promptType: .inhale)
        
        let messageView = createAssistantMessageItem(text: message)
        

        let prompt = Prompt(promptType: .inhale, itemSegments: [[titleDivider, messageView, buttonCloud]], userInputUnrecognizedString: "I am sorry, I couldn't understant you. If you were trying to answer my current question try something like this: '3 seconds'", category: .session, answerFormat: answerFormat.numberAndTimeModifier, action: .inhale)
        
        return prompt
        
    }
    
    func exhale(sessionType: SessionType) -> Prompt {//Spelling And Grammar Checked
        var messageText = ""
        var buttonTitles: [String] = []
        let titleDivider = createTitleDivider(text: "Exhalation Length")
        switch sessionType {
        case .deepBreathing:
            messageText = "How many seconds would you like to exhale for? The shorter the time the easier it will be."
      
            
            buttonTitles = ["\(sessionManager.inhale) seconds", "\((sessionManager.inhale * 2 - sessionManager.inhale ) / 2 + sessionManager.inhale) seconds", "\(sessionManager.inhale * 2) seconds"]
          
            
        case .shiningSkull:
            messageText = "How many seconds would you like to exhale for? (Beginners should select longer exhale length)"
            buttonTitles = ["1 second", "2 seconds", "3 seconds"]
            
        case .bellows:
            messageText = "How many seconds would you like to exhale for? (Beginners should select a longer exhalation length)"
            buttonTitles = ["1 second", "2 seconds", "3 seconds"]
            
            //        case "Calming Breath":
            //            message = "How many seconds would you like to inhale for? (Beginners should select longer inhale length)"
            //            buttonTitles = ["1 seconds", "2 seconds", "3 seconds"]
            
        case .counted:
            messageText = "How many seconds would you like to exhale for?"
//            buttonTitles = ["2 seconds", "3 seconds", "4 seconds"]
            buttonTitles = ["\(sessionManager.inhale) seconds", "\((sessionManager.inhale * 2 - sessionManager.inhale ) / 2 + sessionManager.inhale) seconds", "\(sessionManager.inhale * 2) seconds"]

            
        case .alternateNostril:
            messageText = "How many seconds would you like to exhale for?"
//            buttonTitles = ["2 seconds", "3 seconds", "4 seconds"]
            buttonTitles = ["\(sessionManager.inhale) seconds", "\((sessionManager.inhale * 2 - sessionManager.inhale ) / 2 + sessionManager.inhale) seconds", "\(sessionManager.inhale * 2) seconds"]

            
        default:
            print("Error")
        }
        messageText.append((" If you're not seeing the length you want, just type the number in."))
        let message = createAssistantMessageItem(text: messageText )
        

        var buttons: [ButtonData] = [] // createButtonCloudButtonsArray(titles: buttonTitles, premiumButtonsTitles: [], action: .inhale)
        
        
        for title in buttonTitles {
            let premiumBool = checkIfPremiumButtonForNumberButtons(buttonTitle: title, maxNumber: 6)
            let button = ButtonData(title: title, action: .exhale, global: false, premium: premiumBool)
            buttons.append(button)
        }
        
        let buttonCloud = createButtonCloud(buttons: buttons, promptType: .exhale)
        
        
        let prompt = Prompt(promptType: .exhale, itemSegments: [[titleDivider, message, buttonCloud]], userInputUnrecognizedString: "I am sorry I couldn't understant you. If you were trying to answer my current question try something like this: '3 seconds'", category: .session, answerFormat: answerFormat.numberAndTimeModifier, action: .exhale)
        return prompt
    }
    
    
    func fullSustain(sessionType: SessionType) -> Prompt { //Spelling And Grammar Checked
        let titleDivider = createTitleDivider(text: "Full Lung Sustain Length")
        let message = createAssistantMessageItem(text: "How many seconds would you like to sustain your breath with full lungs?")

        var buttonTitles = ["0 seconds", "2 seconds", "3 seconds", "4 seconds"]
        if user.skillLevel != .beginner || user.skillLevel != .newby {
            buttonTitles = ["0 seconds", "4 seconds", "6 seconds", "8 seconds"]
        }
        var buttons: [ButtonData] = []
        
        
        for title in buttonTitles {
            let premiumBool = checkIfPremiumButtonForNumberButtons(buttonTitle: title, maxNumber: 3)

            let button = ButtonData(title: title, action: .fullSustain, global: false, premium: premiumBool)
            buttons.append(button)
        }
        
        let buttonCloud = createButtonCloud(buttons: buttons, promptType: .fullSustain)
        
        
        
        let prompt = Prompt(promptType: .fullSustain, itemSegments: [[titleDivider, message, buttonCloud]], userInputUnrecognizedString: "I am sorry I couldn't understant you. If you were trying to answer my current question try something like this: '3 seconds'", category: .session, answerFormat: answerFormat.numberAndTimeModifier, action: .fullSustain)
        
        return prompt
    }
    
    func emptySustain(sessionType: SessionType) -> Prompt { //Spelling And Grammar Checked
        let titleDivider = createTitleDivider(text: "Empty Lung Sustain Length")

        let message = createAssistantMessageItem(text: "How many seconds would you like to sustain your breath with empty lungs?" )

        
        var buttonTitles = ["0 seconds", "2 seconds", "3 seconds", "4 seconds"]
        if user.skillLevel != .beginner || user.skillLevel != .newby {
            buttonTitles = ["0 seconds", "4 seconds", "6 seconds", "8 seconds"]
        }
        var buttons: [ButtonData] = []
        
        
        for title in buttonTitles {
            let premiumBool = checkIfPremiumButtonForNumberButtons(buttonTitle: title, maxNumber: 3)

            let button = ButtonData(title: title, action: .emptySustain, global: false, premium: premiumBool)
            buttons.append(button)
        }
        
        let buttonCloud = createButtonCloud(buttons: buttons, promptType: .emptySustain)
        
        

        let prompt = Prompt(promptType: .emptySustain, itemSegments: [[titleDivider, message, buttonCloud]], userInputUnrecognizedString: "I am sorry I couldn't understant you. If you were trying to answer my current question try something like this: '3 seconds'", category: .session, answerFormat: answerFormat.numberAndTimeModifier, action: .emptySustain)
        
        return prompt
    }
    
    func duration(sessionType: SessionType) -> Prompt { //Spelling And Grammar Checked
        let titleDivider = createTitleDivider(text: "Session Length")

        let message = createAssistantMessageItem(text: "How long do you wish your session to last?")
        

        let buttonTitles = ["5 minutes", "10 minutes", "15 minutes"]
        var buttons: [ButtonData] = []
        
        
        for title in buttonTitles {
            let premiumBool = checkIfPremiumButtonForNumberButtons(buttonTitle: title, maxNumber: 5)

            let button = ButtonData(title: title, action: .lengthInSeconds, global: false, premium: premiumBool)
            buttons.append(button)
        }
        
        let buttonCloud = createButtonCloud(buttons: buttons, promptType: .duration)
        
        
        
        let prompt = Prompt(promptType: .duration, itemSegments: [[titleDivider, message, buttonCloud]], userInputUnrecognizedString: "I am sorry I couldn't understant you. If you were trying to answer my current question try something like this: '3 minutes'", category: .session, answerFormat: answerFormat.numberAndTimeModifier, action: .lengthInSeconds)
        
        return prompt
    }
    
    func numberOfBreathsPerCycle() -> Prompt {
        let titleDivider = createTitleDivider(text: "Number Of Breaths/Cycles")
        let message = createAssistantMessageItem(text: "How many breaths would you like to take per cycle?")
        let buttonTitles = ["5 Breaths", "10 Breaths", "15 Breaths"]
        var buttons: [ButtonData] = []
        for title in buttonTitles {
            let premiumBool = checkIfPremiumButtonForNumberButtons(buttonTitle: title, maxNumber: 10)
            
            let button = ButtonData(title: title, action: .numberOfBreathsPerCycle, global: false, premium: premiumBool)
            buttons.append(button)
        }
        let buttonCloud = createButtonCloud(buttons: buttons, promptType: .numberOfBreathsPerCycle)
        let prompt = Prompt(promptType: .numberOfBreathsPerCycle, itemSegments: [[titleDivider, message, buttonCloud]], userInputUnrecognizedString: "I am sorry I couldn't understant you. If you were trying to answer my current question try something like this: '12 breaths'", category: .session, answerFormat: answerFormat.numberAndBreaths, action: .numberOfBreathsPerCycle)
        
        return prompt

        
    }
    func breakLengthForCycle() -> Prompt { //Spelling And Grammar Checked
        let titleDivider = createTitleDivider(text: "Break Time Per Cycle")
        let message = createAssistantMessageItem(text: "How long of break would you like to take in between each cycle?")
        let buttonTitles = ["15 Seconds", "30 Seconds", "45 Seconds"]
        var buttons: [ButtonData] = []
        for title in buttonTitles {
            let premiumBool = checkIfPremiumButtonForNumberButtons(buttonTitle: title, maxNumber: 15)
            
            let button = ButtonData(title: title, action: .breakLengthPerCycle, global: false, premium: premiumBool)
            buttons.append(button)
        }
        let buttonCloud = createButtonCloud(buttons: buttons, promptType: .breakLengthPerCycle)
        let prompt = Prompt(promptType: .breakLengthPerCycle, itemSegments: [[titleDivider, message, buttonCloud]], userInputUnrecognizedString: "I am sorry I couldn't understant you. If you were trying to answer my current question try something like this: '20 seconds'", category: .session, answerFormat: answerFormat.numberAndBreaths, action: .breakLengthPerCycle)
        
        return prompt
    }
    
    func numberOfCycles(sessionType: SessionType) -> Prompt { //Spelling And Grammar Checked
        let titleDivider = createTitleDivider(text: "Number Of Cycles")
        let message = createAssistantMessageItem(text: "How many cycles would you like to do?")
        
        
        
        let buttonCloud = createButtonCloudFrom(titles: ["1 cycle", "2 cycles", "3 cycles"], action: .lengthInCycles, global: false, premium: false, promptType: .cycles)
        let prompt = Prompt( promptType: .cycles, itemSegments: [[titleDivider, message, buttonCloud]], userInputUnrecognizedString: "I am sorry I couldn't understant you. If you were trying to answer my current question try something like this: '20 cycles'", category: .session, answerFormat: [], action: .lengthInCycles)
        return prompt
    }
    
    func session(sessionType: SessionType) -> Prompt{ //Spelling And Grammar Checked
        let titleDivider = createTitleDivider(text: "Session")
        let message = createAssistantMessageItem(text: "Find a comfortable position, take a few normal breaths and then tap the lungs below to start.")
        
        let widget = createPlayableWidgetItem(session: sessionManager.createSessionFromManager())
//        let widget = createSessionWidget(screenWidth: appInfo.widgetWidth)
//        widget.type = .widget
//        widget.title.text = sessionManager.getSessionTypeString()
        // widget // add to items array
        let prompt = Prompt(promptType: .session, itemSegments: [[titleDivider, message], [widget]], userInputUnrecognizedString: "", category: .session, answerFormat: [], action: .none)
        return prompt
    }
    
   
    
    func finishedSession() -> Prompt { //Spelling And Grammar Checked
        let titleDivider = createTitleDivider(text: "Finished Session")
        let message = createAssistantMessageItem(text: "Good job finishing that \(myConvert.stringFrom(sessionType: sessionManager.sessionType)) session.")
        
        
        let healthIntegrationMessage = createAssistantMessageItem(text: "Would you like to integrate Breath with Apple Health?")
        let integrationWidget = createIntegrationWidget(text: "Apple Health", image: #imageLiteral(resourceName: "Heart"), isToggled: false)

        var healthIntegrationItems: [Item] = []
        if user.healthIntegration == false && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone {
            healthIntegrationItems = [healthIntegrationMessage, integrationWidget]
        }
        
        var notificationItems: [Item] = []
        if user.permissionToShowNotifications == false {
            let notificationMessage = createAssistantMessageItem(text: "Would you like to recieve a daily reminder to Breathe?")
            let yesButton = ButtonData(title: "Choose Notification Days", action: .showDailyNotificationChooseDays, global: false, premium: false)
            let notificationCloud = createButtonCloud(buttons: [yesButton], promptType: .finishedSession)
            notificationItems = [notificationMessage, notificationCloud]
        }
        if notificationItems.isEmpty == false && healthIntegrationItems.isEmpty == false {
            let randomNumber  = arc4random_uniform(2)
            if randomNumber == 0 {
                healthIntegrationItems = []
            } else {
                notificationItems = []
            }
            
        }
        
        let navigationMessage = createAssistantMessageItem(text: "Remember you can always swipe Home but I thought I'd give you some options for things to do now.")
        let restartButton = ButtonData(title: "Restart Session", action: .restartSession, global: false, premium: false)
        let newSessionButton = ButtonData(title: "Select Exercise", action: .selectExercise, global: false, premium: false)
        let historyButton = ButtonData(title: "View History", action: .showHistory, global: false, premium: false)
        let changeReminderButtons = ButtonData(title: "Change Daily Reminder", action: .setDailyNotification, global: false, premium: false)
        let settingsButton = ButtonData(title: "Settings", action: .goToSettings, global: false, premium: false)
        let buttonColoud = createButtonCloud(buttons: [restartButton, newSessionButton, historyButton, changeReminderButtons, settingsButton], promptType: .finishedSession)
        
//        let pointsEarnedForFinish = calculatePoints.calculatePointsEarnedForCompletingSession(lengthOfSessionInMinutes: sessionManager.totalLengthInSeconds * 60)
//        let finishedItem = PointsItem(image: #imageLiteral(resourceName: "Lungs"), typeLabel: "Completed Session", pointsLabel: "\(pointsEarnedForFinish) points)" )
//        let finishPoints =  createPointsItemViewFor(item: finishedItem)
//        let widget = createPointsWidget(screenWidth: appInfo.widgetWidth, pointsItems: [finishPoints], totalPoints: pointsEarnedForFinish)
        
        var segments = [[titleDivider, message]]
        if notificationItems.isEmpty == false {
            segments.append(notificationItems)
        }
        if healthIntegrationItems.isEmpty == false {
            segments.append(healthIntegrationItems)
        }
        segments.append([navigationMessage, buttonColoud])
        //[[titleDivider, message], notificationItems, healthIntegrationItems, [navigationMessage, buttonColoud]]
        
        let prompt = Prompt( promptType: .finishedSession, itemSegments: segments , userInputUnrecognizedString: "", category: .session, answerFormat: [], action: .none)
            
//            Prompt(title: "Finished", promptType: .finishedSession, items: [message], buttons: ["Home", "New Session" ,"Restart"], userInputUnrecognizedString: "", category: .session, answerFormat: [], action: .none)
        return prompt
    }
    
}

func checkIfPremiumButtonForNumberButtons(buttonTitle: String, maxNumber: Int) -> Bool{
    let titleComponents = buttonTitle.components(separatedBy: " ")
    var premiumButton = false
    if titleComponents.count > 0 {
        if let number = Int(titleComponents[0]) {
            if number > maxNumber {
                premiumButton = true
            }
        }
    }
    return premiumButton
}


func createButtonCloudFrom(titles: [String], action: ButtonAction, global: Bool, premium: Bool, promptType: PromptType) -> ButtonCloudData {
    
    let buttonTitles = titles
    var buttons: [ButtonData] = []
    
    
    for title in buttonTitles {
        var premiumBool = checkIfPremiumButtonForNumberButtons(buttonTitle: title, maxNumber: 5)
        
        if premium {
            premiumBool = true
        }
        
        let button = ButtonData(title: title, action: action, global: global, premium: premiumBool)
        buttons.append(button)
    }
    
    return createButtonCloud(buttons: buttons, promptType: promptType)
    
}

let sessionPrompts = SessionPrompts()
