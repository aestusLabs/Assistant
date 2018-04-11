//
//  ButtonAction.swift
//  Breathe
//
//  Created by Ian Kohlert on 2017-12-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
enum ButtonAction {
    case none
    
    case showTestPrompt
    
    case iNeedHelp // for help global prompt
    case keyboard
    
    case cancelAnswerChange // for when user expands user message back to buttons
    case customAnswerEntry // for when user expands user message back to buttons

    case showChangeNamePrompt
    case showChangeReadingSpeed
    case showHowExercisesWork // Help Prompt
    case showHelpWithPosture // Help Prompt
    
    case  learnAboutCalmingBreath, learnAboutShiningSkullBreath, learnAboutBellowsBreath, learnAboutAltNostrilBreathing, learnAboutCountedBreath, learnAboutDeepBreathing
    
    case startDeepBreathingSession, startCountedBreathSession, startCalmingBreathSession, startAlternateNostrilBreathSession, startBellowsBreathSession, startShiningSkullSession
    
    case showBeginnerExercises, showIntermediateExercises, showAdvancedExercises

    
    case changeName
    case showAllGlobalCommands
    case learnAboutPosture
    case startBeginnerSession
    case settings, history
    
    case setName
    case setFamiliarityWithPranayama
    case newUserStart
    case showLearnInDepthPranayamaExplanation
    case showLearnInDepthBenefits
    case showLearnMoreAboutPranayamaBenefits
    case showHistory
    case restartSession
    case goToSettings, goToHistory, goToOnboarding
    case showHowAppWorks
    case showExplainDifferenceBetweenBellowsAndShiningSkull
    case showExplainLayWhileExercises
    case showExplainWhatDotsAre
    case selectedExercise
    case selectExercise
    case guidedSelect
    case guidedPurposeOfSession
    
    case showCalmExercises, showFocusExercises, showEnergyExercises, showSleepExercises
    case showPranayamaBasics
    case showHowToBreathe
    case useCurrentPromptAction
    case colourThemeAction
    case colourThemeSpecificsAction
    
    case darkModeOn
    case darkModeOff
    
    case showReadingSpeedWidget
    case setReadingSpeed
    case readingSpeedChange
    case readingSpeedIncrease
    case readingSpeedDecrease
    //    case setInhale, setExhale
    
    case tweet, email, site
    case rate, tellFriends
    case learnAboutPurchase, purchase, restorePurchase
    case learnHowAppWorks, learnAboutExercises
    case darkMode, volume, skillLevel
    
    case inhale, exhale, fullSustain, emptySustain, lengthInSeconds, lengthInCycles
    case numberOfBreathsPerCycle
    case breakLengthPerCycle
    
    case seeMoreOfWhatICanDo
    case continueWhatYouWereDoing
    
    case finishOnboarding
    
    case premiumButton
    case subscribe
    case learnMoreAboutSubscription
    
    
    case turnOffNotifications
    case turnOnNotifications
    case cancelSetDailyNotificaiton
    case setDailyNotification
    case showDailyNotificationChooseDays
    case setNotificationDays
    case setNotificationTime
    case givePermissionForNotifications, refuseToGiveNotificationPermission
    
    case showInhale, showExhale, showFullSustain, showEmptySustain
    
    case varied // for when a prompt has multiple different types
    // testing
    case onboarding
    
    case goToIcons8
    case goToEmilySite
}
