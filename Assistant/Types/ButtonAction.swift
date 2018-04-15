//
//  ButtonAction.swift
//  Breathe
//
//  Created by Ian Kohlert on 2017-12-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
enum ButtonAction {
    
    // Hydrate Only
    case addWater
    case showInputAddWaterPrompt
    case addWaterToPreviousInterval
    case changeHydrateGoal
    case muteHydrateReminderNotifications
    
    case showCalculateDailyHydrationGoalPrompt
    case setDailyHydrationGoal
    
    case setMeasurementUnits // sets metric or imperial in hydrateAssistant
    case setHydrateStartTime // Sets the start of the first interval
    
    case showInputStartTimePrompt // TODO: This is unimplmented
    
    
    // Breathe Only
    case breakLengthPerCycle
    case emptySustain
    case exhale
    case fullSustain
    case guidedPurposeOfSession
    case guidedSelect
    case inhale
    case learnAboutAltNostrilBreathing
    case learnAboutBellowsBreath
    case learnAboutCalmingBreath
    case learnAboutCountedBreath
    case learnAboutDeepBreathing
    case learnAboutExercises
    case learnAboutPosture
    case learnAboutShiningSkullBreath
    case lengthInCycles
    case lengthInSeconds
    case numberOfBreathsPerCycle
    case selectExercise
    case selectedExercise
    case setFamiliarityWithPranayama
    case showAdvancedExercises
    case showBeginnerExercises
    case showCalmExercises
    case showEmptySustain
    case showEnergyExercises
    case showExhale
    case showExplainDifferenceBetweenBellowsAndShiningSkull
    case showExplainLayWhileExercises
    case showExplainWhatDotsAre
    case showFocusExercises
    case showFullSustain
    case showHelpWithPosture // Help Prompt
    case showHowExercisesWork // Help Prompt
    case showHowToBreathe
    case showInhale
    case showIntermediateExercises
    case showLearnInDepthBenefits
    case showLearnInDepthPranayamaExplanation
    case showLearnMoreAboutPranayamaBenefits
    case showPranayamaBasics
    case showSleepExercises
    case skillLevel
    case startAlternateNostrilBreathSession
    case startBeginnerSession
    case startBellowsBreathSession
    case startCalmingBreathSession
    case startCountedBreathSession
    case startDeepBreathingSession
    case startShiningSkullSession
    
    
    // General
    case cancelAnswerChange
    case cancelSetDailyNotification// for when user expands user message back to buttons
    case changeName
    case colourThemeAction
    case colourThemeSpecificsAction
    case continueWhatYouWereDoing
    case customAnswerEntry // for when user expands user message back to buttons
    case darkMode
    case darkModeOff
    case darkModeOn
    case email
    case finishOnboarding
    case givePermissionForNotifications
    case goToEmilySite
    case goToHistory
    case goToIcons8
    case goToOnboarding
    case goToSettings
    case history
    case iNeedHelp // for help global prompt
    case keyboard
    case learnAboutPurchase
    case learnHowAppWorks
    case learnMoreAboutSubscription
    case newUserStart
    case none
    case onboarding
    case premiumButton
    case purchase
    case rate
    case readingSpeedChange
    case readingSpeedDecrease
    case readingSpeedIncrease
    case refuseToGiveNotificationPermission
    case restartSession
    case restorePurchase
    case seeMoreOfWhatICanDo
    case setDailyNotification
    case setName
    case setNotificationDays
    case setNotificationTime
    case setReadingSpeed
    case settings
    case showAllGlobalCommands
    case showChangeNamePrompt
    case showChangeReadingSpeed
    case showDailyNotificationChooseDays
    case showHistory
    case showHowAppWorks
    case showReadingSpeedWidget
    case showTestPrompt
    case site
    case subscribe
    case tellFriends
    case turnOffNotifications
    case turnOnNotifications
    case tweet
    case useCurrentPromptAction
    case varied // for when a prompt has multiple different types
    case volume
}
