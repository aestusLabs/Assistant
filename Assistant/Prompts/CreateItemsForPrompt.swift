//
//  CreateItemsForPrompt.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-01-12.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

// MARK: PlayableSession
class PlayableSessionData: Item {
    var time = Int()
    var session = PassableSession()
    
    
}
func createPlayableWidgetItem(session: PassableSession) -> PlayableSessionData{
    let widget = PlayableSessionData()
    widget.type = .playableSession
    
    widget.session = session
   
    
    return widget
}
///---------------------------------------------------------------





// MARK: UserMessage

class UserMessage: Item {
    var text = String()
}


func createUserMessageItem(text: String) -> UserMessage {
    let message = UserMessage()
    message.text = text
    message.type = .userMessage
    return message
}

// ---------------------------------------------------------------


// MARK: AssitantMessage
class AssistantMessage: Item {
    var text = String()
}


func createAssistantMessageItem(text: String) -> AssistantMessage {
    let message = AssistantMessage()
    message.text = text
    message.type = .assistantMessage
    return message
}
//---------------------------------------------------------------


// MARK: BreatheSessionWidget
class BreatheSessionWidget: Item {
    var typeString = String()
    var timeString = String()
    var image = UIImage()
    var dots = UIView()
}

func createBreatheSessionWidgetItem(session: PassableSession) -> BreatheSessionWidget {
    let widget = BreatheSessionWidget()
    widget.typeString = myConvert.stringFrom(sessionType: session.sessionType)
    widget.timeString = myConvert.displayTimeFrom(seconds: session.totalLengthInSeconds)
//    widget.image
    widget.type = .sessionWidget
    
    return widget
    
}
//---------------------------------------------------------------


// MARK: PendingWidget
func createPendingItem() -> Item {
    let item = Item()
    item.type = .pending
    return item
}

// ---------------------------------------------------------------


// MARK: ButtonCloud

class ButtonCloudData: Item {
    //    var titles =  [String]()
    //    var actions = [ButtonAction]()
    var buttons: [ButtonData] = []//[(title: String, action: ButtonAction)]()
    // var buttonsBehindPayWall = [(title: String, action: ButtonAction)]()
    
    
    
    var userInputButtonSuggestions: [ButtonData] = []
    var tappedButtonIndex: Int? = nil
    var positionInItemsShown: Int = 0
    var collapsed: Bool = false
    var inputText = ""
    var animateShowing = true
    var promptType: PromptType? = nil
    var typeableAnswer = true
    var transformationToUserMessage = true
}

func createButtonCloud(buttons: [ButtonData], promptType: PromptType) -> ButtonCloudData { //[(title: String, action: ButtonAction)]
    let cloud = ButtonCloudData()
    cloud.type = .buttonCloud
    cloud.buttons = buttons
    cloud.promptType = promptType
    return cloud
}

// ---------------------------------------------------------------

// MARK: CalendarMonth
class CalendarMonth: Item {
    
}

func createCalendarMonthWidget() -> CalendarMonth {
    let calendar = CalendarMonth()
    calendar.type = .calendarMonth
    return calendar
}

// ---------------------------------------------------------------

// MARK: DayOfWeekSelect
class DayOfWeekSelectionData: Item {
    
}
func createDayOfWeekSelectionWidget() -> DayOfWeekSelectionData {
    let item = DayOfWeekSelectionData()
    item.type = .dayOfWeekSelection
    return item
}
// ---------------------------------------------------------------

// MARK: Launch Keyboard
class LaunchKeyboard: Item {
    
}
func createLaunchKeyboardItem() -> LaunchKeyboard {
    let item = LaunchKeyboard()
    item.type = .launchKeyboard
    return item
}
//---------------------------------------------------------------

// MARK: Point Widget

class PointsWidget:Item {
    var pointsString = String()
    var titleString = String()
    var image = UIImage()
}

func createPointsWidget(title: String, points: Int) -> PointsWidget {
    let widget = PointsWidget()
    widget.titleString = title
    widget.pointsString = "\(points) points"
    widget.type = .pointsWidget
    return widget
}

//---------------------------------------------------------------

// MARK: Toggle Widget

