//
//  ChatManager.swift
//  Breathe
//
//  Created by Ian Kohlert on 2017-12-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

struct ChatManager {
    var pendingQueue: [PromptType] = []
    var currentVC: ViewControllers = .home
    
    // This is for buttons tapped on the tableView
    var actionOfButtonTapped: ButtonAction = .none
    var inputOfButtonTapped = ""
    var currentPromptType: PromptType? = nil
    var continueMessage = ""

    
    
    var buttonTappedPositionInItemsShown = -999
    var buttonTappedIndex = -999
    var tappedButtonText = ""

    
    
    var dailyNotificationDays: [Day] = [.tue]
    var dailyNotificationTime = ""
    
    
    var pausedSession: PassableSession? = nil
    var showKeyboard = false

}
var chatManager = ChatManager()
