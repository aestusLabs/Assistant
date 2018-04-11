//
//  ActionTriage.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-01-18.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
func triageAction(action: ButtonAction, userInput: String) -> String?{
//    let sessionFuncs = PromptActionOnSession()
    let actions = Actions()
//    print(" ")
//    print(action)
//    print(" ")
    switch action {
        
    case .goToOnboarding:
        actions.showOnboarding()
    case .newUserStart:
        actions.addNewUserStartToQueue()
        
    case .setName:
       return actions.setName(input:userInput)
    case .showReadingSpeedWidget:
        actions.showReadingSpeed()
    case .setReadingSpeed:
        return actions.setReadingSpeed(userInput: userInput)
    case .setFamiliarityWithPranayama:
        return actions.howFamiliarWithPranayama(userInput: userInput)
        
    case .showLearnMoreAboutPranayamaBenefits:
        actions.showLearnMoreAboutBenefits()

    case .finishOnboarding:
        actions.finishOnboarding()
    case .selectExercise:
       actions.selectExercise()
    case .guidedSelect:
        actions.guidedSelect()
    case .goToSettings:
        actions.showSettings()
        
    case .selectedExercise:
        
       return actions.selectedExercise(input: userInput)
        
        
    case .showInhale:
        actions.showInhale()
    case .showExhale:
        actions.showExhale()
    case .showFullSustain:
        actions.showFullSustain()
    case .showEmptySustain:
        actions.emptySustain(userInput: userInput
        )
        
    case .inhale:
        return actions.inhale(userInput: userInput)
    case .fullSustain:
        return actions.fullSustain(userInput: userInput)
    case .exhale:
        return actions.exhale(userInput: userInput)
    case .emptySustain:
        return actions.emptySustain(userInput: userInput)
    case .lengthInSeconds:
        return actions.duration(userInput: userInput)
    case .lengthInCycles:
        return actions.cycles(userInput: userInput)
    case .numberOfBreathsPerCycle:
        return actions.breathsPerCycle(userInput: userInput)
    case .breakLengthPerCycle:
        return actions.breakLengthCycles(userInput: userInput)

// MARK: Global
    case .showAllGlobalCommands:
        actions.showAllGlobalCommands()
    case .showChangeReadingSpeed:
        
//        if let currentPromptType = chatManager.currentPromptType {
//            chatManager.pendingQueue.insert(currentPromptType, at: 1)
//
//        }
         actions.showReadingSpeed()
        
       
        
    case .readingSpeedIncrease:
        actions.increaseReadingSpeed()
        if let currentPromptType = chatManager.currentPromptType {
            chatManager.pendingQueue.insert(currentPromptType, at: 1)
            
        }
    case .readingSpeedDecrease:
        actions.decreaseReadingSpeed()
        if let currentPromptType = chatManager.currentPromptType {
            chatManager.pendingQueue.insert(currentPromptType, at: 1)
        }
    case .darkModeOn:
        return actions.turnOnDarkMode()
    case .darkModeOff:
        return actions.turnOffDarkMode()

        
    case .premiumButton:
        actions.showSubscribe()
    case .showDailyNotificationChooseDays:
        actions.showChooseNotificationDays()
    case .setNotificationDays:
        actions.setNotificationsDays()
    case .setNotificationTime:
        actions.setNotificationTime()
    case .givePermissionForNotifications:
        actions.givePermissionToShowNotifications()
    case .refuseToGiveNotificationPermission:
        actions.refuseGivePermissionToShowNotifications()
    case .turnOnNotifications:
        return actions.turnOnNotifications()
    case .turnOffNotifications:
        return actions.turnOffNotifications()
        
    case .learnAboutExercises:
        actions.showLearnMoreAboutExercises()
    case .learnAboutDeepBreathing:
        actions.showLearnMoreAboutDeepBreathing()
    case .learnAboutCalmingBreath:
        actions.showLearnMoreAboutCalmingBreath()
    case .learnAboutCountedBreath:
        actions.showLearnMoreAboutCountedBreath()
    case .learnAboutShiningSkullBreath:
        actions.showLearnMoreAboutShiningSkullBreath()
    case .learnAboutBellowsBreath:
        actions.showLearnMoreAboutBellowsBreath()
    case .learnAboutAltNostrilBreathing:
        actions.showLearnMoreAboutAlternateNostrilBreath()
        
        
    case .startDeepBreathingSession:
        actions.startDeepBreathingSession()
    case .startCountedBreathSession:
        actions.startCountedBreathSession()
    case .startCalmingBreathSession:
        actions.startCalmingBreathSession()
    case .startAlternateNostrilBreathSession:
        actions.startAlternateNostrilBreathingSession()
    case .startShiningSkullSession:
        actions.startShiningSkullBreathSession()
    case .startBellowsBreathSession:
        actions.startBellowsBreathSession()
        
    case .showBeginnerExercises:
        actions.showBeginnerExercises()
    case .showIntermediateExercises:
        actions.showIntermediateExercises()
    case .showAdvancedExercises:
        actions.showAdvancedExercises()
        
    case .showSleepExercises:
        actions.showSleepExercises()
    case .showEnergyExercises:
        actions.showEnergyExercises()
    case .showFocusExercises:
        actions.showFocusExercises()
    case .showCalmExercises:
        actions.showCalmExercises()
        
        
    case .showPranayamaBasics:
        actions.showPranayamaBasics()
    case .showHowToBreathe:
        actions.showHowToBreathe()
        
    case .showTestPrompt:
        actions.showTestPrompt()
    case .showHowAppWorks:
        actions.showHowAppWorks()
    case .showExplainDifferenceBetweenBellowsAndShiningSkull:
        actions.showExplainDifferenceBetweenBellowsAndShiningSkull()
        
    case .showExplainLayWhileExercises:
        actions.showLayWhilePractisingPranayama()
        
    default:
        print("No action match")
    }
    
    
    
    
    chatManager.currentPromptType = nil // this is used for re-showing the current prompt after global commands.
    return nil
}


