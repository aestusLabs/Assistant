//
//  Prompt.swift
//  Breathe
//
//  Created by Ian Kohlert on 2017-12-11.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation


struct Prompt {
    var promptType: PromptType = .error
    var itemSegments: [[Item]] = []
    var userInputUnrecognizedString = ""
    var category: PromptCategory = .error // probably don't need
    
    var answerFormat: [WordContext] = []
    var action: ButtonAction = .none // Need for suggestion buttons when user types
}

class Item {
    var type: ItemType = .none
    
}


