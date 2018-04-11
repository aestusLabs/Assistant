//
//  FindIntentOfWords.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-05.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation

//Spelling And Grammar Checked
struct MatchWordsWithContextWithActions {
    var callMePhrase: [WordContext] = [.call, .user]
    
    
//    func notSureWhereToStart(words:  [WordWithContext]) -> ([ButtonData], Double) {
//    var percentMet = 0.0
//    var buttons: [ButtonData] = []
//    
//    for word in words {
//    if word.contexts.contains(.not) {
//    percentMet += 33
//    }
//    if word.contexts.contains(.sure) {
//    percentMet += 33
//    }
//    if word.contexts.contains(.start) {
//    percentMet += 33
//    }
//    
//    
//    }
//    if percentMet > 60 {
//    buttons.append(ButtonData(title: "I Don't Know Where To Start", action: .showEmptySustain , global: true, premium: false))
//    }
//    
//    return (buttons, percentMet)
//    
//    }
 
    func navigate(words:  [WordWithContext]) -> ([ButtonData], Double) { //Spelling And Grammar Checked
        var percentMet = 0.0
        var buttons: [ButtonData] = []
        var show = false
        var command = false
        var history = false
        var settings = false
        
        for word in words {
            if word.contexts.contains(.show) || word.contexts.contains(.go) || word.contexts.contains(.navigation) {
                percentMet += 90
                show = true
            }
            if word.contexts.contains(.all) {
                percentMet += 33
            }
            if word.contexts.contains(.command) {
                percentMet += 33
            }
            
            
        }
        if command {
            buttons.append(ButtonData(title: "Show All Commands", action: .showAllGlobalCommands , global: true, premium: false))
            return (buttons, percentMet)

        } else if history {
            buttons.append(ButtonData(title: "Show History", action: .goToHistory , global: true, premium: false))
            return (buttons, percentMet)

        } else if settings {
             buttons.append(ButtonData(title: "Show Settings", action: .goToSettings , global: true, premium: false))
            return (buttons, percentMet)

        } else if show {
            buttons.append(ButtonData(title: "Show All Commands", action: .showAllGlobalCommands , global: true, premium: false))
            buttons.append(ButtonData(title: "Show History", action: .goToHistory , global: true, premium: false))
             buttons.append(ButtonData(title: "Show Settings", action: .goToSettings , global: true, premium: false))
        }
        
//        if percentMet > 60 {
//            buttons.append(ButtonData(title: "Show All Commands", action: .showAllGlobalCommands , global: true, premium: false))
//        }
        
        return (buttons, percentMet)
        
    }
    /*
    func showAllCommands(words:  [WordWithContext]) -> ([ButtonData], Double) {
        var percentMet = 0.0
        var buttons: [ButtonData] = []
        
        for word in words {
            if word.contexts.contains(.show) {
                percentMet += 33
            }
            if word.contexts.contains(.all) {
                percentMet += 33
            }
            if word.contexts.contains(.command) {
                percentMet += 33
            }
            
            
        }
        if percentMet > 60 {
            buttons.append(ButtonData(title: "Show All Commands", action: .showAllGlobalCommands , global: true, premium: false))
        }
        
        return (buttons, percentMet)
        
    }
    
    func showHistory(words:  [WordWithContext]) -> ([ButtonData], Double) {
        var percentMet = 0.0
        var buttons: [ButtonData] = []
        
        for word in words {
            if word.contexts.contains(.show) {
                percentMet += 33
            }
       
            if word.contexts.contains(.history) {
                percentMet += 33
            }
            
            
        }
        if percentMet > 60 {
            buttons.append(ButtonData(title: "Show History", action: .goToHistory , global: true, premium: false))
        }
        
        return (buttons, percentMet)
        
    }
    */
    func changeEmptySustain(words:  [WordWithContext]) -> ([ButtonData], Double) { //Spelling And Grammar Checked
        var percentMet = 0.0
        var buttons: [ButtonData] = []
        
        for word in words {
            if word.contexts.contains(.change) {
                percentMet += 33
            }
            if word.contexts.contains(.empty) {
                percentMet += 33
            }
            if word.contexts.contains(.sustain) {
                percentMet += 33
            }
            
            
        }
        if percentMet > 60 {
            buttons.append(ButtonData(title: "Change Empty Sustain Length", action: .showEmptySustain , global: true, premium: false))
        }
        
        return (buttons, percentMet)
        
    }
    
    func changeFullSustain(words:  [WordWithContext]) -> ([ButtonData], Double) {//Spelling And Grammar Checked
        var percentMet = 0.0
        var buttons: [ButtonData] = []
        
        for word in words {
            if word.contexts.contains(.change) {
                percentMet += 33
            }
            if word.contexts.contains(.full) {
                percentMet += 33
            }
            if word.contexts.contains(.sustain) {
                percentMet += 33
            }
            
            
        }
        if percentMet > 60 {
            buttons.append(ButtonData(title: "Change Full Sustain Length", action: .showFullSustain , global: true, premium: false))
        }
        
        return (buttons, percentMet)
        
    }
    
