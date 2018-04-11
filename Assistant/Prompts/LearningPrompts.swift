//
//  LearningPrompts.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-27.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
struct LearningPrompts {//Spelling And Grammar Checked
    
    func createPromptForLearning(promptType: PromptType) -> Prompt? {
        var prompt: Prompt? = nil
        switch promptType {
            
        case .showPranayamaBenefits:
            prompt = learningPrompts.benefitsBasics()
        case .showPranayamaBenefitsInDepth:
            prompt = learningPrompts.benefitsInDepth()
        case .showPostureExplanation:
            prompt = learningPrompts.posture()
        case .showHowToBreathe:
            prompt = learningPrompts.breath()
        case .learnAboutPranayama:
            prompt = learningPrompts.learnPranayamaBasics()
        case .learnMoreAboutDeepBreathing:
            prompt = learningPrompts.deepBreathing()
        case .learnMoreAboutCountedBreath:
            prompt = learningPrompts.countedBreath()
        case .learnMoreAboutAlternateNostrilBreathing:
            prompt = learningPrompts.alternateNostril()
        case .learnMoreAboutCalmingBreath:
            prompt = learningPrompts.calmingBreath()
        case .learnMoreAboutBellowsBreath:
            prompt = learningPrompts.bellowsBreath()
        case .learnMoreAboutShiningSkull:
            prompt = learningPrompts.shiningSkull()
            
        default:
            print("Not a learn more prompt")
        }
        return prompt
    }
    
    func learnPranayamaBasics() -> Prompt { //Spelling And Grammar Checked

        let titleDivider = createTitleDivider(text: "Pranayama Basics")
        let message = createAssistantMessageItem(text: "Pranayama is a Sanskrit word that can be translated to breath control. Prana means 'life force' or 'breath' and Ayama means 'to extend or draw out'. Or in other words Pranayama is a collection of breathing exercises where you exert control of your breath in various ways.")
//        let postureMessage = createAssistantMessageItem(text: "To do these exercises you should sit in a comfortable position, your back straight and with your head fully supported by your neck.")
//        let benefitsMessage = createAssistantMessageItem(text: "Pranayama has many benefits, including reduction of anxiety, lower blood pressure, increased energy and more.")
        let dontWorryMessage = createAssistantMessageItem(text: "Don't worry if it sounds complicated, the basic exercises are really quite simple.")
//        let doYouKnowHowMessage = createAssistantMessageItem(text: "Do you know what y")
       // let learnButton = ButtonData(title: "Learn More About Pranayama", action: .showLearnInDepthPranayamaExplanation, global: false, premium: false)
//        let benefitisButton = ButtonData(title: "Learn More About The Benefits", action: .showLearnInDepthBenefits, global: false, premium: false)
        let continueButton = ButtonData(title: "Continue", action: .continueWhatYouWereDoing, global: false, premium: false)
        let buttonCloud = createButtonCloud(buttons: [ continueButton], promptType: .learnAboutPranayama)
        return Prompt(promptType: .learnAboutPranayama, itemSegments: [[titleDivider, message], [dontWorryMessage, buttonCloud]], userInputUnrecognizedString: "", category: .learn, answerFormat: [], action: .varied)
    }
    

    
    func benefitsBasics() -> Prompt {//Spelling And Grammar Checked

        let titleDivider = createTitleDivider(text: "Benefits")
        let benefitsText = "Pranayama has many benefits including:"
        let benefitsList = ["reduce stress", "relax muscles", "increase energy",  "lower/stabalize blood pressure", "reduce anxiety/depression"]
        let benefitsMessageWithList = createAssistantMessageWithList(text: benefitsText, listItems: benefitsList)
        let learnMoreMessage = createAssistantMessageItem(text: "If you'd like to learn how a breathing exercise could possibly have an effect on any of the above items tap the 'Learn More' button below.")
        let learnButton = ButtonData(title: "Learn More", action: .showLearnMoreAboutPranayamaBenefits, global: false, premium: false)
        
         let continueButton = ButtonData(title: "Continue", action: .continueWhatYouWereDoing, global: false, premium: false)
        let buttonCloud = createButtonCloud(buttons: [learnButton, continueButton], promptType: .showPranayamaBenefits)
        buttonCloud.typeableAnswer = false
        return Prompt(promptType: .showPranayamaBenefits, itemSegments: [[titleDivider, benefitsMessageWithList], [learnMoreMessage, buttonCloud]], userInputUnrecognizedString: "", category: .learn, answerFormat: [], action: .varied)
        
    }
  
