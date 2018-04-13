//
//  ItemType.swift
//  Breathe
//
//  Created by Ian Kohlert on 2017-12-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
enum ItemType {
    case none, assistantMessage, inViewButton, pending, communication, image, userMessage, widget, scrollViewButton, sessionWidget, startingSpacer, overViewButton
    case playableSession
    
    case button
    case pointsWidget
    case toggleWidget
    case buttonCloud
    case titleDivider
    case passableSession
    case calendarMonth
    case integrationWidget
    case dayOfWeekSelection
    
    case settingsButton
    case commandWidget
    
    case launchKeyboard
    
    case changeButton // after a user makes selection the text goes to the tableview as a userMessage, it is followed by a change button
    case test
    
    
    // MARK: Hydrate
    case hydrateTotalsWidget, hydrateIntervalsAtGlanceWidget
}
