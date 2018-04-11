//
//  OtherPrompts.swift
//  Breathe
//
//  Created by Ian Kohlert on 2017-12-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
struct OtherPrompts {
    
    //Spelling And Grammar Checked

    
    func createWouldYouLikeToSubscribePrompt() -> Prompt { //Spelling And Grammar Checked

        let message = createAssistantMessageItem(text:  "I’m sorry but that feature is only available to premium users.")
        let pleaMessage = createAssistantMessageItem(text: "My developer is trying to find a balance between fair compensation for the hundreds of hours that went into this app and your use of it.")
        let supportMessage = createAssistantMessageItem(text: "You’d also be supporting an independent app developer. (Which he super appreciates.)")
        let subscribeMessage = createAssistantMessageItem(text: "You can subscribe for just $3 a year.")
        
        let subscribeButton = ButtonData(title: "Subscribe", action: .subscribe, global: false, premium: false)
        let learnMoreButton = ButtonData(title: "Learn More", action: .learnMoreAboutSubscription, global: false, premium: false)
        let continueButton = ButtonData(title: "Continue", action: .continueWhatYouWereDoing, global: false, premium: false)
        
        let buttons = createButtonCloud(buttons: [subscribeButton, learnMoreButton, continueButton], promptType: .showSubscribe)//createButtonCloud(buttons: [(title:
        buttons.typeableAnswer = false

        return Prompt(promptType: .showSubscribe, itemSegments: [[message], [pleaMessage], [supportMessage], [subscribeMessage, buttons]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .varied)
        
    }
    
  
    
    
    func createWhatCanIHelpYouWithPrompt() -> Prompt { //Spelling And Grammar Checked

        print("hit whatCanIhelpwith creation")
//        let titleDivider = createTitleDivider(text: "W")
        let message = createAssistantMessageItem(text: "What can I help you with? ")
//        let message2 = createAssistantMessageItem(text: "What Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed diam mattis tellus imperdiet pulvinar. Quisque sed lacus quis mauris ornare efficitur. Nunc odio risus, sagittis a dictum lacinia, luctus ac diam. Sed nulla orci, suscipit id vehicula molestie, lobortis laoreet lorem. Nam nec orci vehicula, dictum dui at, dictum mi. Quisque convallis lacus non tellus faucibus molestie. Donec sed sagittis lectus. Morbi a tincidunt odio. Duis convallis velit vel ante scelerisque, vitae elementum ipsum dictum. Vivamus vitae nisi ultrices, condimentum sapien a, finibus metus. Donec ac sapien euismod, tempor purus non, vehicula lacus. Curabitur vehicula erat imperdiet lectus luctus, sit amet aliquet lectus ullamcorper. Sed id dui varius leo elementum dictum. Aenean finibus nibh at tortor venenatis porta. I help you with? ")

        
        let seebutton = ButtonData(title: "See Everything I Can Do", action: .showAllGlobalCommands, global: false, premium: false)
        let seeButtonCloud = createButtonCloud(buttons: [seebutton], promptType: .whatCanIHelpWith)
        seeButtonCloud.transformationToUserMessage = false
        let quickActionsMessage = createAssistantMessageItem(text: "Here are some things you might want to do")
        var darkModeMod = "On"
        var darkAction: ButtonAction = .darkModeOn
        if user.colourScheme == .dark {
            darkModeMod = "Off"
            darkAction = .darkModeOff
        }
        let darkButton = ButtonData(title: "Turn Dark Mode \(darkModeMod)", action: darkAction, global: false, premium: true)
        let changeReadingButton = ButtonData(title: "Change Reading Speed", action: .readingSpeedChange, global: false, premium: false)
        let newSessionButton = ButtonData(title: "Start New Session", action: .selectExercise, global: false, premium: false)
        let settingsButton = ButtonData(title: "Go To Settings", action: .goToSettings, global: false, premium: false)
        
        let buttonCloud = createButtonCloud(buttons: [darkButton, changeReadingButton, newSessionButton, settingsButton], promptType: .whatCanIHelpWith)
        buttonCloud.transformationToUserMessage = false
        buttonCloud.typeableAnswer = false

//        let showKeyboard = createLaunchKeyboardItem()
        
        
        // [message, seeButtonCloud], [quickActionsMessage, buttonCloud]
        return Prompt(promptType: .whatCanIHelpWith, itemSegments: [[message, seeButtonCloud], [quickActionsMessage, buttonCloud]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .varied)
    }
    func guidedPurposeOfSession() -> Prompt { //Spelling And Grammar Checked

        let titleDivider = createTitleDivider(text: "Your Goal")
        let message = createAssistantMessageItem(text: "What is your goal?")
//        let buttons = convertButtonTitlesToButtons(titles: ["Calm", "Focus", "Energy"], action: .guidedPurposeOfSession)
        
        let calmButton = ButtonData(title: "Calm", action: .showCalmExercises, global: false, premium: false)
        let focusButton = ButtonData(title: "Focus", action: .showFocusExercises, global: false, premium: false)
        let energyButton = ButtonData(title: "Energy", action: .showEnergyExercises, global: false, premium: false)
        let sleepButton = ButtonData(title: "Sleep", action: .showSleepExercises, global: false, premium: false)
        let buttonCloud = createButtonCloud(buttons: [calmButton, focusButton, energyButton, sleepButton], promptType: .guidedPurposeOfSession) //createButtonCloudFrom(titles: ["Calm", "Focus", "Energy", "Go To Sleep"], action: .guidedPurposeOfSession, global: false, premium: false, promptType: .guidedPurposeOfSession)
        buttonCloud.typeableAnswer = false

        
        
        return Prompt(promptType: .guidedPurposeOfSession, itemSegments: [[titleDivider, message, buttonCloud]], userInputUnrecognizedString: "", category: .home, answerFormat: [], action: .guidedPurposeOfSession)
    }
    
    func settings() -> Prompt {
        let contactMessage = createAssistantMessageItem(text: "If you'd like to contact the developer with praise, suggestions or problems:")
        
        
        
        let twitterButton = ButtonData(title: "Tweet Me", action: .tweet, global: false, premium: false)
        let emailButton = ButtonData(title: "Email Me", action: .email, global: false, premium: false)
        let siteButton = ButtonData(title: "Developers Site", action: .site, global: false, premium: false)
        let contactButtonCloud = createButtonCloud(buttons: [twitterButton, emailButton, siteButton], promptType: .settings)
        contactButtonCloud.transformationToUserMessage = false
       
        
        let likeTheAppMessage = createAssistantMessageItem(text: "If you like the app please rate or tell your friends. My developer will be super grateful.")
        let rateTheAppButton = ButtonData(title: "Rate The App", action: .rate, global: false, premium: false)
        
        let tellFriendsButton = ButtonData(title: "Tell Your Friends", action: .tellFriends, global: false, premium: false)
        
        let likeButtonCloud = createButtonCloud(buttons: [rateTheAppButton, tellFriendsButton], promptType: .settings)
        likeButtonCloud.transformationToUserMessage = false
        
        
        let unlockEverythingMessage = createAssistantMessageItem(text: "You can unlock everything Breathe has to offer by subscribing.")
        let learnMoreButton = ButtonData(title: "Learn More", action: .learnAboutPurchase, global: false, premium: false)
        
        let purchaseButton = ButtonData(title: "Subscribe", action: .subscribe, global: false, premium: false)
        
        let unlockButtonCloud = createButtonCloud(buttons: [learnMoreButton, purchaseButton], promptType: .settings)
        unlockButtonCloud.transformationToUserMessage = false

        
        
        let learnMoreMessage = createAssistantMessageItem(text: "If you'd like to learn more about the app or the breathing exercises:")
        let learnMoreAboutAppButton = ButtonData(title: "How The App Works", action: .learnHowAppWorks, global: false, premium: false)
            

        let learnMoreAboutExercisesButton = ButtonData(title: "Learn About The Exercises", action: .learnAboutExercises, global: false, premium: false)
        let learnMoreButtonCloud = createButtonCloud(buttons: [learnMoreAboutAppButton, learnMoreAboutExercisesButton], promptType: .settings)
        learnMoreButtonCloud.transformationToUserMessage = false
            
        
        let settingsMessage = createAssistantMessageItem(text: "If you want to make some adjustment to how the app works:")
        let toggleDarkModeButton = ButtonData(title: "Toggle Dark Mode", action: .darkMode, global: false, premium: true)
        
        let adjustVolumeButton = ButtonData(title: "Adjust Volume Levels", action: .volume, global: false, premium: false)
        
        let adjustSkillLevelButton = ButtonData(title: "Change Skill Level", action: .skillLevel, global: false, premium: false)
        let settingsButtonCloud = createButtonCloud(buttons: [toggleDarkModeButton, adjustVolumeButton, adjustSkillLevelButton], promptType: .settings)
        settingsButtonCloud.transformationToUserMessage = false
        
        let bugFeatureMessage = createAssistantMessageItem(text: "Find a bug? Or want to request a feature?")
        let submitBUtton = ButtonData(title: "Submit A Bug Or Feature Request", action: .email, global: false, premium: false)
        
        return Prompt(promptType: .settings, itemSegments: [[contactMessage,contactButtonCloud,
                                                                        likeTheAppMessage, likeButtonCloud,
                                                                        unlockEverythingMessage, unlockButtonCloud,
                                                                        learnMoreMessage, learnMoreButtonCloud,
                                                                        settingsMessage, settingsButtonCloud]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .none)
    }
    
    
    func newSettings() -> Prompt {
        
        
        let havingTroubleMessage = createTitleDivider(text: "Not Sure How App Works?")
            let howAppWorks = createSettingsButton(text: "How App Works", buttonAction: .showHowAppWorks, image: #imageLiteral(resourceName: "InfoIcon"))
            let globalCommands = createSettingsButton(text: "See All Global Commands", buttonAction: .showAllGlobalCommands, image: #imageLiteral(resourceName: "Global Icon"))
        
        
        var subscribeItems: [Item] = []
        if user.premium == false {
            let premiumDivider = createTitleDivider(text: "Subscribe To Unlock Everything")
            let learnButton = createSettingsButton(text: "Learn More", buttonAction: .learnMoreAboutSubscription, image: #imageLiteral(resourceName: "InfoIcon"))
            let subscribe = createSettingsButton(text: "Subscribe", buttonAction: .subscribe, image: #imageLiteral(resourceName: "SubscribeIcon"))
            subscribeItems = [premiumDivider, learnButton, subscribe]
        }
        
        
        let contactDivider = createTitleDivider(text: "Contact Developer")
        let twitter = createSettingsButton(text: "Tweet Me", buttonAction: .tweet, image: #imageLiteral(resourceName: "Twitter Icon"))
        let email = createSettingsButton(text: "Email Me", buttonAction: .email, image: #imageLiteral(resourceName: "Mail Icon"))
        let site = createSettingsButton(text: "My Site", buttonAction: .site, image: #imageLiteral(resourceName: "Site Icon"))
        let likeDivider = createTitleDivider(text: "Like The App?")
        let rate = createSettingsButton(text: "Rate It", buttonAction: .rate, image:  #imageLiteral(resourceName: "Rate Icon"))
        
        var customizeItems: [Item] = []
        let customizeApp = createTitleDivider(text: "Customize App")
        customizeItems.append(customizeApp)
        if user.colourScheme == .dark && user.premium{
            let darkMode = createSettingsButton(text: "Dark Mode Off", buttonAction: .darkModeOff, image: #imageLiteral(resourceName: "SettingsPlaceholder"))
            customizeItems.append(darkMode)
        } else if user.colourScheme == .light && user.premium {
            let darkMode = createSettingsButton(text: "Dark Mode On", buttonAction: .darkModeOn, image: #imageLiteral(resourceName: "SettingsPlaceholder"))
            customizeItems.append(darkMode)
        }
        
        let adjustSkillLevel = createSettingsButton(text: "Adjust Your Skill Level", buttonAction: .skillLevel, image: #imageLiteral(resourceName: "SettingsPlaceholder"))
        customizeItems.append(adjustSkillLevel)
        let changeName = createSettingsButton(text: "Change Your Name", buttonAction: .showChangeNamePrompt, image: #imageLiteral(resourceName: "SettingsPlaceholder"))
        customizeItems.append(changeName)
        
        let thanksTitle = createTitleDivider(text: "Thanks")
        
        let thanks = createAssistantMessageItem(text: "Thanks to Icons8 for the icons.")
        let thanksButton = createSettingsButton(text: "Go To Icons8", buttonAction: .goToIcons8, image: #imageLiteral(resourceName: "Icon 8 Icon"))
        let emThanks = createAssistantMessageItem(text: "Thanks to Emily Kohlert for design help.")
        let emThanksButton = createSettingsButton(text: "Go To Her Site", buttonAction: .goToEmilySite, image:  #imageLiteral(resourceName: "Site Icon"))
        //let thanksButton = ButtonData(title: "Go To Icons8.com", action: .goToIcons8, global: false, premium: false)
       // let thanksCloud = createButtonCloud(buttons: [thanksButton], promptType: .newSettings)
        
        
        return Prompt(promptType: .newSettings, itemSegments: [[havingTroubleMessage, howAppWorks, globalCommands], subscribeItems, [contactDivider, twitter, email, site],[likeDivider, rate], [thanksTitle, thanks, thanksButton, emThanks, emThanksButton]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .none)
    }
    
    
    func help() -> Prompt {
        let titleDivider = createTitleDivider(text: "Help")
        let message = createAssistantMessageItem(text: "Having trouble? No worries, I'm here to help.")
        let helpStartingSession = createAssistantMessageItem(text: "If you're having trouble using the app I can explain it again.")
        let explainHowAppWorksButton = ButtonData(title: "How Does App Work", action: .learnHowAppWorks, global: false, premium: false)
        let appWorksCloud = createButtonCloud(buttons: [explainHowAppWorksButton], promptType: .showHelp)
        
        
        
        let helpWithPranayama = createAssistantMessageItem(text: "If you're not sure how the breathing exercises work or want more info on what Pranayama is:")
        
        let explainHowToBreatheButton = ButtonData(title: "How Do I Do The Exercises", action: .showHowExercisesWork, global: false, premium: false)
        let explainPostureButton = ButtonData(title: "Help Me With My Posture", action: .showHelpWithPosture, global: false, premium: false)
        let exerciseHelpCloud = createButtonCloud(buttons: [explainPostureButton, explainHowToBreatheButton], promptType: .showHelp)
        exerciseHelpCloud.typeableAnswer = false
        
        return Prompt(promptType: .showHelp, itemSegments: [[titleDivider, message, helpStartingSession, appWorksCloud], [helpWithPranayama, exerciseHelpCloud]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .varied)
        
    }
    
    func testPrompt() -> Prompt {
        let titleDivider = createTitleDivider(text: "I AM Test")
        let message = createAssistantMessageItem(text: "Blah blah blah")
        let sessionButton = createPassableSession(sessionType: .deepBreathing, inhale: 2, exhale: 4, fullSustain: 0, emptySustain: 0, totalLengthInSeconds: 300, numberOfBreathsPerCycle: 1, breakLengthForCycle: 15, totalCycles: 0, secondsElapsed: 0, startOfLastBreath: 0)
        let pending = createPendingItem()
        let point = createPointsWidget(title: "200 point", points: 200)
        let monthcal = createCalendarMonthWidget()
        let wek = createDayOfWeekSelectionWidget()
        let showKe = createLaunchKeyboardItem()
        let usermes  = createUserMessageItem(text: "I am the user message")
        let toggle = createToggleWidget(text: "I a a togle", toggled: false, image: #imageLiteral(resourceName: "Lungs"))
        let integration = createIntegrationWidget(text: "Apple Health", image: #imageLiteral(resourceName: "Lungs"), isToggled: true)
        let settingsButton = createSettingsButton(text: "Test Test TEst", buttonAction: .none, image: #imageLiteral(resourceName: "SettingsPlaceholder"))
        
        return Prompt(promptType: .test, itemSegments: [[titleDivider, message, sessionButton, pending, monthcal, wek,  usermes, toggle, integration, settingsButton]], userInputUnrecognizedString: "", category: .other, answerFormat: [], action: .varied)
    }
    
    func messagesTestPrompt() {
        
    }
    
}
let otherPrompts = OtherPrompts()