class ToggleWidget: Item {
    var text = String()
    var togglePosition = Bool()
    var image = UIImage()
}

func createToggleWidget(text: String, toggled: Bool, image: UIImage) -> ToggleWidget {
    let widget = ToggleWidget()
    widget.type = .toggleWidget
    widget.text = text
    widget.togglePosition = toggled
    widget.image = image
    return widget
}

// ---------------------------------------------------------------

class TitleDivider: Item {
    var text = String()
}
func createTitleDivider(text: String) -> TitleDivider {
    let divider = TitleDivider()
    divider.text = text
    divider.type = .titleDivider
    return divider
}



// ------------
class PassableSession: Item {

    
        var sessionType: SessionType = .unassigned
        var inhale = 0
        var exhale = 0
        var fullSustain = 0
        var emptySustain = 0
        var totalLengthInSeconds = 0
        var totalCycles = 0
    var numberOfBreathsPerCycle = 0
    var breakLengthForCycle = 0
    
    
        var secondsElapsed = 0
        var startOfLastBreath = 0
   

}

func createPassableSession(sessionType: SessionType, inhale: Int, exhale: Int, fullSustain: Int, emptySustain: Int, totalLengthInSeconds: Int,  numberOfBreathsPerCycle:Int, breakLengthForCycle:Int, totalCycles: Int, secondsElapsed: Int, startOfLastBreath: Int) -> PassableSession {
    
    let session = PassableSession()
    session.type = .passableSession
    session.sessionType = sessionType
    session.inhale = inhale
    session.exhale = exhale
    session.fullSustain = fullSustain
    session.emptySustain = emptySustain
    session.totalLengthInSeconds = totalLengthInSeconds
    session.totalCycles = totalCycles
    session.secondsElapsed = secondsElapsed
    session.startOfLastBreath = 0
    session.numberOfBreathsPerCycle = numberOfBreathsPerCycle
    session.breakLengthForCycle = breakLengthForCycle
    
    return session
}


//---------------------------------------------------------------

//MARK: IntegrationWidget
class IntegrationWidget: Item {
    var labelText = ""
    var image = UIImage()
    var isToggled = false
}
func createIntegrationWidget(text: String, image: UIImage, isToggled: Bool) -> IntegrationWidget{
    let widget = IntegrationWidget()
    widget.type = .integrationWidget
    widget.labelText = text
    widget.image = image
    widget.isToggled = isToggled
    return widget
}



//------


// MARK: SettingsButton:
class SettingsButton: Item {
    var text = ""
    var image = UIImage()
    var action: ButtonAction = .none
    
}
func createSettingsButton(text: String, buttonAction: ButtonAction, image: UIImage) -> SettingsButton {
    let button = SettingsButton()
    button.text = text
    button.type = .settingsButton
    button.image = image
    button.action = buttonAction
    return button
}

// ---------------------------------------------------------------

// MARK: CommandWidget
class CommandWidget: Item {
    var title = ""
    var bodyItems: [String] = []
    var isExpanded = false
    var position = 0
}

func createCommandWidget(title: String, bodyItems: [String], isExpanded: Bool) -> CommandWidget {
    let widget = CommandWidget()
    widget.title = title
    widget.bodyItems = bodyItems
    widget.type = .commandWidget
    widget.isExpanded = isExpanded
    return widget
}


//func createTestingView() -> ViewForTesting {
//    let item = ViewForTesting()
//    item.type = .test
//    return item
//}
//func createInViewButtonItem(text: String, action: ButtonAction) -> InViewButton2 {
//    let button = InViewButton2()
//    button.title = text
//    button.action = action
//    button.type = .inViewButton
//    return button
//}
//func createSpacerItem() -> Item2 {
//    let item = Item2()
//    item.type = .startingSpacer
//    return item
//}

//func createOverViewButtonItem(text: String, action: ButtonAction) -> OverViewButton2 {
//    let button = OverViewButton2()
//    button.title = text
//    button.action = action
//    button.type = .overViewButton
//    return button
//}


//func createChangeButtonItem(action: ButtonAction) -> ChangeButtonData {
//    let button = ChangeButtonData()
//    button.action = action
//    button.type = .changeButton
//    return button
//}