    func changeExhale(words:  [WordWithContext]) -> ([ButtonData], Double) { //Spelling And Grammar Checked
        var percentMet = 0.0
        var buttons: [ButtonData] = []
        
        for word in words {
            if word.contexts.contains(.change) {
                percentMet += 50
            }
            if word.contexts.contains(.exhale) {
                percentMet += 50
            }
            
            
        }
        if percentMet > 70 {
            buttons.append(ButtonData(title: "Change Exhale Length", action: .showExhale , global: true, premium: false))
        }
        
        return (buttons, percentMet)
        
    }
    
    func changeInhale(words:  [WordWithContext]) -> ([ButtonData], Double) { //Spelling And Grammar Checked
        var percentMet = 0.0
        var buttons: [ButtonData] = []
        
        for word in words {
            if word.contexts.contains(.change) {
                percentMet += 50
            }
            if word.contexts.contains(.inhale) {
                percentMet += 50
            }
           
            
        }
        if percentMet > 70 {
            buttons.append(ButtonData(title: "Change Inhale Length", action: .showInhale, global: true, premium: false))
        }
        
        return (buttons, percentMet)
        
    }

    func whatAreDots(words:  [WordWithContext]) -> ([ButtonData], Double) {//Spelling And Grammar Checked
        var percentMet = 0.0
        var buttons: [ButtonData] = []
        
        for word in words {
            if word.contexts.contains(.what) {
                percentMet += 40
            }
            if word.contexts.contains(.dots) {
                percentMet += 33
            }
            if word.contexts.contains(.circle) {
                percentMet += 33
            }
            
            
        }
        if percentMet > 70 {
            buttons.append(ButtonData(title: "What Are The Dots?", action: .showExplainWhatDotsAre , global: true, premium: false))
        }
        
        return (buttons, percentMet)
        
    }
    
    func canLayDown(words:  [WordWithContext]) -> ([ButtonData], Double) {//Spelling And Grammar Checked
        var percentMet = 0.0
        var buttons: [ButtonData] = []
        
        for word in words {
            if word.contexts.contains(.lay) {
                percentMet += 40
            }
            if word.contexts.contains(.down) {
                percentMet += 33
            }
            if word.contexts.contains(.pranayama) {
                percentMet += 33
            }
            if word.contexts.contains(.exercise) {
                percentMet += 33
                
            }
            
        }
        if percentMet > 70 {
            buttons.append(ButtonData(title: "Can I Lay While Breathing?", action: .showExplainLayWhileExercises , global: true, premium: false))
        }
        
        return (buttons, percentMet)
        
    }
    
    
    func differenceBetweenBellowsAndShining(words:  [WordWithContext]) -> ([ButtonData], Double) { //Spelling And Grammar Checked
        var percentMet = 0.0
        var buttons: [ButtonData] = []
        
        for word in words {
            if word.contexts.contains(.difference) {
                percentMet += 40
            }
            if word.contexts.contains(.bellow) {
                percentMet += 33
            }
            if word.contexts.contains(.shine) {
                percentMet += 33
            }
            if word.contexts.contains(.skull) {
                percentMet += 33

            }
            
        }
        if percentMet > 70 {
            buttons.append(ButtonData(title: "Bellows/Shining Skull Difference", action: .showExplainDifferenceBetweenBellowsAndShiningSkull , global: true, premium: false))
        }
        
        return (buttons, percentMet)
        
    }
    
    
    /// how to change answer
    func howAppWorks(words:  [WordWithContext]) -> ([ButtonData], Double) {//Spelling And Grammar Checked
        var percentMet = 0.0
        var buttons: [ButtonData] = []
        
        for word in words {
            if word.contexts.contains(.app) {
                percentMet += 33
            }
            if word.contexts.contains(.how) {
                percentMet += 33
            }
            if word.contexts.contains(.work) {
                percentMet += 33
            }
            
        }
        if percentMet > 90 {
            buttons.append(ButtonData(title: "How Does The App Work?", action: .showHowAppWorks , global: true, premium: false))
        }
        
        return (buttons, percentMet)
        
    }
    /*
    func settings(words:  [WordWithContext]) -> ([ButtonData], Double) {
        var percentMet = 0.0
        var buttons: [ButtonData] = []

        for word in words {
            if word.contexts.contains(.settings) {
                percentMet += 100
            }
        }
        if percentMet > 90 {
            buttons.append(ButtonData(title: "Show Settings", action: .goToSettings , global: true, premium: false))
        }
        
        return (buttons, percentMet)
    
    }
    */
    func posture(words: [WordWithContext]) -> ([ButtonData], Double) {//Spelling And Grammar Checked
        var percentMet = 0.0
        var buttons: [ButtonData] = []
        
        for word in words {
            if word.contexts.contains(.posture) {
                percentMet += 100
            }
        }
        if percentMet > 90 {
            buttons.append(ButtonData(title: "What is the correct posture?", action: .showHowToBreathe, global: true, premium: false))
        }
    
        return (buttons, percentMet)
    }
    
