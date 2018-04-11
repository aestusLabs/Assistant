//
//  OnboardingPrompt.swift
//  Breathe
//
//  Created by Ian Kohlert on 2017-12-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

struct OnboardingPrompts { //Spelling And Grammar Checked

    func onboardingPromptFor(promptType: PromptType) -> Prompt? {
        var prompt: Prompt? = nil
        switch promptType {
        case .welcome:
            prompt = onboardingPrompts.welcomeToApp()
        case .setName:
            prompt = onboardingPrompts.name()
            
        case .showHealthWarning:
            prompt = onboardingPrompts.healthWarning()
        case .checkReadingSpeedOK:
            prompt = onboardingPrompts.readingSpeed()
            
        case .setfamiliarity:
            prompt = onboardingPrompts.howFamiliar()
        case .explainVCs:
            prompt = onboardingPrompts.explainVCs()
        case .start:
            prompt = onboardingPrompts.getStarted()
        case .newToPranayamaLesson:
            prompt = onboardingPrompts.newToPranayama()
        case .howToChangeAnswer:
            prompt = onboardingPrompts.tapUserMessage()
            
            
        default:
            print("Not an onboarding prompt")
        }
        
        return prompt
    }
    
    
    func welcomeToApp() -> Prompt  { //Spelling And Grammar Checked
        let titleDivider = createTitleDivider(text: "Welcome")
        let welcome = createAssistantMessageItem(text: "Welcome to Breathe!")
        let howItWorks = createAssistantMessageItem(text: "Breathe works like a messaging app. You chat with me and I help you do what you want to do.")
        let noWorriesMessage = createAssistantMessageItem(text: "Don’t worry, it’s pretty straight forward and I’ll show you how it works.")
        let continueButton = ButtonData(title: "Continue", action: .continueWhatYouWereDoing, global: false, premium: false)
        let buttonCloud = createButtonCloud(buttons: [continueButton], promptType: .welcome)
        return Prompt(promptType: .welcome, itemSegments: [[titleDivider, welcome], [howItWorks], [noWorriesMessage, buttonCloud]], userInputUnrecognizedString: "I am sorry, I didn't recognize what you said. Here are some of the things you can ask me:", category: .onboarding, answerFormat: [], action: .none)
        
    }
    
   
    
    func name() -> Prompt {//Spelling And Grammar Checked
        let titleDivider = createTitleDivider(text: "Name")
        // TODO: See if their name is stored in the cloud/CoreData
        let message = createAssistantMessageItem(text: "I don’t believe we have met. I’m \(appInfo.helperName), what should I call you?")
        
        
        // t looks like you’ve used Breathe before, do you still want me to call you ______
        
        let showKeyboard = createLaunchKeyboardItem()
//        let continueButton = ButtonData(title: "Continue", action: .continueWhatYouWereDoing, global: false, premium: false)
//        let buttonCloud = createButtonCloud(buttons: [])
        return Prompt(promptType: .setName, itemSegments: [[titleDivider, message, showKeyboard ]], userInputUnrecognizedString: "I am sorry, I didn't recognize what you said. Here are some of the things you can ask me:", category: .onboarding, answerFormat: [], action: .keyboard)
    }
    
    
    func howFamiliar() -> Prompt {//Spelling And Grammar Checked
        let titleDivider = createTitleDivider(text: "Pranayama Knowledge")
        let message = createAssistantMessageItem(text: "How familiar are you with breathing exercises or pranayama?")
        let buttons = createButtonCloudFrom(titles: ["Beginner", "Intermediate", "Advanced"], action: .setFamiliarityWithPranayama, global: false, premium: false, promptType: .setfamiliarity)
        
        return Prompt(promptType: .setfamiliarity, itemSegments: [[titleDivider, message, buttons]], userInputUnrecognizedString: "", category: .onboarding, answerFormat: [], action: .setFamiliarityWithPranayama)
    }
    
