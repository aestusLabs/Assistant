//
//  PlayableSessionWidgetExtension.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-01-31.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
import UIKit
import HealthKit

extension PlayableSessionTableViewCell {
  
   @objc func tappedWidget() {
//        print("Tapped")
   
        if sessionTimer.isValid == false { // Play
            if secondsElapsed == 0 {
                calculateActualTotalLength()
            }
                setUpBreath()
                setUpView()
                chatManager.pausedSession = nil
                let _ = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (view) in
                    if self.totalCycles == 0 {
                        self.startSessionWidgetTimer()
                    } else {
                        
                        self.cycleStartSessionWidgetTimer()
                    }
                }
            isBreak = false
        } else { // Pause
           pause()
        }
    }
    
    func calculateActualTotalLength() {
        let breath = inhale + exhale + fullSustain + emptySustain
        let numberOfBreaths = totalLengthInSeconds / breath
        totalLengthInSeconds = numberOfBreaths * breath
        print(totalLengthInSeconds)
        if totalCycles > 0 {
            totalLengthInSeconds = sessionManager.totalLengthInSeconds
        }
    }
    func pause() {
//        print("paused")
        sessionTimer.invalidate()
       
        
        lungsImageView.layer.removeAllAnimations()
        progressBar.layer.removeAllAnimations()
        
        self.progressBar.progress = 0.0
        self.progressBar.layoutIfNeeded()//setProgress(0.0, animated: false)// = 1.0
        progressBar.layer.removeAllAnimations()


//        animateProgressBar(time: 0.5)
        enlargeLungs(time: 0.5)
        instructionLabel.text = "Paused"
        secondsElapsed = startOfLastBreath
        timeLabel.text = myConvert.displayTimeFrom(seconds: totalLengthInSeconds -  startOfLastBreath)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "stopPlayer"), object: nil)
        
        // This is for changing these variables in the item in itemsShown
        sessionManager.indexPath = indexPathOfCell
        sessionManager.secondsElapsed = secondsElapsed
        sessionManager.startOfLastBreath = startOfLastBreath
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "sessionStopped"), object: nil)
        
        if isBreak {
            secondsElapsed = nextCycleStartTime
             timeLabel.text = myConvert.displayTimeFrom(seconds: totalLengthInSeconds - secondsElapsed)
        }
        let pausedSession = createPassableSession(sessionType: sessionType, inhale: inhale, exhale: exhale, fullSustain: fullSustain, emptySustain: emptySustain, totalLengthInSeconds: totalLengthInSeconds - secondsElapsed, numberOfBreathsPerCycle: numberOfBreathsPerCycle, breakLengthForCycle: cycleBreakLengthInS, totalCycles: totalCycles, secondsElapsed: 0, startOfLastBreath: startOfLastBreath)
        chatManager.pausedSession = pausedSession

    }
  
    
    func setUpBreath() {
        
        if inhale != 0 {
            breath.append((.inhale, inhale))
        }
        if fullSustain != 0 {
            breath.append((.fullSustain, fullSustain))
        }
        if exhale != 0 {
            breath.append((.exhale, exhale))
        }
        if emptySustain != 0 {
            breath.append((.emptySustain, emptySustain))
        }
        
        print(breath)
        
    }
    
 
    func setUpView() {
        shrinkLungs(time: 0.4)
        instructionLabel.text = "Get Ready"
        //self.progressBar.setProgress(0.0, animated: false)// = 1.0

//        UIView.animate(withDuration: 0.4) {
//            self.progressBar.setProgress(0.0, animated: true)// = 1.0
//
//        }
        
    }
    
    func calculateSingleCycleLength() -> Int {
        
        let oneBreath = inhale + exhale + fullSustain + emptySustain
        let oneCycle = oneBreath * numberOfBreathsPerCycle
        return oneCycle
    }
    
    func cycleStartSessionWidgetTimer() {
        var breathCount = 0
        var cycleCount = 0
        var breakCount = 0
        var currentPartOfBreath = 0
        
        let singleCycleLength = calculateSingleCycleLength()
        
        sessionTimer = .scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (view) in
        self.timeLabel.text = myConvert.displayTimeFrom(seconds: self.totalLengthInSeconds - self.secondsElapsed)
        
           
            if self.isBreak {
                breakCount += 1

                self.instructionLabel.text = "Break"
                if breakCount == self.cycleBreakLengthInS {
                    self.isBreak = false
                    breakCount = 0
                }
            } else {
               
                cycleCount += 1
                breathCount += 1

                
                let currentPart = self.breath[currentPartOfBreath]
                
                if breakCount == 0 {
                    switch currentPart.0 {
                    case .inhale:
                        self.startOfLastBreath = self.secondsElapsed
                        self.inhaleAction()
                        
                    case .fullSustain:
                        self.fullSustainAction()
                        
                    case .exhale:
                        
                        self.exhaleAction()
                        
                    case .emptySustain:
                        self.emptySustainAction()
                        
                    }
                }
                
                self.breathPartLength -= 1
                if currentPart.1 - 1 == breakCount  {
                    
                    
                    if currentPartOfBreath == self.breath.count - 1 { // Resets the currentPartOfBreath -> 0 so it'll inhale
                        
                        currentPartOfBreath = 0
                    } else {
                        currentPartOfBreath += 1
                        
                    }
                    breakCount = 0
                } else {
                    breakCount += 1
                    
                   
                }
                
                if cycleCount == singleCycleLength {
                    cycleCount = 0
                    self.isBreak = true
                    
                    
                    
                   

                    
            if self.secondsElapsed < self.totalLengthInSeconds - 5 {
                
                    _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { (view) in
                        
                        self.animateProgressBar(time: TimeInterval(self.cycleBreakLengthInS))
                        self.nextCycleStartTime = self.secondsElapsed + self.cycleBreakLengthInS
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "playBreakStart"), object: nil)
                    })
                    _ = Timer.scheduledTimer(withTimeInterval: TimeInterval(self.cycleBreakLengthInS ), repeats: false, block: { (view) in
                        
                        if self.isBreak == false && self.instructionLabel.text == "Break" {
                         NotificationCenter.default.post(name: NSNotification.Name(rawValue: "playBreakEnd"), object: nil)
                        }
                    })
                    }
                }
            }
            
         
            
            if self.secondsElapsed == self.totalLengthInSeconds {
                self.finishedSession()
            } else {
                self.secondsElapsed += 1
            }
        })
    }
    
    func startSessionWidgetTimer() {
        var count = 0
        var currentPartOfBreath = 0
        sessionTimer = .scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (view) in
            
            self.timeLabel.text = myConvert.displayTimeFrom(seconds: self.totalLengthInSeconds - self.secondsElapsed)
            
            let currentPart = self.breath[currentPartOfBreath]
            
            if count == 0 {
                switch currentPart.0 {
                case .inhale:
                    self.startOfLastBreath = self.secondsElapsed
                    self.inhaleAction()
                    
                case .fullSustain:
                    self.fullSustainAction()
                    
                case .exhale:
                    
                    self.exhaleAction()
                    
                case .emptySustain:
                    self.emptySustainAction()
                    
                }
            }
            
            self.breathPartLength -= 1
            if currentPart.1 - 1 == count  {
                
                
                if currentPartOfBreath == self.breath.count - 1 { // Resets the currentPartOfBreath -> 0 so it'll inhale
                    
                    currentPartOfBreath = 0
                } else {
                    currentPartOfBreath += 1
                    
                }
                count = 0
            } else {
                count += 1
                
            }

            if self.secondsElapsed == self.totalLengthInSeconds {
                self.finishedSession()
            } else {
                self.secondsElapsed += 1
            }
        })
    }
    
    func inhaleAction() {
        breathPartLength = inhale
        if sessionManager.sessionType != .alternateNostril {
            currentPartOfBreathInstruction = "Inhale"
            
            instructionLabel.text = "Inhale"
        } else {
            instructionLabel.text = closedNostril
            currentPartOfBreathInstruction = closedNostril
            
            nostrilCount += 1
            if nostrilCount == 4 {
                nostrilCount = 0
                switchNostrilForAlternateBreathing()
                
            }
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "playInhaleSound"), object: nil)

        enlargeLungs(time: TimeInterval(inhale))
        animateProgressBar(time: TimeInterval(inhale))
    }
    func exhaleAction() {
        breathPartLength = exhale
        if sessionManager.sessionType != .alternateNostril {
            currentPartOfBreathInstruction = "Exhale"
            instructionLabel.text = "Exhale"
        } else  {
            instructionLabel.text = closedNostril
            currentPartOfBreathInstruction = closedNostril
            
            nostrilCount += 1
            if nostrilCount == 4 {
                nostrilCount = 0
                switchNostrilForAlternateBreathing()
            }
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "playExhaleSound"), object: nil)

        shrinkLungs(time: TimeInterval(exhale) )
        animateProgressBar(time: TimeInterval(exhale))
    }
    func fullSustainAction() {
        breathPartLength = fullSustain
        
        instructionLabel.text = "Sustain"
        currentPartOfBreathInstruction = "Sustain"
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "playFullSustainSound"), object: nil)
        
        animateProgressBar(time: TimeInterval(fullSustain))
    }
    func emptySustainAction() {
        breathPartLength = emptySustain
        
        instructionLabel.text = "Sustain"
        currentPartOfBreathInstruction = "Sustain"
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "playEmptySustainSound"), object: nil)
        animateProgressBar(time: TimeInterval(emptySustain))
  
    }
    func switchNostrilForAlternateBreathing() {
        if closedNostril == "Close Left" {
            closedNostril = "Close Right"
        } else {
            closedNostril = "Close Left"
        }
    }
    
    func finishedSession() {
//        print(breath)
        saveMindfullAnalysis()
        instructionLabel.text = "Finished"
        timeLabel.text = ""
        sessionTimer.invalidate()
        chatManager.pendingQueue.append(.finishedSession)
        
        
        startOfLastBreath = 0
        secondsElapsed = 0
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "playFinishedSound"), object: nil)

        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "finishedSession"), object: nil)

    }

    func saveMindfullAnalysis() {
        
        if let mindfulType = HKObjectType.categoryType(forIdentifier: .mindfulSession) {
            
            let calendar = Calendar.current
            let endDate = Date()
            var seconds = sessionManager.totalLengthInSeconds
            if seconds < 60 {
                seconds = 60
            }
            let startDate = calendar.date(byAdding: .second, value: -seconds, to: endDate)
//            print(startDate)
            
            guard let date = startDate else {

                return
                
            }
            
            let mindfulMinutes = HKCategorySample(type: mindfulType, value: 0, start: date, end: endDate)
            
            
            let healthStore = HKHealthStore()
            // at the end, we save it
            healthStore.save(mindfulMinutes, withCompletion: { (success, error) -> Void in
                
                if error != nil {
                    // something happened
                    print(error)
                    
                    return
                }
                
                if success {
                    print("My new data was saved in HealthKit")
                    
                } else {
                    // something happened again
                }
                
            })
            
        }
        
    }
}