struct Actions {
    
    
    func showTestPrompt() {
        chatManager.pendingQueue.append(.test)
    }
    
    
    // MARK: Onboarding
    func showOnboarding() {
        chatManager.pendingQueue.append(contentsOf: paths.onboardingPromptTypes)
    }
    func setName(input: String) -> String{
        user.name = input
        user.saveToDefaults()
        return "OK, I will call you \(user.name). If you wish to change it at any time you can tap the chat bar and type 'Change my name'."
    }
    
    func howFamiliarWithPranayama(userInput: String) -> String {
        if userInput == "Beginner" {
            
            chatManager.pendingQueue.insert(.learnAboutPranayama, at: 0)
            chatManager.pendingQueue.insert(.showPranayamaBenefits, at: 1)
            chatManager.pendingQueue.insert(.showHowToBreathe, at: 2)
            return "OK then I will start by explaining what Pranayama is."
        } else {
            user.brandNew = false
            user.saveToDefaults()
            return "Excellent, then I'll quickly show you how the app works and you can get started."
        }
    }
    
    
    // MARK: Home
    func selectExercise() {
        chatManager.pendingQueue.append(.selectExercise)
        sessionManager.clearAllValues()
    }
    
    func showSettings() {
        
       
        //chatManager.pendingQueue.append(.settings)
    }
    
    // MARK: Session
    func selectedExercise(input: String) -> String {
        
        var n = ""
        switch input {
        case "Deep Breathing":
            sessionManager.sessionType = .deepBreathing
            
        case "Shining Skull Breath":
            sessionManager.sessionType = .shiningSkull
            
        case "Bellows Breath":
            sessionManager.sessionType = .bellows
            
        case "Calming Breath":
            sessionManager.sessionType = .calming
        case "Counted Breath":
            sessionManager.sessionType = .counted
            
        case "Alternate Nostril Breathing":
            sessionManager.sessionType = .alternateNostril
            n = "n"
        default:
            print("Something went wrong")
        }
        
        chatManager.pendingQueue.append(contentsOf: paths.newSession(session: sessionManager.sessionType))
        return "OK a\(n) \(input) session it is."
    }
    
   
    
    func guidedSelect() {
        sessionManager.clearAllValues()
        chatManager.pendingQueue.append(.guidedPurposeOfSession)
    }
    
    func inhale(userInput: String) -> String{
        let inhaleTimeInSeconds =   myConvert.time(userInput: userInput)
        sessionManager.inhale = inhaleTimeInSeconds
        return "Got it, \(userInput) inhalation length."
    }
    
