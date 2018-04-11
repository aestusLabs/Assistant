//
//  SessionManager.swift
//  Breathe
//
//  Created by Ian Kohlert on 2017-12-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
struct SessionManager {
    var sessionType: SessionType = .deepBreathing
    var inhale = 2
    var exhale = 4
    var fullSustain = 0
    var emptySustain = 0
    var totalLengthInSeconds = 8
    var totalCycles = 0
    var cycleBreakLengthInS = 0
    var numberOfBreathsPerCycle = 0
    
//    var widget = ActiveSessionWidget()

    
    
    
    // For passing back to the item when paused/whatever
    var secondsElapsed = 0
    var startOfLastBreath = 0
    var indexPath = 0
    
    
    var passableSession = PassableSession()

    //    var currentPartOfBreath: BreathParts = .inhale
    //    var secondsElapsedForCurrentPartOfBreath = 0
    //    var pausedAt = 0 // seconds
    
    
    func calculateTotalLengthInSeconds(userSelectedMinutes: Int) -> Int {
        return (userSelectedMinutes * 60 / (inhale + fullSustain + exhale + emptySustain)) * (inhale + fullSustain + exhale + emptySustain)
        
    }
    
     func createSessionFromManager() -> PassableSession{
        return createPassableSession(sessionType: sessionManager.sessionType, inhale: sessionManager.inhale, exhale: sessionManager.exhale, fullSustain: sessionManager.fullSustain, emptySustain: sessionManager.emptySustain, totalLengthInSeconds: sessionManager.totalLengthInSeconds, numberOfBreathsPerCycle: sessionManager.numberOfBreathsPerCycle, breakLengthForCycle: sessionManager.cycleBreakLengthInS, totalCycles: sessionManager.totalCycles, secondsElapsed: 0, startOfLastBreath: 0) //PassableSession(sessionType: sessionManager.sessionType, inhale: sessionManager.inhale, exhale: sessionManager.exhale, fullSustain: sessionManager.fullSustain, emptySustain: sessionManager.emptySustain, totalLengthInSeconds: sessionManager.totalLengthInSeconds, totalCycles: sessionManager.totalCycles, secondsElapsed: 0, startOfLastBreath: 0)
    }
//    func getCurrentSession() ->PassableSession {
////        return PassableSession(sessionType: sessionType, inhale: inhale, exhale: exhale, fullSustain: fullSustain, emptySustain: emptySustain, totalLengthInSeconds: totalLengthInSeconds, totalCycles: totalCycles, secondsElapsed: 0, startOfLastBreath: 0, breath: [], closedNostril: "", nostrilCount: 0, breathPartLength: 0, currentPartOfBreathInstruction: "")
//        
//            //PassableSession(sessionType: sessionType, inhale: inhale, exhale: exhale, fullSustain: fullSustain, emptySustain: emptySustain, lengthInSeconds: totalLengthInSeconds, cycles: totalCycles)
//    }
    
//    func getSessionTypeString() -> String {
//        switch sessionType {
//        case .alternateNostril:
//            return "Alternate Nostril"
//        case .bellows:
//            return "Bellows Breath"
//        case .calming:
//            return "Calming Breath"
//        case .counted:
//            return "Counted Breath"
//        case .deepBreathing:
//            return "Deep Breathing"
//        case .shiningSkull:
//            return "Shining Skull Breath"
//        default:
//            return "Error"
//        }
//    }
    
    mutating func calcualteTotalLengthInSecondsFromCycles() {
        totalLengthInSeconds = totalCycles * (inhale + exhale + fullSustain + emptySustain)
    }
    
    mutating func clearAllValues() {
         sessionType = .deepBreathing
         inhale = 0
         exhale = 0
         fullSustain = 0
         emptySustain = 0
         totalLengthInSeconds = 0
         totalCycles = 0
         secondsElapsed = 0
    }
    
    
}
var sessionManager  = SessionManager()