    func benefitsInDepth() -> Prompt {
        let titleDivider = createTitleDivider(text: "Benefits: In Depth")
        let message = createAssistantMessageItem(text:  "To explain how Pranayama can have all these fantastical benefits you need to understand a couple things about your body.")
        let message2 = createAssistantMessageItem(text: "You have something called the Autonomic Nervous System (ANS). Basically ANS is in charge of your bodies involuntary processes. (Think heart rate)")
        
        let message3 = createAssistantMessageItem(text: "ANS has 2 basic ‘modes’. The Sympathetic Nervous System (SNS) and  the Parasympathetic Nervous System (PNS).")
        
        let message4 = createAssistantMessageItem(text: "You can think of SNS as your “fight or flight” nervous system. It gives us energy to escape a predator (or finish a task at work).")
        
        let message5 = createAssistantMessageItem(text: "On the other hand, PNS is what allows us to relax. Pranayama takes us from SNS mode and puts us into PNS mode.")
        
        let message6 = createAssistantMessageItem(text: "Both are essential to your life but if we are always in SNS mode we will be stressed out, have high blood pressure, can cause digestive problems, etc.")
        
        let message7 = createAssistantMessageItem(text: "If you find yourself unable to relax, your body is stuck in SNS mode.  But thankfully Pranayama can help.")
        
        let message8 = createAssistantMessageItem(text: "Pranayama will change your brain over time, allowing you to switch to PNS faster.  Making it easier for your body to relax and reducing stress even when not your not doing the exercises.")
        
        let button = createButtonCloudWithOnlyContinueButton(promptType: .showPranayamaBenefitsInDepth)
        
        return Prompt(promptType: .showPranayamaBenefitsInDepth, itemSegments: [[titleDivider, message], [message2], [message3], [message4], [message5], [message6], [message7], [message8, button]], userInputUnrecognizedString: "", category: .learn, answerFormat: [], action: .continueWhatYouWereDoing)
        
    }
    
    
    func deepBreathing() -> Prompt {
        let titleDivider = createTitleDivider(text: "Learn About Deep Breathing")
        let message = createAssistantMessageItem(text: " Deep Breathing is precisely what the name implies. It is an exercise that focuses on breathing deeply from your diaphragm.")
        let message2 = createAssistantMessageItem(text: "If you’re a beginner it’s recommended you start with an even inhalation and exhalation length. For example, a 2 second inhalation, followed by a 2 second exhalation.")
        let message3 = createAssistantMessageItem(text: "As you become more experienced you can increase the exhalation length to double the inhalation length. For example, 3 second inhalation, 6 second exhalation.)")
        let message4 = createAssistantMessageItem(text: "To take it a step further you can sustain your breath after both your inhalation and exhalation. (Advanced practitioners only)")
        let message5 = createAssistantMessageItem(text: "Difficulty Level: Beginner -> Advanced")
        
        
        let startSessionButton = ButtonData(title: "Start Deep Breathing Session", action: .startDeepBreathingSession, global: false, premium: false)
        let continueButton = ButtonData(title: "Continue", action: .continueWhatYouWereDoing, global: false, premium: false)
        let buttons = createButtonCloud(buttons: [startSessionButton, continueButton], promptType: .learnMoreAboutDeepBreathing)
        
        return Prompt(promptType: .learnMoreAboutDeepBreathing, itemSegments: [[titleDivider, message], [message2], [message3], [message4], [message5, buttons] ], userInputUnrecognizedString: "", category: .learn, answerFormat: [], action: .continueWhatYouWereDoing)
  
    }
    
    func countedBreath() -> Prompt {
        let titleDivider = createTitleDivider(text: "Learn About Counted Breath")
        
        
        let message = createAssistantMessageItem(text: "Counted Breath is an exercise where as you breathe you count your breath up to 5 and then start over at one.")
        
        let message2 = createAssistantMessageItem(text: "Add to your total after you exhale.")
        let message3 = createAssistantMessageItem(text: "The goal is to maintain your concentration as your breathe. So if you find that you’ve stopped counting or that your count has gone past 5 you refocus and start back at 1.")
        let message4 = createAssistantMessageItem(text: "Difficulty Level: Beginner")
        
        let startSessionButton = ButtonData(title: "Start Counted Breath Session", action: .startCountedBreathSession, global: false, premium: false)
        let continueButton = ButtonData(title: "Continue", action: .continueWhatYouWereDoing, global: false, premium: false)
        let buttons = createButtonCloud(buttons: [startSessionButton, continueButton], promptType: .learnMoreAboutCountedBreath)
        
        return Prompt(promptType: .learnMoreAboutCountedBreath, itemSegments: [[titleDivider, message], [message2], [message3], [message4, buttons] ], userInputUnrecognizedString: "", category: .learn, answerFormat: [], action: .continueWhatYouWereDoing)
        
    }
    