    func howToBreathe(words: [WordWithContext]) -> ([ButtonData], Double) {//Spelling And Grammar Checked
        var percentMet = 0.0
        var buttons: [ButtonData] = []
        
        for word in words {
            if word.contexts.contains(.how) {
                percentMet += 50
            }
            if word.contexts.contains(.breath) {
                percentMet += 50
            }
            
            
            if percentMet > 90 {
                buttons.append(ButtonData(title: "How to breathe", action: .showHowToBreathe, global: true, premium: false))
            }
        }
        return (buttons, percentMet)
    }
    
    func whatIsPranayama(words: [WordWithContext]) -> ([ButtonData], Double) {//Spelling And Grammar Checked
        var percentMet = 0.0
        var buttons: [ButtonData] = []

        for word in words {
            if word.contexts.contains(.what) {
                percentMet += 50
            }
            if word.contexts.contains(.pranayama) {
                percentMet += 50
            }
    

            if percentMet > 90 {
               buttons.append(ButtonData(title: "What is Pranayama?", action: .showPranayamaBasics, global: true, premium: false))
            }
        }
        return (buttons, percentMet)

    }
    
    
    func exerciseByType(words: [WordWithContext]) -> ([ButtonData], Double) { //Spelling And Grammar Checked
        var calm = false
        var focus = false
        var sleep = false
        var energy = false
        
        var percentMet = 0.0
        for word in words {
            if word.contexts.contains(.show) {
                percentMet += 33.0
            }
            if word.contexts.contains(.exercise) {
                percentMet += 33.0
            }
            
            if word.contexts.contains(.user) {
                percentMet += 33.0
            }
            if word.contexts.contains(.need) {
                percentMet += 33.0
            }
            if word.contexts.contains(.calm) {
                calm = true
                percentMet += 33.0
            }
            if word.contexts.contains(.focus) {
                focus = true
                percentMet += 33.0
            }
            if word.contexts.contains(.energy) {
                energy = true
                percentMet += 33.0
            }
            if word.contexts.contains(.sleep) {
                sleep = true
                percentMet += 33.0
            }
        }
        
        var buttons: [ButtonData] = []
        if percentMet > 50 {
            if calm {
                buttons = []
                buttons.append(ButtonData(title: "Show Calmimg Exercises", action: .showCalmExercises, global: true, premium: false))
            }
            if focus {
                buttons = []
                buttons.append(ButtonData(title: "Show Exercises To Help Me Focus", action: .showFocusExercises, global: true, premium: false))
            }
            if energy {
                buttons = []
                buttons.append(ButtonData(title: "Show Energizing Exercises", action: .showEnergyExercises, global: true, premium: false))
            }
            if sleep {
                buttons = []
                buttons.append(ButtonData(title: "Show Exercises To Help Me Sleep", action: .showSleepExercises, global: true, premium: false))
            }
        }
        
        return (buttons, percentMet)
    }
    
    func turnNotifications(words: [WordWithContext]) -> ([ButtonData], Double) {//Spelling And Grammar Checked
    var change = false
        var on = false
        var off = false
        
        
        var percentMet = 0.0
        for word in words {
            if word.contexts.contains(.turn) {
                percentMet += 33.0
            }
            if word.contexts.contains(.notification) {
                percentMet += 33.0
            }
            if word.contexts.contains(.on) {
                on = true
                percentMet += 33.0
            }
            if word.contexts.contains(.off) {
                off = true
                percentMet += 33.0
            }
            if word.contexts.contains(.change) {
                change = true
                percentMet += 33.0
            }
            if word.contexts.contains(.manage) {
                change = true
                percentMet += 33.0
            }
        }
          var buttons: [ButtonData] = []
        if percentMet > 50 {
            if change {
                buttons = []
                buttons.append(ButtonData(title: "Manage Daily Notification", action: .showDailyNotificationChooseDays, global: true, premium: false))
            }
            if on {
                buttons = []
                buttons.append(ButtonData(title: "Turn On Notifications", action: .turnOnNotifications, global: true, premium: false))
            }
            if off {
                buttons = []
                buttons.append(ButtonData(title: "Turn Off Notifications", action: .turnOffNotifications, global: true, premium: false))
            }
        }
        
        return (buttons, percentMet)

    }
    
