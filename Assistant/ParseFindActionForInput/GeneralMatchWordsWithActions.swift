//
//  GeneralMatchWordsWithActions.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-11.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
//Spelling And Grammar Checked
struct MatchWordsWithContextWithActions {
    
    
    func findPossibleGeneralButtons(words: [WordWithContext]) -> [(ButtonData, Double)] {
        var possibleButtons: [(ButtonData, Double)] = []
        
        
        
        func checkIfPercentMet(percentMet: Double, buttonData: ButtonData) {
            if percentMet > 30 {
                possibleButtons.append((buttonData, percentMet))
            }
        }
            checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.how, .app, .work]), buttonData: ButtonData(title: "How Does The App Work?", action: .showHowAppWorks , global: true, premium: false))
            checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.notification, .manage, .change]), buttonData: ButtonData(title: "Manage Daily Notification", action: .showDailyNotificationChooseDays, global: true, premium: false))
            checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.notification, .turn, .on]), buttonData: ButtonData(title: "Turn On Notifications", action: .turnOnNotifications, global: true, premium: false))
            checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.notification, .turn, .off]), buttonData: ButtonData(title: "Turn Off Notifications", action: .turnOffNotifications, global: true, premium: false))
            checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.help]), buttonData: ButtonData(title: "I Need Help", action: .iNeedHelp, global: true, premium: false))
            
            
            // use a check of the number of possible buttons to see if increase or decrease buttons are used and if not and the change button is show all of them
            checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.change, .readingSpeed, .message, .speed,]), buttonData: ButtonData(title: "Change Message Speed", action: .readingSpeedChange, global: true, premium: false))
            checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.readingSpeed, .message, .speed, .increment]), buttonData: ButtonData(title: "Increase Message Speed", action: .readingSpeedIncrease, global: true, premium: false))
            checkIfPercentMet(percentMet: genericFindIntent(words: words, wordsToMatch: [.readingSpeed, .message, .speed, .deincrement]), buttonData: ButtonData(title: "Decrease Message Speed", action: .readingSpeedDecrease, global: true, premium: false))
            
        
        return possibleButtons
    }
    
    
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
        
        
        
        return (buttons, percentMet)
        
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