    func fullSustain(userInput: String) -> String{
        let fullSustainTimeInSeconds = myConvert.time(userInput: userInput)
        sessionManager.fullSustain = fullSustainTimeInSeconds
        return "OK, I set the full sustain length to \(fullSustainTimeInSeconds)."
    }
    
    func exhale(userInput: String) -> String{
        let exhaleTimeInSeconds = myConvert.time(userInput: userInput)
        sessionManager.exhale = exhaleTimeInSeconds
        return "OK, I set the exhale length to \(exhaleTimeInSeconds)."
    }
    func emptySustain(userInput: String) -> String {
        let emptySustainTimeInSeconds = myConvert.time(userInput: userInput)
        sessionManager.emptySustain = emptySustainTimeInSeconds
        return "OK, I set the empty sustain length to \(emptySustainTimeInSeconds)."
    }
    
    func duration(userInput: String) -> String {
        let durationInSeconds = myConvert.time(userInput: userInput)
        sessionManager.totalLengthInSeconds = durationInSeconds
        chatManager.pendingQueue.append(.session)
        return "OK, I set the session duration to \(userInput)."
        
    }
    
    func breathsPerCycle(userInput: String) -> String {
        let numberOfBreaths = myConvert.numberOf(breaths: userInput)
        sessionManager.numberOfBreathsPerCycle = numberOfBreaths
        return "OK, I set the number of breaths per cycle to \(numberOfBreaths)."
    }
    func breakLengthCycles(userInput: String) -> String {
        let breakTime = myConvert.time(userInput: userInput)
        sessionManager.cycleBreakLengthInS = breakTime
        return "OK, I set the break time in between cycles to \(breakTime)."
        
    }
    func cycles(userInput: String) -> String {
        
        let totalCycles = myConvert.cycles(userInput: userInput)
        sessionManager.totalCycles = totalCycles
        let oneCycle = (sessionManager.inhale + sessionManager.fullSustain + sessionManager.exhale + sessionManager.emptySustain) * sessionManager.numberOfBreathsPerCycle
        
        sessionManager.totalLengthInSeconds = (sessionManager.totalCycles * oneCycle) + sessionManager.cycleBreakLengthInS * (sessionManager.totalCycles - 1)
        print(sessionManager.totalLengthInSeconds)
        
        chatManager.pendingQueue.append(.session)
        
        return "OK, I set the number of cycles to \(totalCycles)."
        
    }
    
// MARK: Global
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
    func showSubscribe() {
        chatManager.pendingQueue.insert(.showSubscribe, at: 0)
    }
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
    
    func addNewUserStartToQueue() {
        chatManager.pendingQueue = []
        chatManager.pendingQueue.append(.newToPranayamaLesson)
        user.brandNew = false
        user.saveToDefaults()
    }
    
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
    
    func showLearnMoreAboutBenefits() {
        
        chatManager.pendingQueue.insert(.showPranayamaBenefitsInDepth, at: 0)
    }
    
    
    func showLearnMoreAboutExercises() {
        chatManager.pendingQueue.insert(.learnAboutExercises, at: 0)
    }
    func showLearnMoreAboutDeepBreathing() {
        chatManager.pendingQueue.insert(.learnMoreAboutDeepBreathing, at: 0)
    }
    func showLearnMoreAboutCalmingBreath() {
        chatManager.pendingQueue.insert(.learnMoreAboutCalmingBreath, at: 0)
    }
    func showLearnMoreAboutCountedBreath() {
        chatManager.pendingQueue.insert(.learnMoreAboutCountedBreath, at: 0)
    }
    func showLearnMoreAboutAlternateNostrilBreath() {
        chatManager.pendingQueue.insert(.learnMoreAboutAlternateNostrilBreathing, at: 0)
    }
    func showLearnMoreAboutBellowsBreath() {
        chatManager.pendingQueue.insert(.learnMoreAboutBellowsBreath, at: 0)
    }
    func showLearnMoreAboutShiningSkullBreath() {
        chatManager.pendingQueue.insert(.learnMoreAboutShiningSkull, at: 0)
    }
    