    func seeIfShowExerciseByDifficulty(words: [WordWithContext]) -> ([ButtonData], Double) {//Spelling And Grammar Checked
        var beginner = false
        var intermediate = false
        var advanced = false
        
        var percentMet = 0.0
        for word in words {
            if word.contexts.contains(.show) {
                percentMet += 33.0
            }
            if word.contexts.contains(.exercise) {
                percentMet += 33.0
            }
            if word.contexts.contains(.beginner) {
                percentMet += 33.0
                beginner = true
            }
            if word.contexts.contains(.intermediate) {
                percentMet += 33.0
                intermediate = true
            }
            if word.contexts.contains(.advanced) {
                percentMet += 33.0
                advanced = true
            }
            
        }
        var buttons: [ButtonData] = []

        if beginner {
            buttons = []
            buttons.append(ButtonData(title: "Show Beginner Exercises", action: .showBeginnerExercises, global: true, premium: false))

        }
        if intermediate {
            buttons = []
            buttons.append(ButtonData(title: "Show Intermediate Exercises", action: .showIntermediateExercises, global: true, premium: false))
        }
        if advanced {
            buttons = []
            buttons.append(ButtonData(title: "Show Advanced Exercises", action: .showAdvancedExercises, global: true, premium: false))
        }
        return (buttons, percentMet)
    }
    
    func seeIfStartSession(words: [WordWithContext]) -> ([ButtonData], Double) {//Spelling And Grammar Checked
        var deepBreathingMatch = false
        var countedBreathMatch = false
        var alternateNostrilMatch = false
        var bellowsBreathMatch = false
        var shiningSkullMatch = false
        var calmingMatch = false
        
        var percentMet = 0.0
        for word in words {
            if word.contexts.contains(.start)  {
                percentMet += 33.0
            }
            if word.contexts.contains(.session) {
                percentMet += 33.0
            }
            if word.contexts.contains(.deep)  {
                deepBreathingMatch = true
                percentMet += 33.0
            }
            if word.contexts.contains(.count)  {
                percentMet += 33.0
                countedBreathMatch = true
            }
            if word.contexts.contains(.alternate) || word.contexts.contains(.nostril) {
                percentMet += 33.0
                alternateNostrilMatch = true
            }
            if word.contexts.contains(.bellow)  {
                percentMet += 33.0
                bellowsBreathMatch = true
            }
            if word.contexts.contains(.shine) || word.contexts.contains(.skull)  {
                percentMet += 33.0
                shiningSkullMatch = true
            }
            if word.contexts.contains(.calm)  {
                percentMet += 33.0
                calmingMatch = true
            }
        }
        var buttons: [ButtonData] = []
        if percentMet > 65 {
            buttons.append(ButtonData(title: "Start New Session", action: .selectExercise, global: true, premium: false))
            if deepBreathingMatch{
                buttons = []
                buttons.append(ButtonData(title: "Start Deep Breathing Session", action: .startDeepBreathingSession, global: true, premium: false))
            }
            if countedBreathMatch {
                buttons = []
                buttons.append(ButtonData(title: "Start Counted Breath Session", action: .startCountedBreathSession, global: true, premium: false))
            }
            if alternateNostrilMatch {
                buttons = []
                buttons.append(ButtonData(title: "Start Alt Nostril Breathing Session", action: .startAlternateNostrilBreathSession, global: true, premium: false))
            }
            if bellowsBreathMatch {
                buttons = []
                buttons.append(ButtonData(title: "Start Bellows Breath Session", action: .startBellowsBreathSession, global: true, premium: false))
            }
            if shiningSkullMatch {
                buttons = []
                buttons.append(ButtonData(title: "Start Shining Skull Breath Session", action: .startShiningSkullSession, global: true, premium: false))
            }
            if calmingMatch {
                buttons = []
                buttons.append(ButtonData(title: "Start Calming Breath Session", action: .startCalmingBreathSession, global: true, premium: false))
            }
            
        }
        return (buttons, percentMet)
    }
    
    func seeIfLearnMoreAboutExercises(words: [WordWithContext]) -> ([ButtonData], Double) { //Spelling And Grammar Checked
        // learn more
        // learn more about exercises
        // learn more about EXERCISENAme
        var deepBreathingMatch = false
        var countedBreathMatch = false
        var alternateNostrilMatch = false
        var bellowsBreathMatch = false
        var shiningSkullMatch = false
        var calmingMatch = false
        
        var percentMet = 0.0
        for word in words {
            if word.contexts.contains(.learn)  {
                percentMet += 33.0
            }
            if word.contexts.contains(.more)  {
                percentMet += 33.0
            }
            if word.contexts.contains(.exercise) {
                percentMet += 33.0
            }
            if word.contexts.contains(.breath)  {
                percentMet += 33.0
            }
            if word.contexts.contains(.deep)  {
                deepBreathingMatch = true
                percentMet += 33.0
            }
            if word.contexts.contains(.count)  {
                percentMet += 33.0
                countedBreathMatch = true
            }
            if word.contexts.contains(.alternate) || word.contexts.contains(.nostril) {
                percentMet += 33.0
                alternateNostrilMatch = true
            }
            if word.contexts.contains(.bellow)  {
                percentMet += 33.0
                bellowsBreathMatch = true
            }
            if word.contexts.contains(.shine) || word.contexts.contains(.skull)  {
                percentMet += 33.0
                shiningSkullMatch = true
            }
            if word.contexts.contains(.calm)  {
                percentMet += 33.0
                calmingMatch = true
            }
        }
        var buttons: [ButtonData] = []
        if percentMet > 65 {
            buttons.append(ButtonData(title: "Learn More About Exercises", action: .learnAboutExercises, global: true, premium: false))
            if deepBreathingMatch{
                buttons = []
                buttons.append(ButtonData(title: "Learn About Deep Breathing", action: .learnAboutDeepBreathing, global: true, premium: false))
            }
            if countedBreathMatch {
                buttons = []
                buttons.append(ButtonData(title: "Learn About Counted Breath", action: .learnAboutCountedBreath, global: true, premium: false))
            }
            if alternateNostrilMatch {
                buttons = []
                buttons.append(ButtonData(title: "Learn About Alt Nostril Breathing", action: .learnAboutAltNostrilBreathing, global: true, premium: false))
            }
            if bellowsBreathMatch {
                buttons = []
                buttons.append(ButtonData(title: "Learn About Bellows Breath", action: .learnAboutBellowsBreath, global: true, premium: false))
            }
            if shiningSkullMatch {
                buttons = []
                buttons.append(ButtonData(title: "Learn About Shining Skull Breath", action: .learnAboutShiningSkullBreath, global: true, premium: false))
            }
            if calmingMatch {
                buttons = []
                buttons.append(ButtonData(title: "Learn About Calming Breath", action: .learnAboutCalmingBreath, global: true, premium: false))
            }
           
        }
        return (buttons, percentMet)
        
    }
    
