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

func triageBreathActions(action: ButtonAction, userInput: String) -> String? {
    let actions = Actions()
    switch action {
    case .newUserStart:
        actions.breatheActions.addNewUserStartToQueue()
    case .setFamiliarityWithPranayama:
        return actions.breatheActions.howFamiliarWithPranayama(userInput: userInput)
    case .showLearnMoreAboutPranayamaBenefits:
        actions.breatheActions.showLearnMoreAboutBenefits()
    case .selectedExercise:
        return actions.breatheActions.selectedExercise(input: userInput)
    case .showInhale:
        actions.breatheActions.showInhale()
    case .showExhale:
        actions.breatheActions.showExhale()
    case .showFullSustain:
        actions.breatheActions.showFullSustain()
    case .showEmptySustain:
        actions.breatheActions.emptySustain(userInput: userInput)
    case .inhale:
        return actions.breatheActions.inhale(userInput: userInput)
    case .fullSustain:
        return actions.breatheActions.fullSustain(userInput: userInput)
    case .exhale:
        return actions.breatheActions.exhale(userInput: userInput)
    case .emptySustain:
        return actions.breatheActions.emptySustain(userInput: userInput)
    case .lengthInSeconds:
        return actions.breatheActions.duration(userInput: userInput)
    case .lengthInCycles:
        return actions.breatheActions.cycles(userInput: userInput)
    case .numberOfBreathsPerCycle:
        return actions.breatheActions.breathsPerCycle(userInput: userInput)
    case .breakLengthPerCycle:
        return actions.breatheActions.breakLengthCycles(userInput: userInput)
    case .learnAboutExercises:
        actions.breatheActions.showLearnMoreAboutExercises()
    case .learnAboutDeepBreathing:
        actions.breatheActions.showLearnMoreAboutDeepBreathing()
    case .learnAboutCalmingBreath:
        actions.breatheActions.showLearnMoreAboutCalmingBreath()
    case .learnAboutCountedBreath:
        actions.breatheActions.showLearnMoreAboutCountedBreath()
    case .learnAboutShiningSkullBreath:
        actions.breatheActions.showLearnMoreAboutShiningSkullBreath()
    case .learnAboutBellowsBreath:
        actions.breatheActions.showLearnMoreAboutBellowsBreath()
    case .learnAboutAltNostrilBreathing:
        actions.breatheActions.showLearnMoreAboutAlternateNostrilBreath()
    case .startDeepBreathingSession:
        actions.breatheActions.startDeepBreathingSession()
    case .startCountedBreathSession:
        actions.breatheActions.startCountedBreathSession()
    case .startCalmingBreathSession:
        actions.breatheActions.startCalmingBreathSession()
    case .startAlternateNostrilBreathSession:
        actions.breatheActions.startAlternateNostrilBreathingSession()
    case .startShiningSkullSession:
        actions.breatheActions.startShiningSkullBreathSession()
    case .startBellowsBreathSession:
        actions.breatheActions.startBellowsBreathSession()
    case .showBeginnerExercises:
        actions.breatheActions.showBeginnerExercises()
    case .showIntermediateExercises:
        actions.breatheActions.showIntermediateExercises()
    case .showAdvancedExercises:
        actions.breatheActions.showAdvancedExercises()
    case .showSleepExercises:
        actions.breatheActions.showSleepExercises()
    case .showEnergyExercises:
        actions.breatheActions.showEnergyExercises()
    case .showFocusExercises:
        actions.breatheActions.showFocusExercises()
    case .showCalmExercises:
        actions.breatheActions.showCalmExercises()
    case .showPranayamaBasics:
        actions.breatheActions.showPranayamaBasics()
    case .showHowToBreathe:
        actions.breatheActions.showHowToBreathe()
    case .showExplainDifferenceBetweenBellowsAndShiningSkull:
        actions.breatheActions.showExplainDifferenceBetweenBellowsAndShiningSkull()
    case .showExplainLayWhileExercises:
        actions.breatheActions.showLayWhilePractisingPranayama()
    case .selectExercise:
        actions.breatheActions.selectExercise()
    case .guidedSelect:
        actions.breatheActions.guidedSelect()
    default:
        print("Not A Breathe Action")
    }
    return nil
}

func triageAction(action: ButtonAction, userInput: String) -> String?{

    let actions = Actions()

    switch action {
    case .goToOnboarding:
        actions.showOnboarding()
    case .setName:
       return actions.setName(input:userInput)
    case .showReadingSpeedWidget:
        actions.showReadingSpeed()
    case .setReadingSpeed:
        return actions.setReadingSpeed(userInput: userInput)
    case .finishOnboarding:
        actions.finishOnboarding()
    case .goToSettings:
        actions.showSettings()
// MARK: Global
    case .showAllGlobalCommands:
        actions.showAllGlobalCommands()
    case .showChangeReadingSpeed:
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
    case .showTestPrompt:
        actions.showTestPrompt()
    case .showHowAppWorks:
        actions.showHowAppWorks()
    default:
        print("No action match")
    }
    
    let breatheAction = triageBreathActions(action: action, userInput: userInput)
    if let stringToReturn =  breatheAction {
        return stringToReturn
    }
    chatManager.currentPromptType = nil // this is used for re-showing the current prompt after global commands.
    return nil
}




