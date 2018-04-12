//
//  BreatheMatchWordsWithActions.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-11.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
struct MatchWordsWithBreatheActions {
    
    
    
    
    func findPossibleBreatheButtons(words: [WordWithContext]) -> [(ButtonData, Double)]{
        
        var possibleButtons: [(ButtonData, Double)] = []
        
        func checkIfPercentMet(percentMet: Double, buttonData: ButtonData) {
            if percentMet > 30 {
                possibleButtons.append((buttonData, percentMet))
            }
            
        }
        
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.change, .inhale]), buttonData: ButtonData(title: "Change Inhale Length", action: .showInhale, global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.change, .exhale]), buttonData: ButtonData(title: "Change Exhale Length", action: .showExhale , global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.change, .full, .sustain]), buttonData: ButtonData(title: "Change Full Sustain Length", action: .showFullSustain, global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.change, .empty, .sustain]), buttonData: ButtonData(title: "Change Empty Sustain Length", action: .showEmptySustain , global: true, premium: false))
        
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.what, .dots, .circle]), buttonData: ButtonData(title: "What Are The Dots?", action: .showExplainWhatDotsAre , global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.lay, .down, .pranayama, .exercise]), buttonData: ButtonData(title: "Can I Lay While Breathing?", action: .showExplainLayWhileExercises , global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.difference, .bellow, .shine, .skull]), buttonData: ButtonData(title: "Bellows/Shining Skull Difference", action: .showExplainDifferenceBetweenBellowsAndShiningSkull , global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.posture]), buttonData: ButtonData(title: "What is the correct posture?", action: .showHowToBreathe, global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.how, .breath]), buttonData: ButtonData(title: "How to breathe", action: .showHowToBreathe, global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.what, .pranayama]), buttonData: ButtonData(title: "What is Pranayama?", action: .showPranayamaBasics, global: true, premium: false))
        
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.show, .exercise, .user, .need, .calm]), buttonData: ButtonData(title: "Show Calmimg Exercises", action: .showCalmExercises, global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.show, .exercise, .user, .need, .focus]), buttonData: ButtonData(title: "Show Exercises To Help Me Focus", action: .showFocusExercises, global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.show, .exercise, .user, .need, .energy]), buttonData: ButtonData(title: "Show Energizing Exercises", action: .showEnergyExercises, global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.show, .exercise, .user, .need, .sleep]), buttonData: ButtonData(title: "Show Exercises To Help Me Sleep", action: .showSleepExercises, global: true, premium: false))
        
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.start, .session, .deep]), buttonData: ButtonData(title: "Start Deep Breathing Session", action: .startDeepBreathingSession, global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.start, .session, .count]), buttonData: ButtonData(title: "Start Counted Breath Session", action: .startCountedBreathSession, global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.start, .session, .alternate, .nostril]), buttonData: ButtonData(title: "Start Alt Nostril Breathing Session", action: .startAlternateNostrilBreathSession, global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.start, .session, .bellow]), buttonData: ButtonData(title: "Start Bellows Breath Session", action: .startBellowsBreathSession, global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.start, .session, .shine, .skull]), buttonData: ButtonData(title: "Start Shining Skull Breath Session", action: .startShiningSkullSession, global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.start, .session, .calm]), buttonData: ButtonData(title: "Start Calming Breath Session", action: .startCalmingBreathSession, global: true, premium: false))
        
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.show, .exercise, .beginner]), buttonData: ButtonData(title: "Show Beginner Exercises", action: .showBeginnerExercises, global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.show, .exercise, .intermediate]), buttonData: ButtonData(title: "Show Intermediate Exercises", action: .showIntermediateExercises, global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.show, .exercise, .advanced]), buttonData: ButtonData(title: "Show Advanced Exercises", action: .showAdvancedExercises, global: true, premium: false))
        
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.learn, .more, .exercise, .breath]), buttonData: ButtonData(title: "Learn More About Exercises", action: .learnAboutExercises, global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.learn, .more, .deep, .breath]), buttonData: ButtonData(title: "Learn About Deep Breathing", action: .learnAboutDeepBreathing, global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.learn, .more, .count, .breath]), buttonData: ButtonData(title: "Learn About Counted Breath", action: .learnAboutCountedBreath, global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.learn, .more, .alternate, .nostril, .breath]), buttonData: ButtonData(title: "Learn About Alt Nostril Breathing", action: .learnAboutAltNostrilBreathing, global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.learn, .more, .bellow, .breath]), buttonData: ButtonData(title: "Learn About Bellows Breath", action: .learnAboutBellowsBreath, global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.learn, .more, .shine, .skull, .breath]), buttonData: ButtonData(title: "Learn About Shining Skull Breath", action: .learnAboutShiningSkullBreath, global: true, premium: false))
        checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.learn, .more, .calm, .breath]), buttonData: ButtonData(title: "Learn About Calming Breath", action: .learnAboutCalmingBreath, global: true, premium: false))
        
        
        
        
        
        //        let changeInhalePercentage = genericFindIntent(words: words, wordsToMatch: [.change, .inhale])
        //        if changeInhalePercentage > 70 {
        //            possibleButtons.append((ButtonData(title: "Change Inhale Length", action: .showInhale, global: true, premium: false), changeInhalePercentage))
        //        }
        
        //        let changeExhalePercentage = genericFindIntent(words: words, wordsToMatch: [.change, .exhale])
        //        if changeExhalePercentage > 70 {
        //            possibleButtons.append((ButtonData(title: "Change Exhale Length", action: .showExhale , global: true, premium: false), changeExhalePercentage))
        //        }
        //
        //        let changeEmptySustainPercentage = genericFindIntent(words: words, wordsToMatch: [.change, .empty, .sustain])
        //        if changeEmptySustainPercentage > 60 {
        //            possibleButtons.append(( ButtonData(title: "Change Empty Sustain Length", action: .showEmptySustain , global: true, premium: false), changeEmptySustainPercentage))
        //        }
        //
        //        let changeFullSustainPercentage = genericFindIntent(words: words, wordsToMatch: [.change, .full, .sustain])
        //        if changeFullSustainPercentage > 60 {
        //            possibleButtons.append((ButtonData(title: "Change Full Sustain Length", action: .showFullSustain , global: true, premium: false), changeFullSustainPercentage ))
        //        }
        
        
        
        return possibleButtons
        
    }
    
    
}
