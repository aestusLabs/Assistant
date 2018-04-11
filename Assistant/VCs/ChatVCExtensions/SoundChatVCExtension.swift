//
//  ChatVCSoundExtension.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-17.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
import AVFoundation
extension ChildChatViewController { // functions called from playableSessionWidgetCell via Notification
    
    func playSoundFor(_ typeOfBreath: String ) {
        //       var player: AVAudioPlayer = AVAudioPlayer()
//        print("PLAY SOUND")
//        do {
//            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
//            player.stop()
//            
//        } catch {
//            print("Error")
//        }
        var audioPath = Bundle.main.path(forResource: "Exhale.mp3", ofType: nil)!
        if typeOfBreath == "Inhale" {
            audioPath = Bundle.main.path(forResource: "Inhale.mp3", ofType: nil)!
        } else if typeOfBreath == "FullSustain" {
            audioPath = Bundle.main.path(forResource: "Full Sustain.mp3", ofType: nil)!

        } else if typeOfBreath == "EmptySustain" {
            audioPath = Bundle.main.path(forResource: "EmptySustain.mp3", ofType: nil)!

        } else if typeOfBreath == "Finished" {
            audioPath = Bundle.main.path(forResource: "Finished Ding", ofType: ".mp3")!
        } else if typeOfBreath == "BreakStart" {
             audioPath = Bundle.main.path(forResource: "acceptHappyA", ofType: ".mp3")!
        } else if typeOfBreath == "BreakEnd" {
             audioPath = Bundle.main.path(forResource: "acceptHappyB", ofType: ".mp3")!
        }
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            player.play()
            
        } catch {
            print("Error")
        }
    }
    
    @objc func testFunct() {
//        print("Hit test funct")
    }
    
    @objc func playInhaleSound() {
        playSoundFor("Inhale")
    }
    @objc func playExhaleSound() {
        playSoundFor("Exhale")
    }
    
    @objc func playFullSustainSound() {
        playSoundFor("FullSustain")
    }
    
    @objc func playEmptySustainSound() {
        playSoundFor("EmptySustain")
    }
    
    @objc func playFinishedSound() {
        playSoundFor("Finished")
    }
    
    @objc func playBreakStart() {
        playSoundFor("BreakStart")
    }
    @objc func playBreakEnd() {
        playSoundFor("BreakEnd")
    }
    @objc func stopPlayer() {
        player.stop()
    }
    @objc func sessionStopped() {
        let item = itemsShown[sessionManager.indexPath]
        if let widget = item as? PlayableSessionData {
//            print(widget.session)
            
            widget.session.secondsElapsed = sessionManager.secondsElapsed
            widget.session.startOfLastBreath = sessionManager.startOfLastBreath
            
            sessionManager.indexPath = 0
            sessionManager.startOfLastBreath = 0
            sessionManager.secondsElapsed = 0
        }
        // Testing
        //        let item2 = itemsShown[sessionManager.indexPath]
        //        let widget2 = item2 as! PlayableSessionData
        //        print(widget2.session)
        
    }
}