    func alternateNostril() -> Prompt {
        let titleDivider = createTitleDivider(text: "Learn About Alternate Nostril Breathing")
        let message = createAssistantMessageItem(text: "Alternate Nostril Breathing is done by placing your right thumb over your right nostril and breathing deeply through your left nostril. Then release your thumb and press your ring finger over your left nostril and exhale through the right nostril. Then repeating that pattern.")
        let message2 = createAssistantMessageItem(text: "There is a variation where you continue holding down your ring finger and inhale through your right nostril. Switching which nostril is closed every breath and a half.")
        
        let message3 = createAssistantMessageItem(text: "Alternate Nostril Breathing can make you feel more alert and energetic.")
        
        let message4 = createAssistantMessageItem(text: "Difficulty: Intermediate")
        
        let startSessionButton = ButtonData(title: "Start Alternate Nostril Breathing Session", action: .startAlternateNostrilBreathSession, global: false, premium: false)
        let continueButton = ButtonData(title: "Continue", action: .continueWhatYouWereDoing, global: false, premium: false)
        let buttons = createButtonCloud(buttons: [startSessionButton, continueButton], promptType: .learnMoreAboutAlternateNostrilBreathing)
        
        return Prompt(promptType: .learnMoreAboutAlternateNostrilBreathing, itemSegments: [[titleDivider, message], [message2], [message3], [message4, buttons] ], userInputUnrecognizedString: "", category: .learn, answerFormat: [], action: .continueWhatYouWereDoing)
        
    }
    
    func calmingBreath() -> Prompt {
        
        let titleDivider = createTitleDivider(text: "Learn About Calming Breath")
        let message = createAssistantMessageItem(text: "Calming Breath uses a specific ratio of 4:7:8 (4 second inhale, 7 second sustain, and eight second exhale)  to calm you down. It acts as a natural tranquilizer for the nervous system.")
        let message2 = createAssistantMessageItem(text: "The effect is subtly when you first start doing the exercise but over time it can become more and more powerful.")
        let message3 = createAssistantMessageItem(text: "Steady practitioners of this exercise say it can put them to sleep in less than a minute.")
        let message4 = createAssistantMessageItem(text: "Difficulty: Intermediate")
        
        
        let startSessionButton = ButtonData(title: "Start Calming Breath Session", action: .startCalmingBreathSession, global: false, premium: false)
        let continueButton = ButtonData(title: "Continue", action: .continueWhatYouWereDoing, global: false, premium: false)
        let buttons = createButtonCloud(buttons: [startSessionButton, continueButton], promptType: .learnMoreAboutCalmingBreath)
        
        return Prompt(promptType: .learnMoreAboutCalmingBreath, itemSegments: [[titleDivider, message], [message2], [message3], [message4, buttons] ], userInputUnrecognizedString: "", category: .learn, answerFormat: [], action: .continueWhatYouWereDoing)
    }
    
