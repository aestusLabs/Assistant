//
//  CreatePromptFor.swift
//  Breathe
//
//  Created by Ian Kohlert on 2017-12-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation




func createPromptFor(promptType: PromptType) -> Prompt {
    var prompt = Prompt()
    
    
    if let onboardingPrompt = onboardingPrompts.onboardingPromptFor(promptType: promptType) {
        
        return onboardingPrompt
    }
    if let learningPrompt = learningPrompts.createPromptForLearning(promptType: promptType) {
        return learningPrompt
    }
    
//    // MARK: Onboarding Prompts
//    switch promptType {
//        case .welcome:
//            prompt = onboardingPrompts.welcomeToApp()
//        case .showHealthWarning:
//            prompt = onboardingPrompts.healthWarning()
//        case .setName:
//            prompt = onboardingPrompts.name()
//        case .checkReadingSpeedOK:
//            prompt = onboardingPrompts.readingSpeed()
//
//        case .setfamiliarity:
//            prompt = onboardingPrompts.howFamiliar()
//        case .showPranayamaBenefits:
//            prompt = learningPrompts.benefitsBasics()
//
//        case .showPostureExplanation:
//            prompt = learningPrompts.posture()
//        case .showHowToBreathe:
//            prompt = learningPrompts.breath()
//        case .explainVCs:
//            prompt = onboardingPrompts.explainVCs()
//        case .start:
//            prompt = onboardingPrompts.getStarted()
//        case .newToPranayamaLesson:
//            prompt = onboardingPrompts.newToPranayama()
//    case .learnAboutPranayama:
//        prompt = learningPrompts.learnPranayamaBasics()
//
//
//
//
//        default:
//            print("Not an onboarding prompt")
//        }
//
    
//    // MARK: Learn More
//    switch promptType {
//    case .showPranayamaBenefitsInDepth:
//        prompt = learningPrompts.benefitsInDepth()
//    default:
//        print("Not a learn more prompt")
//    }
    
    // MARK Session Prompts
    switch promptType {
        case .selectExercise:
            prompt = sessionPrompts.selectExercise()
        case .guidedStart:
            prompt = sessionPrompts.guidedStart()
        case .inhale:
            prompt = sessionPrompts.inhale(sessionType: sessionManager.sessionType) //createPromptInhale(sessionType: sessionManager.sessionType)
        case .fullSustain:
            prompt = sessionPrompts.fullSustain(sessionType: sessionManager.sessionType)
        case .exhale:
            prompt = sessionPrompts.exhale(sessionType: sessionManager.sessionType)
        case .emptySustain:
            prompt = sessionPrompts.emptySustain(sessionType: sessionManager.sessionType)
        case .duration:
            prompt = sessionPrompts.duration(sessionType: sessionManager.sessionType)
        case .numberOfBreathsPerCycle:
            prompt = sessionPrompts.numberOfBreathsPerCycle()
        case .breakLengthPerCycle:
            prompt = sessionPrompts.breakLengthForCycle()
        case .cycles:
            prompt = sessionPrompts.numberOfCycles(sessionType: sessionManager.sessionType)
        case .session:
            prompt = sessionPrompts.session(sessionType: sessionManager.sessionType)
        case .finishedSession:
            prompt = sessionPrompts.finishedSession()
        default:
            print("Not an session prompt")
        }
    
    switch promptType {
        case .home:
            prompt = homePrompt.createBreathePrompt() //homePrompt.createPrompt()
        case .guidedPurposeOfSession:
            prompt = otherPrompts.guidedPurposeOfSession()
        case .settings:
            prompt = otherPrompts.settings()
        default:
            print("Not home prompt")
        }
    
    switch promptType {
        case .chooseDaysForNotification:
            prompt = notificationPrompts.chooseDaysForNotifications()
        case .chooseTimeForNotification:
            prompt = notificationPrompts.chooseTimeForNotifications()
        case .showConfirmSetNotification:
            prompt = notificationPrompts.createConfirmSetNotificationPrompt()
        case .askPermissionToSendNotifications:
            prompt = notificationPrompts.createAskPermissionToSendNotifications()
        default:
            print("Not notification prompt")
        }
    
    switch promptType {
    case .showHowAppWorks:
        prompt = globalPrompts.howAppWorks()
    case .showHowAppWorksSettings:
        prompt = globalPrompts.settingsHowAppWorks()
    case .showAllGlobalCommands:
        prompt = globalPrompts.showAllGlobalCommands()
    case .showAllGlobalCommandsList:
        prompt = globalPrompts.showAllGlobalCommandsAsList()
    case .learnAboutExercises:
            prompt = globalPrompts.learnAboutExercisesPrompt()
        case .whatCanIHelpWith:
            prompt = otherPrompts.createWhatCanIHelpYouWithPrompt()
        case .showReadingSpeedWidget:
            prompt = globalPrompts.setReadingSpeed()
        
        case .continueMessage:
            prompt = globalPrompts.continuePrompt()
        
        case .showSubscribe:
            prompt = otherPrompts.createWouldYouLikeToSubscribePrompt()
        
    case .showBeginnerExercises:
        prompt = globalPrompts.showBeginnerExercises()
    case .showIntermediateExercises:
        prompt = globalPrompts.showIntermediateExercises()
    case .showAdvancedExercises:
        prompt = globalPrompts.showAdvancedExercises()
        
        
    case .test:
        prompt = otherPrompts.testPrompt()
        default:
            print("Not other prompt")
        }
    
    
    switch promptType {
    case .displayCalmExercises:
        prompt = globalPrompts.showCalmExercises()
    case .displayEnergyExercises:
        prompt = globalPrompts.showEnergyExercises()
    case .displaySleepExercises:
        prompt = globalPrompts.showSleepExercises()
    case .displayFocusExercises:
        prompt = globalPrompts.showFocusExercises()
    case .explainDifferenceBetweenBellowsAndShining:
        prompt = globalPrompts.differenceBetweenBellowsAndShining()
    case .explainTheyCanLayWhileDoingPranyama:
        prompt = globalPrompts.explainIfTheyCanLayToPracticePranayama()
    case .explainTheDots:
        prompt = globalPrompts.explainDotsMeaning()
        
    default:
        print("Not A Display By Type Prompt")
    }
    
    return prompt
}

