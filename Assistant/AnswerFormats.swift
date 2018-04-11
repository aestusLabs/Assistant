//
//  AnswerFormats.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-05.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
struct AnswerFormats {
    let numberAndTimeModifier: [WordContext] = [.number, .timeModifier]
    //    let colourMode: [WordContext] = [.colourTheme, .mode]
    //    let flipColourMode: [WordContext] = [.state, .colourTheme, .mode]
    let readingSpeed: [WordContext] = [.readingSpeed, .readingSpeed, .change]
    let numberAndBreaths: [WordContext] = [.number, .breath]
    
}
let answerFormat = AnswerFormats()
