//
//  BreatheActions.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-11.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
struct BreatheActions {
    // MARK: Onboarding
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
    func addNewUserStartToQueue() {
        chatManager.pendingQueue = []
        chatManager.pendingQueue.append(.newToPranayamaLesson)
        user.brandNew = false
        user.saveToDefaults()
    }
    
    // MARK: Session
    func selectExercise() {
        chatManager.pendingQueue.append(.selectExercise)
        sessionManager.clearAllValues()
    }
    
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
    
    // MARK: Learn
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
    
    
    func showExplainDifferenceBetweenBellowsAndShiningSkull() {
        chatManager.pendingQueue.insert(.explainDifferenceBetweenBellowsAndShining, at: 0)
    }
    func showLayWhilePractisingPranayama() {
        chatManager.pendingQueue.insert(.explainTheyCanLayWhileDoingPranyama, at: 0)
    }
    
    func showWhatAreDots() {
        chatManager.pendingQueue.insert(.explainTheDots, at: 0)
    }
    
    // MARK: Global
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
}