    func bellowsBreath() -> Prompt {
        
        let titleDivider = createTitleDivider(text: "Learn About Bellows Breath")
        let message = createAssistantMessageItem(text: "Bellows Breath is done by breathing in and out as quickly as you can while keeping an even length for each part of the breath. You do this a number of times, new practitioners should go for 3 times. Then taking a break.")
        let message2 = createAssistantMessageItem(text: "You want to breathe deeply from the diaphragm.")
        let message3 = createAssistantMessageItem(text: "You should audibly hear both your inhale and exhale.")
        let message4 = createAssistantMessageItem(text: "This can be a great way to give yourself a quick energy boost.")
        
        let message5 = createAssistantMessageItem(text: "Difficulty: Advanced")
       
        let startSessionButton = ButtonData(title: "Start Bellows Breath Session", action: .startBellowsBreathSession, global: false, premium: false)
        let continueButton = ButtonData(title: "Continue", action: .continueWhatYouWereDoing, global: false, premium: false)
        let buttons = createButtonCloud(buttons: [startSessionButton, continueButton], promptType: .learnMoreAboutBellowsBreath)
        return Prompt(promptType: .learnMoreAboutBellowsBreath, itemSegments: [[titleDivider, message], [message2], [message3], [message4], [message5, buttons] ], userInputUnrecognizedString: "", category: .learn, answerFormat: [], action: .continueWhatYouWereDoing)
        
        
        
    }
    
    
    func shiningSkull() -> Prompt {
        
        let titleDivider = createTitleDivider(text: "Larn About Shining Skull Breath")
        let message = createAssistantMessageItem(text: "Shining Skull Breath is done by taking a long, slow inhale followed by a forceful exhale generated from your lower belly.")
        let message2 = createAssistantMessageItem(text: "More advanced users can speed up the inhale so you are taking a breath every 1-2 seconds.")
        let message3 = createAssistantMessageItem(text: "Difficulty: Advanced")
        
        let startSessionButton = ButtonData(title: "Start Shining Skull Breath Session", action: .startShiningSkullSession, global: false, premium: false)
        let continueButton = ButtonData(title: "Continue", action: .continueWhatYouWereDoing, global: false, premium: false)
        let buttons = createButtonCloud(buttons: [startSessionButton, continueButton], promptType: .learnMoreAboutShiningSkull)
        return Prompt(promptType: .learnMoreAboutShiningSkull, itemSegments: [[titleDivider, message], [message2], [message3,  buttons] ], userInputUnrecognizedString: "", category: .learn, answerFormat: [], action: .continueWhatYouWereDoing)
        
        
        
    }

    func posture() -> Prompt {
        let titleDivider = createTitleDivider(text: "Posture")
        let lotusMessage = createAssistantMessageItem(text: "Sitting in Lotus position is traditional way to practise Pranayama.")
        let postureMessage = createAssistantMessageWithList(text: "If you are unfamiliar with Lotus position:", listItems: ["Sit cross legged", "Straighten your spine to support your head", "Place hands on knees"])
        let layDownMessage = createAssistantMessageItem(text: "You can also do it laying down if sitting in uncomfortable.")
        let buttonCloud = createButtonCloudWithOnlyContinueButton(promptType: .showPostureExplanation)
        return Prompt(promptType: .showPostureExplanation, itemSegments: [[titleDivider, lotusMessage], [postureMessage], [layDownMessage, buttonCloud]], userInputUnrecognizedString: "", category: .learn, answerFormat: [], action: .continueWhatYouWereDoing)
        
    }
    
    func breath() -> Prompt {
        let titleDivider = createTitleDivider(text: "Breath")
        
        let throatMessage = createAssistantMessageItem(text: "You should feel and hear your breath in your throat. (Imagine inhaling and exhaling from your throat) ")
        let diaphramMessage = createAssistantMessageItem(text: "You also want to breathe from your diaphram rather than your upper chest.")
        let doItNowMessage = createAssistantMessageWithList(text: "Try breathing from your diaphram now", listItems: ["Place your right hand just below your ribcage", "Place your left hand on your chest", "Breathe in slowly", "Focus on raising your right hand with your breath"])
//        let notChestMessage = createAssistantMessageItem(text: "Your left hand should rise only slightly.")
        
        let buttonCloud = createButtonCloudWithOnlyContinueButton(promptType: .showHowToBreathe)
        
        return Prompt(promptType: .showHowToBreathe, itemSegments: [[titleDivider, throatMessage], [diaphramMessage], [doItNowMessage, buttonCloud]], userInputUnrecognizedString: "", category: .learn, answerFormat: [], action: .continueWhatYouWereDoing)
    }
    
}
let learningPrompts = LearningPrompts()

func createAssistantMessageWithList(text: String, listItems: [String]) -> AssistantMessage {
    var string = text
    for item in listItems {
        string += "\n    • \(item) "
    }
    return createAssistantMessageItem(text: string)
}
func createButtonCloudWithOnlyContinueButton(promptType: PromptType) -> ButtonCloudData {
    let continueButton = ButtonData(title: "Continue", action: .continueWhatYouWereDoing, global: false, premium: false)
    let buttonCloud =  createButtonCloud(buttons: [continueButton], promptType: promptType)
    buttonCloud.typeableAnswer = false
    return buttonCloud
}


