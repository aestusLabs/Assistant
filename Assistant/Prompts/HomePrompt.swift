//
//  HomePrompt.swift
//  Breathe
//
//  Created by Ian Kohlert on 2017-12-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
struct HomePrompt {
    
  
    
    func createBreathePrompt() -> Prompt {//Spelling And Grammar Checked
        
        if user.finishedOnboarding == false {
            let message = createAssistantMessageItem(text: "This is the Home screen.")
            let finishedMessage = createAssistantMessageItem(text: "Swipe left to go back to the Chat screen and finish up the set up procress.")
            return Prompt(promptType: .home, itemSegments: [[message, finishedMessage]], userInputUnrecognizedString: "", category: .home, answerFormat: [], action: .none)
        }
        let testIntegartionWidget = createIntegrationWidget(text: "Apple Health", image: #imageLiteral(resourceName: "Lungs"), isToggled: user.healthIntegration)
//        let testToggle = createToggleWidget(text: "Test: On", toggled: true, image: #imageLiteral(resourceName: "Lungs"))
        
//        let testWeekDaySelection = createDayOfWeekSelectionWidget()
       // let testExpandable = createTestingView()
//        let testCalendar = createCalendarMonthWidget()
//        let testingPointsWidget = createPointsWidget(title: "Test title", points: 200)
//        let testingButtonCloud = createButtonCloud(buttons: [("Test1", .exhale), ("Test2", .colourThemeAction), ("Test2lkasd1", .exhale), ("Teafasfst1", .exhale), ("Tesasfasft1", .exhale), ("Test1", .exhale), ("Test1", .exhale), ("Test1", .exhale), ("Test1", .exhale), ("Test1", .exhale), ("Test1", .exhale), ("Test1", .exhale), ("Test1", .exhale), ("Test1", .exhale), ("Test1", .exhale), ("Test1", .exhale), ("Test7", .exhale)])
        var welcomeArray: [Item] = []
        if user.brandNew {
            let newUserWelcome = createAssistantMessageItem(text: "You said you were a beginner so here is where I recommend you start:")
            let newUserButton = ButtonData(title: "Deep Breathing", action: .newUserStart, global: false, premium: false)
            let buttonCloud = createButtonCloud(buttons: [newUserButton], promptType: .home)
            let confidantMessage = createAssistantMessageItem(text: "If you feel like exploring the other exercises Breathe offers, tap the 'Select Exercise' or 'Guided Start'")
            welcomeArray = [newUserWelcome, buttonCloud, confidantMessage]
            
        } else {
        let welcomeMessage = createAssistantMessageItem(text: "Hello \(user.name), I hope you're having a good day.")
                let startSessionMessage = createAssistantMessageItem(text: "Would you like to start a new session?")
            welcomeArray = [welcomeMessage, startSessionMessage]
        }
    
//        let buttons1: [(String, ButtonAction)] = [("Select Exercise", .selectExercise), ("Guided Start", .guidedSelect)  ]
        var selectButton = ButtonData()
            selectButton.title = "Select Exercise"
            selectButton.action = .selectExercise
            selectButton.premium = false
            selectButton.global = false
        
        var guidedButton = ButtonData()
            guidedButton.title = "Guided Start"
            guidedButton.action = .guidedSelect
            guidedButton.global = false
            guidedButton.premium = false
        
        let buttons1: [ButtonData] = [selectButton, guidedButton]
        let buttonCloud1 = createButtonCloud(buttons: buttons1, promptType: .home)
        
        welcomeArray.append(buttonCloud1)
        
        
//        print(chatManager.pausedSession)
        
        if let pausedSession =  chatManager.pausedSession {
            let resumeMessage = createAssistantMessageItem(text: "You can resume your session by tapping below.")
            let session = pausedSession
            welcomeArray.append(resumeMessage)
            welcomeArray.append(session)

        }
        
//        let selectExerciseButton = createInViewButtonItem(text: "Select Exercise", action: .selectExercise) //createScrollViewButton(text: "Select Exercise", buttonType: .selectExercise)
//        let guidedStartButton = createInViewButtonItem(text:  "Guided Start", action: .guidedSelect) //createScrollViewButton(text: "Guided Start", buttonType: .guidedStart)
        
        
        let quickStart = createAssistantMessageItem(text: "Or would you like to start one of these sessions:") //createAssistantText(text: "Or would you can start one of these sessions:")
        
        let testRecommend = createPassableSession(sessionType: .shiningSkull, inhale: 1, exhale: 1, fullSustain: 0, emptySustain: 0, totalLengthInSeconds: 35, numberOfBreathsPerCycle: 5, breakLengthForCycle: 15, totalCycles: 2, secondsElapsed: 0, startOfLastBreath: 0)
        
        
        //createPassableSession(sessionType: .bellows, inhale: 1, exhale: 1, fullSustain: 0, emptySustain: 0, totalLengthInSeconds: 2, numberOfBreathsPerCycle: 1, breakLengthForCycle: 15, totalCycles: 1, secondsElapsed: 0, startOfLastBreath: 0)
       let firstRecomend = createPassableSession(sessionType: .deepBreathing, inhale: 3, exhale: 6, fullSustain: 0, emptySustain: 0, totalLengthInSeconds: 300, numberOfBreathsPerCycle: 0, breakLengthForCycle: 0, totalCycles: 0, secondsElapsed: 0, startOfLastBreath: 0)
               let secondRecomend = createPassableSession(sessionType: .deepBreathing, inhale: 3, exhale: 6, fullSustain: 0, emptySustain: 0, totalLengthInSeconds: 600, numberOfBreathsPerCycle: 0, breakLengthForCycle: 0, totalCycles: 0, secondsElapsed: 0, startOfLastBreath: 0)
        
        
        let learnMoreMessage = createAssistantMessageItem(text: "Learn more about the app or pranayama:")
        let learnAboutExercisesButton = ButtonData(title: "Learn About Exercises", action: .learnAboutExercises, global: false, premium: false)
        let learnButtonCloud = createButtonCloud(buttons: [learnAboutExercisesButton], promptType: .home)
        

        
        let navigateMessage = createAssistantMessageItem(text: "If you want to change some settings or look at our history:") //createAssistantText(text: "If you want to change some settings or look at your history:")
        
//        let settingsButton = createInViewButtonItem(text: "Settings", action: .goToSettings) //createScrollViewButton(text: "Settings", buttonType: .settings)
//        let historyButton =  createInViewButtonItem(text: "History", action: .goToHistory)//createScrollViewButton(text: "History", buttonType: .history)
//        let onboardingButton = createInViewButtonItem(text: "Onboarding", action: .goToOnboarding) //createScrollViewButton(text: "Onboarding Testing Purposes", buttonType: .onboarding)
//
        
        var howAppWorksButton = ButtonData(title: "How App Works", action: .showHowAppWorks, global: false, premium: false)
        
        var commandsButton = ButtonData()
            commandsButton.title = "View All Commands"
            commandsButton.action = .showAllGlobalCommands
        var settingsButton = ButtonData()
            settingsButton.title = "Settings"
            settingsButton.action = .goToSettings
        var historyButton = ButtonData()
            historyButton.title = "History"
            historyButton.action = .goToHistory
        var onboardingButton = ButtonData()
            onboardingButton.title = "Onboarding"
            onboardingButton.action = .goToOnboarding
        var addNotification = ButtonData()
            addNotification.title = "Turn On Daily Reminder"
            addNotification.action = .showDailyNotificationChooseDays
        var testButton = ButtonData(title: "Test Prompt", action: .showTestPrompt, global: false, premium: false)
        
        let navButtons = createButtonCloud(buttons: [howAppWorksButton, commandsButton, settingsButton, historyButton, onboardingButton, addNotification, testButton], promptType: .home)
        
        
        
        return Prompt(promptType: .home, itemSegments: [ welcomeArray, [quickStart, testRecommend, firstRecomend, secondRecomend], [learnMoreMessage, learnButtonCloud],   [navigateMessage, navButtons]], userInputUnrecognizedString: "This is your home screen. It's available at all times by swiping from the left side of your screen.", category: .home, answerFormat: [], action: .none)
    }
    
    func createHydrateHome() -> Prompt {
        let changeAbleTestWidget = createChangeableCalendarWidget()
           let welcomeMessage = createAssistantMessageItem(text: "Hello \(user.name), I hope you're having a good day.")
            let totalsWidget = createHydrateTotalsCompactWidget()
        let addMessage = createAssistantMessageItem(text: "Add water:")
        let add250mlButton = ButtonData(title: "250ml", action: .addWater, global: false, premium: false)
        let add500mlButton = ButtonData(title: "500ml", action: .addWater, global: false, premium: false)
        let add750mlButton = ButtonData(title: "750ml", action: .addWater, global: false, premium: false)
        let add1000mlButton = ButtonData(title: "1000ml", action: .addWater, global: false, premium: false)
        let addInputButton = ButtonData(title: "Input Amount", action: .showInputAddWaterPrompt, global: false, premium: false)
        
        let addCloud = createButtonCloud(buttons: [add250mlButton, add500mlButton, add750mlButton, add1000mlButton, addInputButton], promptType: .hydrateHome)
        let sliderAdd = createSliderAddWaterWidget() 
        
        let intervalsAtGlanceMessage = createAssistantMessageItem(text: "Here is how you’re doing today at a glance.")
        let intervalsAtGlanceWidget = createHydrateIntervalsAtAGlanceWidget()
        
        
        let otherThings = createAssistantMessageItem(text: "Here are some things you may want to do:")
        let changeGoalButton = ButtonData(title: "Change Goal", action: .changeHydrateGoal, global: false, premium: false)
        let changeAddPreciousIntervalButton = ButtonData(title: "Add To Previous Interval", action: .addWaterToPreviousInterval, global: false, premium: false)
        let stopNotificationsButton = ButtonData(title: "Mute Notifications For Rest Of Day", action: .muteHydrateReminderNotifications, global: false, premium: false)
        let otherCloud = createButtonCloud(buttons: [changeGoalButton, changeAddPreciousIntervalButton, stopNotificationsButton], promptType: .hydrateHome)
        
        let navigateMessage = createAssistantMessageItem(text: "If you want to change some settings or look at our history:")
        
        var howAppWorksButton = ButtonData(title: "How App Works", action: .showHowAppWorks, global: false, premium: false)
        
        var commandsButton = ButtonData()
        commandsButton.title = "View All Commands"
        commandsButton.action = .showAllGlobalCommands
        var settingsButton = ButtonData()
        settingsButton.title = "Settings"
        settingsButton.action = .goToSettings
        var historyButton = ButtonData()
        historyButton.title = "History"
        historyButton.action = .goToHistory
        var onboardingButton = ButtonData()
        onboardingButton.title = "Onboarding"
        onboardingButton.action = .goToOnboarding
        var addNotification = ButtonData()
        addNotification.title = "Turn On Daily Reminder"
        addNotification.action = .showDailyNotificationChooseDays
        var testButton = ButtonData(title: "Test Prompt", action: .showTestPrompt, global: false, premium: false)
        
        let navButtons = createButtonCloud(buttons: [howAppWorksButton, commandsButton, settingsButton, historyButton, onboardingButton, addNotification, testButton], promptType: .home)
        
        
        return Prompt(promptType: .hydrateHome, itemSegments: [[changeAbleTestWidget, welcomeMessage, totalsWidget], [addMessage, addCloud, sliderAdd], [intervalsAtGlanceMessage, intervalsAtGlanceWidget], [navigateMessage, navButtons]], userInputUnrecognizedString: "", category: .home, answerFormat: [], action: .none)
    }
    
    func hydrateGoodMorningPrompt() -> Prompt{
        let titleDivider = createTitleDivider(text: "Good Morning")
        let goalMessage = createAssistantMessageItem(text: "Here is your goal for the day. (You can tap to change it.)")
        var totalUnits = "ml"
        if hydrateManager.metric == false {
            totalUnits = "oz"
        }
        let compactInfoWidget = createCompactInformationData(mainText: "\(hydrateManager.dailyGoal)\(totalUnits)", subText: "Today's Goal")
        let remindersMessage = createAssistantMessageItem(text: "I will remind you to drink water throughout the day. (If you are under pace.")
        let turnOffButton = ButtonData(title: "Turn Off Today's Reminders", action: .muteHydrateReminderNotifications, global: false, premium: false)
        let reminderCloud = createButtonCloud(buttons: [turnOffButton], promptType: .hydrateHomeGoodMorning)
     
        let wakeUpMessage = createAssistantMessageItem(text: "What time did you wake up?")
        
        let currentDate = Date()
        let calendar = Calendar.current
        let currentHour = calendar.component(.hour, from: currentDate)
        
        var times: [Int] = [currentHour - 3, currentHour - 2, currentHour - 1, currentHour]
       
        
        var tempArray: [Int] = []
        for time in times {
            if time >= 0 {
                tempArray.append(time)
            }
        }
        times = tempArray
        
        var timesWithTimeCodes: [String] = []
        for time in times {
            if time >= 12 {
                timesWithTimeCodes.append("\(time - 12)pm")
            } else {
                timesWithTimeCodes.append("\(time)am")
            }
        }
        
        var buttons: [ButtonData] = []
        for time in timesWithTimeCodes {
            buttons.append(ButtonData(title: time, action: .setHydrateStartTime, global: false, premium: false))
        }
        let startNowButton = ButtonData(title: "Start Now", action: .setHydrateStartTime, global: false, premium: false)
        let inputStartButton = ButtonData(title: "Input Start Time", action: .showInputStartTimePrompt, global: false, premium: false)
        buttons.insert(inputStartButton, at: 0)
        buttons.append(startNowButton)
        let wakeUpTimeCloud = createButtonCloud(buttons: buttons, promptType: .hydrateHomeGoodMorning)
        
        return Prompt(promptType: .hydrateHomeGoodMorning, itemSegments: [[titleDivider, goalMessage, compactInfoWidget, remindersMessage, reminderCloud,wakeUpMessage, wakeUpTimeCloud ]], userInputUnrecognizedString: "", category: .home, answerFormat: [], action: .varied)
        
    }
}
let homePrompt = HomePrompt()