    func readingSpeed() -> Prompt {
        let titleDivider = createTitleDivider(text: "Message Speed")

        let message = createAssistantMessageItem(text: "How is the speed of the message I show you been?")
        let explanationMessage = createAssistantMessageItem(text: "If the next message shows up as you finish reading the last one, the speed is perfect. If the next one pops up before you're done reading, it's too fast.")
        
        let wouldLikeToChangeMessage = createAssistantMessageItem(text: "Would you like to change the message speed?")
        let changeButton = ButtonData(title: "Change Speed", action: .showChangeReadingSpeed, global: false, premium: false)
        let continueButton = ButtonData(title: "Continue", action: .continueWhatYouWereDoing, global: false, premium: false)
        
      let buttons = createButtonCloud(buttons: [changeButton, continueButton], promptType: .checkReadingSpeedOK)
        
        return Prompt(promptType: .checkReadingSpeedOK, itemSegments: [[titleDivider, message], [explanationMessage], [wouldLikeToChangeMessage, buttons]], userInputUnrecognizedString: "", category: .onboarding, answerFormat: [], action: .none)

    }
    
    func healthWarning() -> Prompt {//Spelling And Grammar Checked
        let titleDivider = createTitleDivider(text: "Health Warning")
        let message = createAssistantMessageItem(text: "If you have asthma or other respiratory problems consult a doctor before attemping pranayama.")
        let continueButton = ButtonData(title: "Continue", action: .continueWhatYouWereDoing, global: false, premium: false)
        let buttonCloud = createButtonCloud(buttons: [continueButton], promptType: .showHealthWarning)
        buttonCloud.typeableAnswer = false
        return Prompt(promptType: .showHealthWarning, itemSegments: [[titleDivider, message, buttonCloud]], userInputUnrecognizedString: "", category: .onboarding, answerFormat: [], action: .continueWhatYouWereDoing)
    }
    
    func tapUserMessage() -> Prompt { //Spelling And Grammar Checked
        let titleDivider = createTitleDivider(text: "Change Your Answers")
        let message = createAssistantMessageItem(text: "If you change your mind about something you can double tap your answer.")
        let explainMessage = createAssistantMessageItem(text: "This will show you the options again.")
        let continueButton = ButtonData(title: "Continue", action: .finishOnboarding, global: false, premium: false)

        let buttonCloud = createButtonCloud(buttons: [continueButton], promptType: .howToChangeAnswer)
        buttonCloud.typeableAnswer = false
        
        return Prompt(promptType: .howToChangeAnswer, itemSegments: [[titleDivider, message], [explainMessage, buttonCloud]], userInputUnrecognizedString: "", category: .onboarding, answerFormat: [], action: .continueWhatYouWereDoing)
    }
 
    
    func explainVCs() -> Prompt { //Spelling And Grammar Checked
        let titleDivider = createTitleDivider(text: "How App Works")
        let message = createAssistantMessageItem(text: "This is the Chat screen. It’s where you will do just about everything in the app.")
        let explanationMessage = createAssistantMessageItem(text: "At the bottom is the chat bar. Feel free to tap it when the suggestion buttons aren't showing you the answer you wish to give.")
        let globalMessage = createAssistantMessageItem(text: "You can also use the chat bar to change settings like reading speed or toggling dark mode.")
        let homeMessage = createAssistantMessageItem(text: "The other screen is called Home. Home is your starting point for everything. From starting a new Breathe session to accessing the settings. It’s all available on a button in Home.")
        let swipeMessage = createAssistantMessageItem(text: "Swipe right on the Chat screen to go to the Home screen. (And vice versa)")
        let swipeNowMessage = createAssistantMessageItem(text: "Swipe Home now.")
        
        return Prompt(promptType: .explainVCs, itemSegments: [[titleDivider, message], [explanationMessage], [globalMessage], [homeMessage], [swipeMessage], [swipeNowMessage]], userInputUnrecognizedString: "", category: .onboarding, answerFormat: [], action: .none)
    }
    
