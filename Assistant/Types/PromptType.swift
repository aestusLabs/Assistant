//
//  PromptType.swift
//  Breathe
//
//  Created by Ian Kohlert on 2017-12-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
enum PromptType {
    case error, test
    case hydrateHome
    case hydrateHomeGoodMorning
    case home
    
    case hydrateSelectDailyGoal // shows options in onboarding
    case selectMeasurementUnits // user is presented metric and imperial
    case explainHydrateIntervals 
    case explainWaterDangers
    case explainHydrateNotifcations
    case enterWaterAlreadyConsumed
    case showHydrateSetStartOfDay // Gets user to set the start of the first interval
    
    
    case showAllGlobalCommands
    case showAllGlobalCommandsList
    
    case showBeginnerExercises
    case showIntermediateExercises
    case showAdvancedExercises
    
    
    case displayCalmExercises, displayFocusExercises, displayEnergyExercises, displaySleepExercises
    
    case welcome, setName, setfamiliarity, setReadingSpeed, explainVCs, start, newToPranayamaLesson
    
    case showHealthWarning
    case howToChangeAnswer
    
    case learnAboutPranayama // the initial prompt that tells the basics and asks if they want to learn more
    
    case learnAboutExercises

    case learnMoreAboutDeepBreathing
    case learnMoreAboutCountedBreath
    case learnMoreAboutAlternateNostrilBreathing
    case learnMoreAboutCalmingBreath
    case learnMoreAboutBellowsBreath
    case learnMoreAboutShiningSkull
    
    
    case showPranayamaBenefits // explains basic benefits
    case showPranayamaBenefitsInDepth
    case showPostureExplanation
    case showHowToBreathe
    case checkReadingSpeedOK
    
    case selectExercise, guidedStart
    case guidedPurposeOfSession
    case inhale, fullSustain, exhale, emptySustain
    case duration, cycles
    case numberOfBreathsPerCycle
    case breakLengthPerCycle
    case session
    case finishedSession
    case whatCanIHelpWith
    
    
    case showHelp
    case settings, history, newSettings
    
    case showReadingSpeedWidget
    
    case continueMessage
    
    
    case showSubscribe
    case wouldYouLikeToSetNotification
    case chooseDaysForNotification
    case chooseTimeForNotification
    case showConfirmSetNotification
    case askPermissionToSendNotifications
    
    case explainDifferenceBetweenBellowsAndShining
    case explainTheyCanLayWhileDoingPranyama
    case explainTheDots
    
    // Testing below
    case onboarding
    
    case showHowAppWorks
    case showHowAppWorksSettings
}