    func seeIfHelp(words: [WordWithContext])  -> ([ButtonData], Double) {//Spelling And Grammar Checked
        var match = false
        for word in words {
            if word.contexts.contains(.help) {
                match = true
            }
            if match {
                let button = ButtonData(title: "I Need Help", action: .iNeedHelp, global: true, premium: false)
                return ([button], 100)
            }
        }
        return ([], 0)
    }

    func seeIfWordsMatchCallMePhrase(words: [WordWithContext], userInput: String) {
        
        var matchedCall = false
        var matchedUser = false
        for word in words {
            if word.contexts.contains(.call) {
                matchedCall = true
            }
            if word.contexts.contains(.user) {
                matchedUser = true
            }
        }
        
        if matchedUser && matchedCall {
            let lowerCased = userInput.lowercased()
            let seperatedWords = lowerCased.components(separatedBy: " ")
//            print(seperatedWords)
            
            var hopeFullyTheirName = ""
            var nameCapture = false
            for word in seperatedWords {
                if nameCapture {
                    hopeFullyTheirName += word.capitalized
                    hopeFullyTheirName += " "
                }
                if word == "me" {
                 

                       nameCapture = true
                }
                
            }
//            print("#(A(IF(KADOIAS")
//            print(hopeFullyTheirName)
            
        }
        
        
    }
    
    
    func chekIfChangeNameIntent(words: [WordWithContext], userInput: String) -> ([ButtonData], Double) {//Spelling And Grammar Checked
    
        var percentMet = 0.0
        var theirName = ""
    
        
        for word in words {
            if word.contexts.contains(.change) {
                percentMet += 50
            }
            if word.contexts.contains(.name) {
                percentMet += 50
            }
        }
        if percentMet == 100 {
            let lowerCased = userInput.lowercased()
            let seperatedWords = lowerCased.components(separatedBy: " to ")
//            print(seperatedWords)
            
            if seperatedWords.count == 2 {
                theirName = seperatedWords[1]
            } else {
                
            }
            if theirName == "" {
                let button = ButtonData(title: "Change Name", action: .showChangeNamePrompt, global: true, premium: false)
                return ([button], 100.0)
            }
            let button = ButtonData(title: "Change Name To '\(theirName.capitalized)'", action: .changeName, global: true, premium: false)
            return ([button], percentMet)
        }
        
        
        return ([], 0.0)
    }
    
    func checkIfCallMeChangeNameIntent(words: [WordWithContext], userInput: String) -> ([ButtonData], Double) {//Spelling And Grammar Checked
    var percentMet = 0.0
        var theirName = ""
        
        for word in words {
            if word.contexts.contains(.call) {
                percentMet += 50
            }
            if word.contexts.contains(.user) {
                percentMet += 50
            }
        }
        
        if percentMet == 100 {
            let lowerCased = userInput.lowercased()
            let seperatedWords = lowerCased.components(separatedBy: " me ")
            if seperatedWords.count == 2 {
                theirName = seperatedWords[1]
            } else {
               
            }
            if theirName == "" {
                return ([], 0.0)
            }
            let button = ButtonData(title: "Call Me '\(theirName.capitalized)'", action: .changeName, global: true, premium: false)
            return ([button], percentMet)
        }
    
        
        return ([], 0.0)
    // components seperated by "me"
    }
    