    func newToPranayama() -> Prompt { //Spelling And Grammar Checked
        let titleDivider = createTitleDivider(text: "Starting Point")
        let message = createAssistantMessageItem(text: "Alright, so you’re new to pranayama. I guess we should start with what pranayama is.")
        let pranayamaIsMessage = createAssistantMessageItem(text: "Pranayama is a Sanskrit word that can be translated to breath control. You can think of pranayama as another word for breathing exercise.")
        let deepBreathingExplanation = createAssistantMessageItem(text: "In our first session will be doing Deep Breathing.")
        let beginnerMessage = createAssistantMessageItem(text: "As a beginner you will want to have an even inhalation and exhalation length. We are going to do a 5 minute session, inhaling for 2 seconds, then exhaling for 2 seconds.")
        let postureButton = ButtonData(title: "Learn About Proper Posture", action: .learnAboutPosture, global: false, premium: false)
        let getToItButton = ButtonData(title: "Let's Just Start", action: .startBeginnerSession, global: false, premium: false)
        let buttonCloud = createButtonCloud(buttons: [postureButton, getToItButton], promptType: .newToPranayamaLesson)
        return Prompt(promptType: .newToPranayamaLesson, itemSegments: [[titleDivider, message], [pranayamaIsMessage], [beginnerMessage, buttonCloud] ], userInputUnrecognizedString: "", category: .onboarding, answerFormat: [], action: .varied)
        
    }
    
    
//    func chatInfo() -> Prompt  {
//        let letYouKnow = "I just want to let you know a couple things about this app before we continue."
//        let readingSpeed = "You can increase or decrease the speed I send you messages. If you are a fast reader and are waiting for the next message just type 'increase reading speed'. If my messages are popping up to quickly, just type 'decrease reading speed'."
//        let taps = "If you want to see the next message tap the screen, if you want to see all my messages double tap the screen."
//        let assistantMessages = convertStringsToAssistantText(strings: [letYouKnow, readingSpeed, taps])
//
//        return Prompt(promptType: .setReadingSpeed, itemSegments: [[assistantMessages[0], assistantMessages[1], assistantMessages[2]]], userInputUnrecognizedString: "Sorry I didn't understand you.", category: .onboarding, answerFormat: [], action: .none)
//
//    }
    
//    func areYouFamiliar() -> Prompt  {
//        let question = createAssistantMessageItem(text: "I try to customize the app to your needs as much as possible so I will have some questions for you but I know you probably want to get started.")
//        let familiar = createAssistantMessageItem(text: "How familiar are you with Pranayama or breathing exercises?")
//        return Prompt(promptType: .familiar, itemSegments: [[question], [familiar]], userInputUnrecognizedString: "", category: .onboarding, answerFormat: [],  action: .none)
//    }'"""
    
    
    func getStarted() -> Prompt { //Spelling And Grammar Checked
//        let more = "Need to figure this message out"
        
        var start = ""
        var buttons: [String] = []
        
//        print(user.skillLevel)
        
        if user.skillLevel == .newby {
            start = "Since you are brand new we will try a Deep Breathing session. I'd recomend inhaling for 2 seconds then exhaling for 2 seconds but you can customize this if you'd like."
            buttons = ["Start", "Customize"]
        } else if user.skillLevel == .beginner {
            start = "Tap start and we will try a Deep Breathing session."
            buttons = ["Start"]
        } else {
            start = "OK time to choose an exercise."
            buttons = ["Select Exercise"]
        }
        
//        print(start)
        let messages = convertStringsToAssistantText(strings: [ start])
        
        return Prompt(promptType: .start, itemSegments: [[messages[0], messages[1]]], userInputUnrecognizedString: "", category: .onboarding, answerFormat: [], action: .none)
    }
    
    func howHomeWorks() {
        
    }
    
    
    
    func convertStringsToAssistantText(strings: [String]) -> [AssistantMessage]{
        var assistantTexts: [AssistantMessage] = []
        for string in strings {
            let text = createAssistantMessageItem(text: string)
            assistantTexts.append(text)
        }
        return assistantTexts
    }
}
let onboardingPrompts = OnboardingPrompts()
