//
//  AppInfo.swift
//  Breathe
//
//  Created by Ian Kohlert on 2017-12-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

enum ColourTheme: String {
    case dark = "dark", light = "light"
}

struct AppInfo {
    let grey = UIColor(red: 0.97254902, green: 0.97254902, blue: 0.97254902, alpha: 1.0)
    let appColour = UIColor(red: 0.992156863, green: 0.6, blue: 0.733333333, alpha: 1.0)
    let widgetWidth: CGFloat = 375
    let inScrollViewButtonWidth: CGFloat = 335
    let helperName = "Jasper" // Ophelia
    var maxAssistantTextWidth: CGFloat = 0
    var colourTheme: ColourTheme = .light
    
   
}


var appInfo = AppInfo()