    func checkIfReadingSpeedIntent(words: [WordWithContext]) -> ([ButtonData], Double) {//Spelling And Grammar Checked
        var readingSpeedContext = false
        var speedContext = false
        var incrementContext = false
        var percentMet = 0.0
        var modWord = ""
        var modAction = ButtonAction.readingSpeedIncrease
        for word in words {
            if word.contexts.contains(.readingSpeed) {
                readingSpeedContext = true
                percentMet += 50.0
            }
            if word.contexts.contains(.message) {
                readingSpeedContext = true
                percentMet += 50.0
            }
            if word.contexts.contains(.speed) {
                speedContext = true
                percentMet += 50.0
            }
            if word.contexts.contains(.increment) || word.contexts.contains(.deincrement) {
                incrementContext = true
                percentMet += 1.9
                modWord = word.word
                if word.contexts.contains(.deincrement) {
                    modAction = .readingSpeedDecrease
                }
            }
        }
        if incrementContext {
            let button = ButtonData(title: "\(modWord.capitalized) Message Speed", action: modAction, global: true, premium: false)
            return ([button], percentMet)
        } else {
            let changeButton = ButtonData(title: "Change Message Speed", action: .readingSpeedChange, global: true, premium: false)
            let increaseButton = ButtonData(title: "Increase Message Speed", action: .readingSpeedIncrease, global: true, premium: false)
            let decreaseButton = ButtonData(title: "Decrease Message Speed", action: .readingSpeedDecrease, global: true, premium: false)

            return ([changeButton, increaseButton, decreaseButton], percentMet)
        }

    }
    
    func isColourSchemeIntent(words: [WordWithContext]) -> ([ButtonData], Double) {//Spelling And Grammar Checked
        var colourSchemeContext = false
        var modeStrengthener = false
        var modifierContext = false
        var percentMet = 0.0
        
        for word in words {
            if word.contexts.contains(.colourThemeDark) || word.contexts.contains(.colourThemeDark) {
                colourSchemeContext = true
                percentMet += 33.3
            }
            if word.contexts.contains(.mode) {
                modeStrengthener = true
                percentMet += 33.3
            }
            if word.contexts.contains(.on) || word.contexts.contains(.off) {
                modifierContext = true
                percentMet += 33.3
            }
        }
        
        if percentMet > 0 {
        var action: ButtonAction = .none
        let colourWord = "Dark"
         var modWord = ""
        if user.colourScheme == .dark {
            modWord = "Off"
            action = .darkModeOff
        } else {
            modWord = "On"
            action = .darkModeOn
        }
        
        let buttonTitle = "\(colourWord) Mode \(modWord)"
        let button = ButtonData(title: buttonTitle, action: action, global: true, premium: true)
        return ([button], percentMet)
        } else {
            return ([], percentMet)
        }
    }
    
    
    
    
}
let matchWordsWithContextWithActions = MatchWordsWithContextWithActions()



