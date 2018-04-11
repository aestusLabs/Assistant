//
//  GlobalPrompts.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-08.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
struct GlobalPrompts {
    
    //Spelling And Grammar Checked

    func showCalmExercises() -> Prompt {
        let titleDivider = createTitleDivider(text: "Calm Exercises")
        let message = createAssistantMessageItem(text: "Here are some exercises to calm you down:")
        
        let deepBreathingButton =  ButtonData(title: "Deep Breathing", action: .selectedExercise, global: false, premium: false)
        let calmBreathingButton =  ButtonData(title: "Calming Breath", action: .selectedExercise, global: false, premium: false)

        let buttonCloud = createButtonCloud(buttons: [deepBreathingButton, calmBreathingButton], promptType: .displayCalmExercises)
        buttonCloud.typeableAnswer = false
       return Prompt(promptType: .displayCalmExercises, itemSegments: [[titleDivider, message, buttonCloud]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .selectedExercise)
    }
    
    func showFocusExercises() -> Prompt {
        let titleDivider = createTitleDivider(text: "Focus Exercises")
        let message = createAssistantMessageItem(text: "Here are some exercises to help you focus:")
        
        let altNostrilBreathButton = ButtonData(title: "Alternate Nostril Breath", action: .selectedExercise, global: false, premium: false)
        let countedBreathButton = ButtonData(title: "Counted Breath", action: .selectedExercise, global: false, premium: false)

        let buttonCloud = createButtonCloud(buttons: [altNostrilBreathButton, countedBreathButton], promptType: .displayFocusExercises)
        buttonCloud.typeableAnswer = false
       return  Prompt(promptType: .displayFocusExercises, itemSegments: [[titleDivider, message, buttonCloud]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .selectedExercise)
    }
    
    func showEnergyExercises() -> Prompt {
        let titleDivider = createTitleDivider(text: "Energy Exercises")
        let message = createAssistantMessageItem(text: "Here are some exercises to help energize you: (Warning: they are more advanced)")
        
       
        let shiningBreathingButton =  ButtonData(title: "Shining Skull Breath", action: .selectedExercise, global: false, premium: false)
        let bellowsBreathButton = ButtonData(title: "Bellows Breath", action: .selectedExercise, global: false, premium: false)
        let buttonCloud = createButtonCloud(buttons: [shiningBreathingButton, bellowsBreathButton], promptType: .displayEnergyExercises)
        buttonCloud.typeableAnswer = false
        return  Prompt(promptType: .displayEnergyExercises, itemSegments: [[titleDivider, message, buttonCloud]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .selectedExercise)
        
    }
    
    func showSleepExercises() -> Prompt {
        let titleDivider = createTitleDivider(text: "Sleep Exercises")
        let message = createAssistantMessageItem(text: "Here are some exercises to help you fall asleep:")
        
        let calmBreathingButton =  ButtonData(title: "Calming Breath", action: .selectedExercise, global: false, premium: false)

        let buttonCloud = createButtonCloud(buttons: [calmBreathingButton], promptType: .displaySleepExercises)
        buttonCloud.typeableAnswer = false
        return  Prompt(promptType: .displaySleepExercises, itemSegments: [[titleDivider, message, buttonCloud]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .selectedExercise)
        
    }
    
    func showBeginnerExercises() -> Prompt {
        let titleDivider = createTitleDivider(text: "Beginner Exercises")
        let message = createAssistantMessageItem(text: "Here are the exercises best for beginners:")
        let deepBreathingButton =  ButtonData(title: "Deep Breathing", action: .selectedExercise, global: false, premium: false)
        let countedBreathButton = ButtonData(title: "Counted Breath", action: .selectedExercise, global: false, premium: false)
        let buttonCloud = createButtonCloud(buttons: [deepBreathingButton, countedBreathButton], promptType: .showBeginnerExercises)
        buttonCloud.typeableAnswer = false
        return Prompt(promptType: .showBeginnerExercises, itemSegments: [[titleDivider, message, buttonCloud]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .none)

    }
    
    func showIntermediateExercises() -> Prompt {
        let titleDivider = createTitleDivider(text: "Intermediate Exercises")
        let message = createAssistantMessageItem(text: "Here are the intermediate exercises:")
        let calmBreathingButton =  ButtonData(title: "Calming Breath", action: .selectedExercise, global: false, premium: false)
        let altNostrilBreathButton = ButtonData(title: "Alternate Nostril Breath", action: .selectedExercise, global: false, premium: false)
        let buttonCloud = createButtonCloud(buttons: [calmBreathingButton, altNostrilBreathButton], promptType: .showBeginnerExercises)
        buttonCloud.typeableAnswer = false
        return Prompt(promptType: .showBeginnerExercises, itemSegments: [[titleDivider, message, buttonCloud]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .none)
    }
    
    func showAdvancedExercises() -> Prompt {
        let titleDivider = createTitleDivider(text: "Advanced Exercises")
        let message = createAssistantMessageItem(text: "Here are the advanced exercises:")
        let shiningBreathingButton =  ButtonData(title: "Shining Skull Breath", action: .selectedExercise, global: false, premium: false)
        let bellowsBreathButton = ButtonData(title: "Bellows Breath", action: .selectedExercise, global: false, premium: false)
        let buttonCloud = createButtonCloud(buttons: [shiningBreathingButton, bellowsBreathButton], promptType: .showBeginnerExercises)
        buttonCloud.typeableAnswer = false
        return Prompt(promptType: .showBeginnerExercises, itemSegments: [[titleDivider, message, buttonCloud]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .none)
    }
    
    func showAllGlobalCommandsAsList() -> Prompt {
        let titleDivider = createTitleDivider(text: "All Global Commands")
        let message = createAssistantMessageItem(text: "Here is everything you can do by typing:")
        
        let helpCommands = ["Help", "How does the app work?"]
        let helpMessage = createAssistantMessageWithList(text: "You can get help at any time by typing:", listItems: helpCommands)
        
        let learnCommands = ["Learn About Exercises", "Learn About Deep Breathing", "Learn About Counted Breath", "Learn About Calming Breath", "etc"]
        let learnMessage = createAssistantMessageWithList(text: "You can learn about the exercises by typing these phrases:", listItems: learnCommands)
        
        let darkCommands = ["Dark Mode On", "Dark Mode Off"]
        let darkMessage = createAssistantMessageWithList(text: "You can toggle dark mode on and off:", listItems: darkCommands)
        
        
        let messageCommands = ["Change Message Speed", "Increase Message Speed", "Decrease Message Speed"]
        let messageSpeedMessage = createAssistantMessageWithList(text: "You can change the speed messages are presented to you:", listItems: messageCommands)
        
        
        let changeNameCommands = ["Change name to _____", "Call me _____"]
        let changeNameMessage = createAssistantMessageWithList(text: "You can change what I call you by typing: (Don't type the underscores, type what you want me to call you.)", listItems: changeNameCommands)
        let backButton = ButtonData(title: "Back", action: .none, global: false, premium: false)
        let backCloud = createButtonCloud(buttons: [backButton], promptType: .showAllGlobalCommandsList)
        return Prompt(promptType: .showAllGlobalCommandsList, itemSegments: [[titleDivider, message], [helpMessage], [learnMessage], [darkMessage], [messageSpeedMessage], [changeNameMessage, backCloud]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .none)
    }
 
    func showAllGlobalCommands() -> Prompt {
        let titleDivider = createTitleDivider(text: "All Global Commands")
        let message = createAssistantMessageItem(text: "Here is everything you can do by typing:")
        
        let helpMessage = createAssistantMessageItem(text: "You can get help at any time by typing: help")
        let helpButton = ButtonData(title: "Help", action: .iNeedHelp, global: false, premium: false)
        let helpCloud = createButtonCloud(buttons: [helpButton], promptType: .showAllGlobalCommands)
        let learnMessage = createAssistantMessageItem(text: "You can learn about the exercises by typing these phrases:")
        
        let exerciseButton = ButtonData(title: "Learn About Exercises", action: .learnAboutExercises, global: false, premium: false)
        let deepButton = ButtonData(title: "Learn About Deep Breathing", action: .learnAboutDeepBreathing, global: false, premium: false)
        let countedButton = ButtonData(title: "Learn About Counted Breath", action: .learnAboutCountedBreath, global: false, premium: false)
        let calmingButton = ButtonData(title: "Learn About Calming Breath", action: .learnAboutCalmingBreath, global: false, premium: false)
        let alternateButton = ButtonData(title: "Learn About Alt Nostril Breathing", action: .learnAboutAltNostrilBreathing, global: false, premium: false)
        let bellowsButton = ButtonData(title: "Learn About Bellows Breath", action: .learnAboutBellowsBreath, global: false, premium: false)
        let shiningButton = ButtonData(title: "Learn About Shining Skull Breath", action: .learnAboutShiningSkullBreath, global: false, premium: false)
        let learnButtonCloud = createButtonCloud(buttons: [exerciseButton, deepButton, countedButton, calmingButton, alternateButton, bellowsButton, shiningButton], promptType: .showAllGlobalCommands)
        learnButtonCloud.typeableAnswer = false
        
        let darkModeMessage = createAssistantMessageItem(text: "You can toggle dark mode on and off:")
        let darkModeOnButton = ButtonData(title: "Dark Mode On", action: .darkModeOn, global: false, premium: true)
        let darkModeOffButton = ButtonData(title: "Dark Mode Off", action: .darkModeOff, global: false, premium: true)
        let darkCloud = createButtonCloud(buttons: [darkModeOnButton, darkModeOffButton], promptType: .showAllGlobalCommands)
        darkCloud.typeableAnswer = false
        
        let messageSpeedMessage = createAssistantMessageItem(text: "You can change the speed messages are presented to you:")
        let changeMessageSpeedButton = ButtonData(title: "Change Message Speed", action: .showChangeReadingSpeed, global: false, premium: false)
        let increaseMessageSpeed = ButtonData(title: "Increase Message Speed", action: .readingSpeedIncrease, global: false, premium: false)
        let decreaseMessageSpeed = ButtonData(title: "Decrease Message Speed", action: .readingSpeedDecrease, global: false, premium: false)
        let messageCloud = createButtonCloud(buttons: [changeMessageSpeedButton, increaseMessageSpeed, decreaseMessageSpeed], promptType: .showAllGlobalCommands)
        
        let changeNameMessage = createAssistantMessageItem(text: "You can change what I call you by typing: (Don't type the underscores, type what you want me to call you.)")
        let callmeButton = ButtonData(title: "Call me _____", action: .showChangeNamePrompt, global: false, premium: false)
        let changeNameButton = ButtonData(title: "Change name to _____", action: .showChangeNamePrompt, global: false, premium: false)
        let changeNameCloud = createButtonCloud(buttons: [callmeButton, changeNameButton], promptType: .showAllGlobalCommands)
        // createAssistantMessageWithList(text: "You can learn about the exercises by typing these phrases:", listItems: ["Learn about exercises", "Learn more about Deep Breathing", "Learn more about Counted Breath", "Learn more about Calming Breath", "Learn more about Alternate Nostril Breathing", "Learn more about Bellows Breath", "Learn more about Shining Skull Breath"])
//        let learnAboutExercisesButton = ButtonData(title: "Learn About Exercises", action: .learnAboutExercises, global: false, premium: false)
        
        return Prompt(promptType: .showAllGlobalCommands, itemSegments: [[titleDivider, message], [helpMessage, helpCloud], [learnMessage, learnButtonCloud], [darkModeMessage, darkCloud], [messageSpeedMessage,  messageCloud], [changeNameMessage, changeNameCloud] ], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .varied)
        
    }
//    func showReadingSpeedWidget() -> Prompt {
//        let message = createAssistantMessageItem(text: "You can use this slider to change how fast I show you a message before showing you the next.")
//                
//        let finishedMessage = createAssistantMessageItem(text: "If you would like to get back to what you were doing tap 'Continue' or I can show you a list of what else I can do.")
//        
//        let seeMoreButton = ButtonData(title: "See More", action: .seeMoreOfWhatICanDo, global: true, premium: false)
//        let continueButton = ButtonData(title: "Continue", action: .continueWhatYouWereDoing, global: false, premium: false)
//        let buttonCloud = createButtonCloud(buttons: [seeMoreButton, continueButton], promptType: .guidedPurposeOfSession)
//        
//
//        return Prompt(promptType: .guidedPurposeOfSession, itemSegments: [[message], [finishedMessage, buttonCloud]], userInputUnrecognizedString: "", category: .home, answerFormat: [], action: .readingSpeedChange)
//    }
    
    func setReadingSpeed() -> Prompt{
        let titleDivider = createTitleDivider(text: "Change Message Speed")
        let currentMessage = createAssistantMessageItem(text: "You are currently set to \(user.readingSpeed) message speed, but you can change it below.")
        let buttons = createButtonCloudFrom(titles: ["Super Slow", "Slow", "Average", "Fast", "Super Fast", "Instant" ], action: .setReadingSpeed, global: false, premium: false, promptType: .setReadingSpeed)
        buttons.typeableAnswer = false
        return Prompt(promptType: .setReadingSpeed, itemSegments: [[titleDivider, currentMessage, buttons]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .setReadingSpeed)
    }
    
    func continuePrompt() -> Prompt {
        let message = createAssistantMessageItem(text: chatManager.continueMessage)
        let continueButton = ButtonData(title: "Continue", action: .continueWhatYouWereDoing, global: false, premium: false)
        let button = createButtonCloud(buttons: [continueButton], promptType: .continueMessage) //createButtonCloud(buttons: [(title: "Continue", action: .continueWhatYouWereDoing)], premiumButtons: [])
        
        return Prompt(promptType: .continueMessage, itemSegments: [[message, button]], userInputUnrecognizedString: "", category: .home, answerFormat: [], action: .continueWhatYouWereDoing)
    }
    
    func learnAboutExercisesPrompt() -> Prompt {
        let titleDivider = createTitleDivider(text: "Learn About Exercises")
        let message = createAssistantMessageItem(text: "Which exercise would you like to learn more about?")
        let deepButton = ButtonData(title: "Deep Breathing", action: .learnAboutDeepBreathing, global: false, premium: false)
        let countedButton = ButtonData(title: "Counted Breath", action: .learnAboutCountedBreath, global: false, premium: false)
        let calmingButton = ButtonData(title: "Calming Breath", action: .learnAboutCalmingBreath, global: false, premium: false)
        let alternateButton = ButtonData(title: "Alternate Nostril Breathing", action: .learnAboutAltNostrilBreathing, global: false, premium: false)
        let bellowsButton = ButtonData(title: "Bellows Breath", action: .learnAboutBellowsBreath, global: false, premium: false)
        let shiningButton = ButtonData(title: "Shining Skull Breath", action: .learnAboutShiningSkullBreath, global: false, premium: false)
        let buttonCloud = createButtonCloud(buttons: [deepButton, countedButton, calmingButton, alternateButton, bellowsButton, shiningButton], promptType: .learnAboutExercises)
        buttonCloud.typeableAnswer = false
        return Prompt(promptType: .learnAboutExercises, itemSegments: [[titleDivider, message, buttonCloud]], userInputUnrecognizedString: "", category: .learn, answerFormat: [], action: .varied)
    }
    
    func howAppWorks() -> Prompt {
        let titleDivider = createTitleDivider(text: "How The App Works")
        let message = createAssistantMessageItem(text: "You switch between Home and Chat by swiping left and right, respectively.")
        let chatMessage = createAssistantMessageItem(text: "(You're on Chat right now.)")
        let changeMessage = createAssistantMessageItem(text: "You can change most answers by double tapping on them.")
        let typeMessage = createAssistantMessageItem(text: "I try to give you helpful suggestions but if they aren't what you want try typing. (Just tap the chat bar at the bottom.")
        let globalMessage = createAssistantMessageItem(text: "You can also type things like 'turn on dark mode' into the chat bar at any time. ")
        let learnAllGlobalCommands = ButtonData(title: "Learn All Global Commands", action: .showAllGlobalCommands, global: false, premium: false)
        let continueButton = ButtonData(title: "Continue", action: .continueWhatYouWereDoing, global: false, premium: false)
        let button = createButtonCloud(buttons: [continueButton], promptType: .showHowAppWorks)
        button.typeableAnswer = false
        return Prompt(promptType: .showHowAppWorks, itemSegments: [[titleDivider, message], [chatMessage], [changeMessage], [typeMessage], [globalMessage, button]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .continueWhatYouWereDoing)
        
    }
    
    func settingsHowAppWorks() -> Prompt {
        let titleDivider = createTitleDivider(text: "How The App Works")
        let message = createAssistantMessageItem(text: "You switch between Home and Chat by swiping left and right, respectively.")
        let changeMessage = createAssistantMessageItem(text: "You can change most answers by double tapping on them.")
        let typeMessage = createAssistantMessageItem(text: "I try to give you helpful suggestions but if they aren't what you want try typing. (Just tap the chat bar at the bottom.")
        let globalMessage = createAssistantMessageItem(text: "You can also type things like 'turn on dark mode' into the chat bar at any time. ")
        let learnAllGlobalCommands = ButtonData(title: "Learn All Global Commands", action: .showAllGlobalCommands, global: false, premium: false)
        let continueButton = ButtonData(title: "Back", action: .continueWhatYouWereDoing, global: false, premium: false)
        let button = createButtonCloud(buttons: [continueButton], promptType: .showHowAppWorksSettings)
        button.typeableAnswer = false
        return Prompt(promptType: .showHowAppWorksSettings, itemSegments: [[titleDivider, message], [changeMessage], [typeMessage], [globalMessage, button]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .continueWhatYouWereDoing)
        
    }
    // Top // Delete after global commands made
    func differenceBetweenBellowsAndShining() -> Prompt {
        let titleDivider = createTitleDivider(text: "Difference Between Bellows Breath And Shining Skull Breath")
        let message = createAssistantMessageItem(text: "The difference between Bellows Breath and Shining Skull Breath is fairly straight forward.")
        let bellowsMessage = createAssistantMessageItem(text: "With Bellows Breath you are controlling both the inhale and exhale. You use your diaphram to forcefully inhale and exhale.")
        let shiningSkullMessage = createAssistantMessageItem(text: "On the other hand, Shining Skull Breath is a forceful controlled exhale with a natural passive inhale. Once your lungs are empty you let your body fill them again. You are not trying to control it.")
        let continueButton = ButtonData(title: "Got It", action: .continueWhatYouWereDoing, global: false, premium: false)
        let button = createButtonCloud(buttons: [continueButton], promptType: .explainDifferenceBetweenBellowsAndShining)
        button.typeableAnswer = false
        
        return Prompt(promptType: .explainDifferenceBetweenBellowsAndShining, itemSegments: [[titleDivider, message], [bellowsMessage], [shiningSkullMessage, button]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .continueWhatYouWereDoing)
        
    }
    
    func explainIfTheyCanLayToPracticePranayama() -> Prompt {
        let titleDivider = createTitleDivider(text: "Prone Pranayama")
        let message = createAssistantMessageItem(text: "Yes, although they are traditionally done from a seated position you can do them from a prone position (laying down).")
        
        let continueButton = ButtonData(title: "Got It", action: .continueWhatYouWereDoing, global: false, premium: false)
        let button = createButtonCloud(buttons: [continueButton], promptType: .explainTheyCanLayWhileDoingPranyama)
        button.typeableAnswer = false
        return Prompt(promptType: .explainTheyCanLayWhileDoingPranyama, itemSegments: [[titleDivider, message, button]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .continueWhatYouWereDoing)
    }
    
    func explainDotsMeaning() -> Prompt {
        let titleDivider = createTitleDivider(text: "Meaning Of Dots")
        let message = createAssistantMessageItem(text: "The dots represent the 4 parts of the breath and their duration. Top left is inhale, top right is full sustain, bottom left is exhale, and bottom right is empty sustain.")
        let continueButton = ButtonData(title: "Got It", action: .continueWhatYouWereDoing, global: false, premium: false)
        let button = createButtonCloud(buttons: [continueButton], promptType: .explainTheDots)
        button.typeableAnswer = false
        return Prompt(promptType: .explainTheDots, itemSegments: [[titleDivider, message, button]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .continueWhatYouWereDoing)
    }
    
   
    
//    func learnAllGlobalCommands() -> Prompt {
//        let titleDivider = createTitleDivider(text: "Learn All Global Commands")
//        let items: [String] = []
//        let message = createAssistantMessageWithList(text: "Here is everything you can type into the chat bar:", listItems: items)
//        let continueButton = ButtonData(title: "Continue", action: .continueWhatYouWereDoing, global: false, premium: false)
//        let button = createButtonCloud(buttons: [continueButton], promptType: .showHowAppWorks)
//        button.typeableAnswer = false
//        return Prompt(promptType: .showAllGlobalCommands, itemSegments: <#T##[[Item]]#>, userInputUnrecognizedString: <#T##String#>, category: <#T##PromptCategory#>, answerFormat: <#T##[WordContext]#>, action: <#T##ButtonAction#>)
//    }
    
}
let globalPrompts = GlobalPrompts()