    func showAllGlobalCommands() {
//        chatManager.pendingQueue.insert(.showAllGlobalCommands, at: 0)
    }
    
    
    func startDeepBreathingSession() {
        chatManager.pendingQueue = []
        sessionManager.sessionType = .deepBreathing
        chatManager.pendingQueue.append(contentsOf: paths.newSession(session: sessionManager.sessionType))
    }
    
    func startCountedBreathSession() {
        chatManager.pendingQueue = []
        sessionManager.sessionType = .counted
        chatManager.pendingQueue.append(contentsOf: paths.newSession(session: sessionManager.sessionType))
    }
    
    func startCalmingBreathSession() {
        chatManager.pendingQueue = []
        sessionManager.sessionType = .calming
        chatManager.pendingQueue.append(contentsOf: paths.newSession(session: sessionManager.sessionType))
    }
    
    func startAlternateNostrilBreathingSession() {
        chatManager.pendingQueue = []
        sessionManager.sessionType = .alternateNostril
        chatManager.pendingQueue.append(contentsOf: paths.newSession(session: sessionManager.sessionType))
    }
    func startShiningSkullBreathSession() {
        chatManager.pendingQueue = []
        sessionManager.sessionType = .shiningSkull
        chatManager.pendingQueue.append(contentsOf: paths.newSession(session: sessionManager.sessionType))
    }
    func startBellowsBreathSession() {
        chatManager.pendingQueue = []
        sessionManager.sessionType = .bellows
        chatManager.pendingQueue.append(contentsOf: paths.newSession(session: sessionManager.sessionType))
    }
    
    func showBeginnerExercises() {
        chatManager.pendingQueue = []
        chatManager.pendingQueue.insert(.showBeginnerExercises, at: 0)
    }
    func showIntermediateExercises() {
        chatManager.pendingQueue = []
        chatManager.pendingQueue.insert(.showIntermediateExercises, at: 0)

    }
    func showAdvancedExercises() {
        chatManager.pendingQueue = []
        chatManager.pendingQueue.insert(.showAdvancedExercises, at: 0)
        
    }
    
    func turnOnNotifications() -> String{
        return "OK I will send you a reminder you on the days your set."
    }
    
    func turnOffNotifications() -> String {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["monRequest", "tueRequest", "wedRequest", "thuRequest", "friRequest", "satRequest", "sunRequest"])

        return "OK I turned off notifications. You can re-eneable them by typing 'turn on notifications'."
    }
    
    func showSleepExercises() {
        chatManager.pendingQueue = []
        chatManager.pendingQueue.insert(.displaySleepExercises, at: 0)
    }
    func showEnergyExercises() {
        chatManager.pendingQueue = []
        chatManager.pendingQueue.insert(.displayEnergyExercises, at: 0)
    }
    func showCalmExercises() {
        chatManager.pendingQueue = []
        chatManager.pendingQueue.insert(.displayCalmExercises, at: 0)
    }
    func showFocusExercises() {
        chatManager.pendingQueue = []
        chatManager.pendingQueue.insert(.displayFocusExercises, at: 0)
    }
    
    func showPranayamaBasics() {
        chatManager.pendingQueue.insert(.learnAboutPranayama, at: 0)
    }
    
    func showHowToBreathe() {
        chatManager.pendingQueue.insert(.showHowToBreathe, at: 0)
    }
    func showHowAppWorks() {
        chatManager.pendingQueue.insert(.showHowAppWorks, at: 0)

    }
    func finishOnboarding() {
        user.finishedOnboarding = true
        user.saveToDefaults()
    }
    func showExplainDifferenceBetweenBellowsAndShiningSkull() {
        chatManager.pendingQueue.insert(.explainDifferenceBetweenBellowsAndShining, at: 0)
    }
    func showLayWhilePractisingPranayama() {
        chatManager.pendingQueue.insert(.explainTheyCanLayWhileDoingPranyama, at: 0)
    }
    
    func showWhatAreDots() {
        chatManager.pendingQueue.insert(.explainTheDots, at: 0)
    }
    
    func showInhale() {
        chatManager.pendingQueue.insert(.inhale, at: 0)
    }
    func showExhale() {
        chatManager.pendingQueue.insert(.exhale, at: 0)
    }
    func showFullSustain() {
        chatManager.pendingQueue.insert(.fullSustain, at: 0)
    }
    func showEmptySustain() {
        chatManager.pendingQueue.insert(.emptySustain, at: 0)
    }
}