struct FindIntentFromWords {
    
    
    func triageUserInput(words: [WordWithContext], userInput: String) -> [ButtonData]{
//        var result: [ButtonData] = []
        var results: [(buttonData: [ButtonData], percent: Double)] = []
        
        // the ossiblity check will be removed and look for highest percentages and give multiple buttons if match multiple
        
        
        let possibleHelpButton = matchWordsWithContextWithActions.seeIfHelp(words: words)
        if possibleHelpButton.1 > 0 {
            results.append(possibleHelpButton)
        }
        
       let possibleChangeNameButton =  matchWordsWithContextWithActions.checkIfCallMeChangeNameIntent(words: words, userInput: userInput)
        
        if possibleChangeNameButton.1 > 0 {
            results.append(possibleChangeNameButton)
            //return possibleChangeNameButton.0
        }
        let possibleChangeNameButton2 = matchWordsWithContextWithActions.chekIfChangeNameIntent(words: words, userInput: userInput)
        if possibleChangeNameButton2.1 > 0 {
            results.append(possibleChangeNameButton2)

//            return possibleChangeNameButton2.0
        }
        
        let possibleDarkModeButton = matchWordsWithContextWithActions.isColourSchemeIntent(words: words)
        if possibleDarkModeButton.1 > 0 {
            results.append(possibleDarkModeButton)

//            return possibleDarkModeButton.0
        }
        
        let possibleReadingSpeedButtons = matchWordsWithContextWithActions.checkIfReadingSpeedIntent(words: words)
        if possibleReadingSpeedButtons.1 > 0 {
            results.append(possibleReadingSpeedButtons)

//            return possibleReadingSpeedButtons.0
        }
        
        let possibleLearnAboutExerciseButtons = matchWordsWithContextWithActions.seeIfLearnMoreAboutExercises(words: words)
        if possibleLearnAboutExerciseButtons.1 > 0 {
            results.append(possibleLearnAboutExerciseButtons)
        }
        
        let possibleStartSessionButtons = matchWordsWithContextWithActions.seeIfStartSession(words: words)
        if possibleStartSessionButtons.1 > 0 {
            results.append(possibleStartSessionButtons)
        }
        
        let possibleShowExerciseByDifficultyButtons = matchWordsWithContextWithActions.seeIfShowExerciseByDifficulty(words: words)
        if possibleShowExerciseByDifficultyButtons.1 > 0 {
            results.append(possibleShowExerciseByDifficultyButtons)
        }
        
        let possibleNotificationButtons = matchWordsWithContextWithActions.turnNotifications(words: words)
        if possibleNotificationButtons.1 > 0 {
            results.append(possibleNotificationButtons)
        }
        
        let possibleTypeButtons = matchWordsWithContextWithActions.exerciseByType(words: words)
        if possibleTypeButtons.1 > 0 {
            results.append(possibleTypeButtons)
        }
        
        let possibleWhatIsPranayamaButtons = matchWordsWithContextWithActions.whatIsPranayama(words: words)
        if possibleWhatIsPranayamaButtons.1 > 0 {
            results.append(possibleWhatIsPranayamaButtons)
        }
        
        let possibleHowToBreatheButtons = matchWordsWithContextWithActions.howToBreathe(words: words)
        if possibleHowToBreatheButtons.1 > 0 {
            results.append(possibleHowToBreatheButtons)
        }
        
        let postureButton = matchWordsWithContextWithActions.posture(words: words)
        if postureButton.1 > 0 {
            results.append(postureButton)
        }
        
//        let settingsButton = matchWordsWithContextWithActions.settings(words: words)
//        if settingsButton.1 > 0 {
//            results.append(settingsButton)
//        }
        
        let layDownButton = matchWordsWithContextWithActions.canLayDown(words: words)
        if layDownButton.1 > 0 {
            results.append(layDownButton)
        }
        let differenceBetweenBellowsAndShiningButton = matchWordsWithContextWithActions.differenceBetweenBellowsAndShining(words: words)
        if differenceBetweenBellowsAndShiningButton.1 > 0 {
            results.append(differenceBetweenBellowsAndShiningButton)
        }
        
        let whatAreDotsButton = matchWordsWithContextWithActions.whatAreDots(words: words)
        if whatAreDotsButton.1 > 0 {
            results.append(whatAreDotsButton)
        }
        
        let changeInhaleButton = matchWordsWithContextWithActions.changeInhale(words: words)
        if changeInhaleButton.1 > 0 {
            results.append(changeInhaleButton)
        }
        
        results.append(matchWordsWithContextWithActions.changeExhale(words: words))
        
        results.append(matchWordsWithContextWithActions.changeFullSustain(words: words))
        
        results.append(matchWordsWithContextWithActions.changeEmptySustain(words: words))
        
            results.append(matchWordsWithContextWithActions.navigate(words: words))
//        results.append(matchWordsWithContextWithActions.showHistory(words: words))
//
//        results.append(matchWordsWithContextWithActions.showAllCommands(words: words))
        
        if results.count == 1 {
            return results[0].buttonData
        }
        
//        var probable: [([ButtonData], Double)] = []
//        var lessThanProbable : [([ButtonData], Double)] = []
//        for result in results {
//            if result.percent > 90 {
//                probable.append(result)
//            } else {
//                lessThanProbable.append(result)
//            }
//        }
        
        results =  results.sorted(by: {$0.percent > $1.percent})
        
        if results.count >= 2 { // this stops unrelated buttons from being shown when it's pretty sure
            if results[1].percent < 90 {
                return results[0].buttonData
            }
        }
        // ---
        
//        var orderedArrayByPercentMatch = results.sorted(by: {$0.percent > $1.percent})
//        print(" ")
//        print(results)
//        print(" ")
        
        var returnButtons: [ButtonData] = []
        var count = 0
        for result in results {
            
            if count >= 3 {
                break
            }
            for item in result.buttonData {
                
                returnButtons.append(item)
                count += 1
                if count >= 3 {
                    break
                }
            }
//            returnButtons.append(result.buttonData)
            
            count += 1
            
        }
        
        
        return returnButtons
//        print(orderedArrayByPercentMatch)
//        return orderedArrayByPercentMatchn
        
//        for result in results {
//            if orderedArrayByPercentMatch.isEmpty {
//                orderedArrayByPercentMatch.append(result)
//            }
//            var count = 0
//            var added = false
//            for item in orderedArrayByPercentMatch {
//                if result.1 >= item.1 {
//                    orderedArrayByPercentMatch.insert(result, at: count)
//                    added = true
//                }
//                count += 1
//            }
//            if added
//
//        }
        
        
//        for word in words {
//            if word.contexts.contains(.colourThemeLight) || word.contexts.contains(.colourThemeDark) {
//                result = colourThemeIntent(words: words)
//            }
//            if word.contexts.contains(.on) || word.contexts.contains(.off) {
//                result = colourThemeIntent(words: words)
//            }
            
            
//            if word.contexts.contains(.name) {
//                result = changeName(words: words)
//            }
            
//            if word.contexts.contains(.call)  {
//                callMePhrase.append(word)
//            }
//            if word.contexts.contains(.user) {
//                callMePhrase.append(word)
//            }
          
            
//            if word.contexts.contains(.readingSpeed) {
//                result = readingSpeedIntent(words: words)
//            }
//
//            if result.isEmpty {
//                if word.contexts.contains(.increment)  {
//                    result =  increaseIntent(words: words)
//                } else if word.contexts.contains(.deincrement) {
//                    result = decreaseIntent(words: words)
//                }
//            }
//        }
//        print("Result = \(result)")
//        return result
    }
    
