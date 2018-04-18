//
//  Paths.swift
//  Breathe
//
//  Created by Ian Kohlert on 2017-12-14.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
struct Path {
    let onboarding = [onboardingPrompts.welcomeToApp(), onboardingPrompts.name(), onboardingPrompts.howFamiliar(), onboardingPrompts.readingSpeed(), onboardingPrompts.explainVCs()]
    
    func getOnboardingPath() -> [PromptType]  {
        if appInfo.appType == .breathe {
            return [.welcome, .setName, .setfamiliarity, .showHealthWarning, .checkReadingSpeedOK, .howToChangeAnswer, .explainVCs]
        } else {
            return [ .welcome, .setName,  .explainHydrateIntervals, .explainHydrateNotifcations,  .selectMeasurementUnits, .hydrateSelectDailyGoal, .explainWaterDangers, .checkReadingSpeedOK, .howToChangeAnswer, .explainVCs]
        }
    }
//    let onboardingPromptTypes: [PromptType] = [.welcome, .setName, .setfamiliarity, .showHealthWarning, .checkReadingSpeedOK, .howToChangeAnswer, .explainVCs]
    
//    let hydrateOnboardingPromptTypes: [PromptType] = [.welcome, .setName,  .explainHydrateIntervals, .selectMeasurementUnits, .hydrateSelectDailyGoal, .enterWaterAlreadyConsumed, .explainWaterDangers, .checkReadingSpeedOK, .howToChangeAnswer, .explainVCs]
    
    
    
    func newSession(session: SessionType) -> [PromptType] {
        //     return getPromptsForNewSession(type: session)
        return getPromptTypesForNewSession(type: session)
    }
    
    func getPromptTypesForNewSession(type: SessionType) -> [PromptType] {
        if type == .deepBreathing {
            if user.skillLevel == .beginner {
                return [.inhale, .exhale, .duration]
            } else {
                return [.inhale, .fullSustain, .exhale, .emptySustain, .duration]
            }
        } else  if type == .calming {
            sessionManager.inhale = 4
            sessionManager.fullSustain = 7
            sessionManager.exhale = 8
            sessionManager.totalCycles = 4
            sessionManager.calcualteTotalLengthInSecondsFromCycles()
            sessionManager.sessionType = .calming
            return [.session]
        } else if type == .alternateNostril {
            sessionManager.sessionType = .alternateNostril
            return [.inhale, .fullSustain, .exhale, .emptySustain, .duration]
            
            
        } else if type == .counted {
            if user.skillLevel == .beginner {
                return [.inhale, .exhale, .duration]
            } else {
                return [.inhale, .fullSustain, .exhale, .emptySustain, .duration]
            }
        } else if type == .bellows {
            return [.inhale, .exhale, .numberOfBreathsPerCycle, .breakLengthPerCycle, .cycles]
        } else if type == .shiningSkull {
            return [.inhale, .exhale, .numberOfBreathsPerCycle, .breakLengthPerCycle, .cycles]
        }
        
        return  [.inhale, .exhale, .duration]
    }
    
    func getPromptsForNewSession(type: SessionType) -> [Prompt]{
        // TODO Below
        //        if session == .deepBreathing {
        //            if user.skillLevel != .beginner {
        //                return [sessionPrompts.inhale(sessionType: .deepBreathing), sessionPrompts.fullSustain(sessionType: "Deep Breathing"), sessionPrompts.exhale(sessionType: "Deep Breathing"), sessionPrompts.emptySustain(sessionType: "Deep Breathing")]
        //            } else {
        //                return [sessionPrompts.inhale(sessionType: .deepBreathing), sessionPrompts.exhale(sessionType: .deepBreathing)]
        //            }
        //        }
        
        // have an if switch statement for type with a default for most things
        // Calm returns specific values
        // Default if beginner/ if else
        if type == .calming {
            sessionManager.inhale = 4
            sessionManager.fullSustain = 7
            sessionManager.exhale = 8
            sessionManager.totalCycles = 4
            sessionManager.calcualteTotalLengthInSecondsFromCycles()
            sessionManager.sessionType = .calming
            return [sessionPrompts.session(sessionType: sessionManager.sessionType)]
        } else if type == .alternateNostril {
            sessionManager.sessionType = .alternateNostril
            return  [sessionPrompts.inhale(sessionType: type), sessionPrompts.fullSustain(sessionType: type), sessionPrompts.exhale(sessionType: type), sessionPrompts.emptySustain(sessionType: type), sessionPrompts.duration(sessionType: type)]
            
        } else if type == .counted {
            if user.skillLevel == .beginner {
                return [sessionPrompts.inhale(sessionType: type)]
            } else {
                return [sessionPrompts.inhale(sessionType: type), sessionPrompts.fullSustain(sessionType: type), sessionPrompts.exhale(sessionType: type), sessionPrompts.emptySustain(sessionType: type), sessionPrompts.duration(sessionType: type)]
            }
        } else if type == .bellows {
            return [sessionPrompts.inhale(sessionType: type), sessionPrompts.exhale(sessionType: type), sessionPrompts.numberOfCycles(sessionType: type)]
        } else if type == .shiningSkull {
            return [sessionPrompts.inhale(sessionType: type), sessionPrompts.exhale(sessionType: type), sessionPrompts.numberOfCycles(sessionType: type)]
        }
        
        return  [sessionPrompts.inhale(sessionType: type), sessionPrompts.exhale(sessionType: type), sessionPrompts.duration(sessionType: type)]
    }
}
let paths = Path()
