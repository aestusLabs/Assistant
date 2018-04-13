//
//  Colours.swift
//  Breathe
//
//  Created by Ian Kohlert on 2017-12-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit



//struct Colours {
//    let app = AppColours()
//    let homeVC = ColoursForHomeVC()
//    let chatVC = ColoursForChatVC()
//    
//    
//}
//let getColour = Colours()


struct ColourByObject {
    
    func hydrateAppColour() -> UIColor {
        return specificColour.hydrateAppColour
    }
    func hydrateUnderGoalColour() -> UIColor {
        return specificColour.hydrateUnderGoalColour
    }
    
    func shadow() -> CGColor {
        if user.colourScheme == .light {
            return UIColor.lightGray.cgColor
        } else {
            return specificColour.black.cgColor
        }
    }
    func label() -> UIColor {
        if user.colourScheme == .light {
            return specificColour.black
        } else { //if user.colourScheme == .dark
            return specificColour.white
            
        }
    }
    
    func topBar() -> UIColor {
        if user.colourScheme == .light {
            return specificColour.white
        } else { //if user.colourScheme == .dark
            return specificColour.black
        }
    }
    
    func vcBackground() -> UIColor {
        if user.colourScheme == .light {
            return specificColour.superLightGrey
        } else { //if user.colourScheme == .dark
            return specificColour.almostBlack
        }
    }
    
    func assistantMessageBackground() -> UIColor {
        if user.colourScheme == .light {
            return specificColour.white
        } else { //if user.colourScheme == .dark
            return specificColour.black
        }
    }
    
    func chatBarBackground() -> UIColor {
        if user.colourScheme == .light {
            return specificColour.white
        } else { //if user.colourScheme == .dark
            return specificColour.black
        }
    }
    
    func chatBarPlaceholderLabel() -> UIColor {
        if user.colourScheme == .light {
            return specificColour.mediumGray
        } else { //if user.colourScheme == .dark
            return specificColour.mediumGray
        }
    }
    
    func premiumButton() -> UIColor {
        if user.colourScheme == .light {
            return specificColour.lightGrey
        } else { //if user.colourScheme == .dark
            return specificColour.darkGray
        }
    }
    func globalButton() -> UIColor {
        if user.colourScheme == .light {
            return specificColour.mediumGray
        } else { //if user.colourScheme == .dark
            return specificColour.black
        }
    }
    func regularButton() -> UIColor {
       return appColour()
        
    }
    
    func buttonLabel() -> UIColor {
        if user.colourScheme == .light {
            return specificColour.white
        } else { //if user.colourScheme == .dark
            return specificColour.almostBlack
        }
    }
    
     func appColour() -> UIColor {
        
        if appInfo.appType == .breathe {
            return specificColour.breatheAppColour
        } else {
            return specificColour.hydrateAppColour
        }
        
        if user.colourScheme == .light {
            return specificColour.breatheAppColour
        } else { //if user.colourScheme == .dark
            return specificColour.breatheAppColourDark
        }
    }
    
    func userMessage() -> UIColor {
        return appColour()
    }
    
    func userMessagePremium() -> UIColor {
        if user.colourScheme == .light {
            return specificColour.mediumGray
        } else { //if user.colourScheme == .dark
            return specificColour.darkGray
        }
    }
    
    func progressTrack() -> UIColor {
        return appColour()
    }
    func trackTint() -> UIColor {
        if user.colourScheme == .light {
            return specificColour.lightGrey
        } else { //if user.colourScheme == .dark
            return specificColour.darkGray
        }
    }
//    func playableSessionBackground() -> UIColor {
//        if user.colourScheme == .light {
//            return specificColour.white
//        } else { //if user.colourScheme == .dark
//            return specificColour.almostBlack
//        }
//    }
    
    func daySelectionCircle() -> UIColor {
        return appColour()
    }
    func cardBackground() -> UIColor {
        if user.colourScheme == .light {
            return specificColour.white
        } else { //if user.colourScheme == .dark
            return UIColor.black//specificColour.almostBlack
        }
    }
    func settingsButtonBackground() -> UIColor {
        if user.colourScheme == .light {
            return specificColour.white
        } else { //if user.colourScheme == .dark
            return specificColour.white
        }
    }
    func grey() -> UIColor { // Needs name
        if user.colourScheme == .light {
            return specificColour.lightGrey
        } else { //if user.colourScheme == .dark
            return specificColour.darkGray
        }
    }
    func fadedLabel() -> UIColor{
        if user.colourScheme == .light {
            return specificColour.mediumGray
        } else { //if user.colourScheme == .dark
            return specificColour.lightGrey
        }    }
    
}
let getColourFor = ColourByObject()
struct SpecificColour {
    let breatheAppColour = UIColor(red: 0.992156863, green: 0.6, blue: 0.733333333, alpha: 1.0)
    let breatheAppColourDark = UIColor(red: 1.0, green: 0.4, blue: 0.607843137, alpha: 1.0)

    let white = UIColor.white
    let lightGrey = UIColor(red: 0.933333333, green: 0.933333333, blue: 0.933333333, alpha: 1.0)
    
    let superLightGrey = UIColor(red: 0.97254902, green: 0.97254902, blue: 0.97254902, alpha: 1.0)
    let mediumGray = UIColor(red: 0.482352941, green: 0.482352941, blue: 0.482352941, alpha: 1.0)
    let darkGray = UIColor(red: 0.349019608, green: 0.3490196080, blue: 0.349019608, alpha: 1.0)
    
    let black = UIColor(red: 0.11372549, green: 0.11372549, blue: 0.11372549, alpha: 1.0)
    let slightlyDarkerThanAlmostBlack = UIColor(red: 0.184313725, green: 0.184313725, blue: 0.184313725, alpha: 1.0)
    let almostBlack = UIColor(red: 0.203921569, green: 0.203921569, blue: 0.203921569, alpha: 1.0)
 
    let hydrateAppColour = UIColor(red: 0.035294118, green: 0.792156863, blue: 1.0, alpha: 1.0)
    let hydrateUnderGoalColour = UIColor(red: 0.988235294, green: 0.380392157, blue: 0.4, alpha: 1.0)
}
let specificColour = SpecificColour()

struct AppColours {
    let grey = UIColor(red: 0.97254902, green: 0.97254902, blue: 0.97254902, alpha: 1.0)
    let appColour = UIColor(red: 0.992156863, green: 0.6, blue: 0.733333333, alpha: 1.0)
    private let lightTopBar = UIColor.white
    private let darkTopBar  = UIColor.black
    
    private let lightChatBar = UIColor.white
    private let darkChatBar = UIColor.black
    
    func chatBar() -> UIColor {
        if appInfo.colourTheme == .light {
            return lightChatBar
        } else {
            return darkChatBar
        }
    }
    
    func topBar() -> UIColor {
        if appInfo.colourTheme == .light {
            return lightTopBar
        } else {
            return darkTopBar
        }
    }
}
let appColours = AppColours()

struct ColoursForHomeVC {
    private let lightBackground = UIColor(named: "HomeScrollView Background")
    private  let darkBackground = UIColor.black
    
    func background() -> UIColor {
        if appInfo.colourTheme == .light {
            return lightBackground!
        } else {
            return darkBackground
        }
    }
}

struct ColoursForChatVC {
    private let lightBackground =  appColours.grey
    private let darkBackground = UIColor.black
    
    func background() -> UIColor {
        if appInfo.colourTheme == .light {
            return lightBackground
        } else {
            return darkBackground
        }
    }
    
}