    func increaseIntent(words: [WordWithContext]) -> [ButtonData] {
    
        let button = ButtonData(title: "Increase Message Speed", action: .readingSpeedIncrease, global: true, premium: false)
        return [button]
    }
    
    func decreaseIntent(words: [WordWithContext]) -> [ButtonData] {
      
        let button = ButtonData(title: "Decrease Message Speed", action: .readingSpeedDecrease, global: true, premium: false)
        return [button]
    }
    
    func readingSpeedIntent(words: [WordWithContext]) -> [ButtonData] {
        
        var probability = 0
        var increase = false
        var decrease = false
        
        var buttonTitles:  [String] = []
        var buttonActions: [ButtonAction] = []
        
        for word in words {
            if word.contexts.contains(.readingSpeed) {
                probability += 1
            }
            if word.contexts.contains(.increment) {
                probability += 1
                increase = true
            } else if word.contexts.contains(.deincrement) {
                probability += 1
                decrease = true
            }
        }
        
        if increase == false && decrease == false {
            buttonTitles = ["Change Message Speed", "Increase Message Speed", "Decrease Message Speed"]
            buttonActions = [.showReadingSpeedWidget, .readingSpeedIncrease, .readingSpeedDecrease]
        } else if increase {
            buttonTitles = [ "Increase Message Speed"]
            buttonActions = [.readingSpeedIncrease]
        } else if decrease {
            buttonTitles = ["Decrease Message Speed"]
            buttonActions = [.readingSpeedDecrease]
        }
        
        var count = 0
        var buttons: [ButtonData] = []
        for title in buttonTitles {
            let button = ButtonData(title: title, action: buttonActions[count], global: true, premium: false)
            buttons.append(button)
            count += 1
        }
        
        return buttons
    }
    
    func colourThemeIntent(words: [WordWithContext]) -> [ButtonData] {
        var colourWord = ""
        var modWord = ""
        var strengthener = 0
        
        var dark = true
        var on = true
        
        
        for word in words {
            if word.contexts.contains(.colourThemeLight) {
                dark = false
                colourWord = "light"
                strengthener += 1
            }
            if word.contexts.contains(.colourThemeDark) {
                dark = true
                colourWord = "dark"
                strengthener += 1
                
            }
            if word.contexts.contains(.mode) {
                strengthener += 1
            }
            
            
            if word.contexts.contains(.on) {
                strengthener += 1
                on = true
                modWord = "on"
            } else if word.contexts.contains(.off) {
                strengthener += 1
                on = false
                modWord = "off"
            }
            
            
            
            //            let action: ButtonAction = .colourThemeAction
        }
        
        if modWord == "" && dark {
            if appInfo.colourTheme == .dark {
                modWord = "off"
                on = false
            } else if appInfo.colourTheme == .light {
                modWord = "on"
                on = true
            }
        }  else if modWord == "" && dark == false {
            if appInfo.colourTheme == .dark {
                modWord = "on"
                on = true
            } else if appInfo.colourTheme == .light {
                modWord = "off"
                on = false
            }
        }
        
        if modWord != "" && colourWord == "" {
            if modWord == "on" {
                if appInfo.colourTheme == .light {
                    colourWord = "dark"
                    dark = true
                } else {
                    colourWord = "light"
                    dark = false
                }
            } else if modWord == "off" {
                if appInfo.colourTheme == .light {
                    colourWord = "dark"
                    dark = true
                } else {
                    colourWord = "light"
                    dark = false
                }
            }
        }
        
        
        var action: ButtonAction = .none
        if dark && on {
            action = .darkModeOn
            
        } else if dark == false && on == true {
            action = .darkModeOff
        } else if dark == false && on == false {
            action = .darkModeOn
        } else if dark && on == false {
            action = .darkModeOff
        }
        
        // above will be usefull if I add multiple colour themes but with 2 it's kinda overkill
        
        colourWord = "Dark"
        if user.colourScheme == .dark {
            modWord = "Off"
            action = .darkModeOff
        } else {
            modWord = "On"
            action = .darkModeOn
        }
        
        let buttonTitle = "\(colourWord) Mode \(modWord)"
        let button = ButtonData(title: buttonTitle, action: action, global: true, premium: true)
        return [button]
    }
    
    func changeName(words: [WordWithContext]) -> [ButtonData] {
        
//        if words.con
        let changeNameButton = ButtonData(title: "Change Name", action: .changeName, global: true, premium: false)
//        print("Hit Change Name")
    return [changeNameButton]
    }
}
let findIntent = FindIntentFromWords()
