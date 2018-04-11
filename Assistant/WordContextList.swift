//
//  WordContextList.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-05.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
struct WordWithContext {
    var word: String
    var contexts: [WordContext]
    var possibles: [String: WordContext]?
    var mostProbable: (String, WordContext)?
}

struct ParsableWord {
    let context: WordContext
    let words: [String]
}

struct WordContextList {
    
  
    
   // let test: (WordContext, [String]) = (.test, ["test", "testy"])
    
    let app = ParsableWord(context: .app, words: ["app"])
    
    let advanced = ParsableWord(context: .advanced, words: ["advanced"])
    
    let alternate = ParsableWord(context: .alternate, words: ["alternate"])
    
    let all = ParsableWord(context: .all, words: ["all"])
    
    let bellows = ParsableWord(context: .bellow, words: ["bellow", "bellows"])
    
    let beginner = ParsableWord(context: .beginner, words: ["beginner", "novice"])
    
    let breath = ParsableWord(context: .breath, words: ["breath", "breathe", "breathing"])
    
    let call = ParsableWord(context: .call, words: ["call"])

    let calm = ParsableWord(context: .calm, words: ["calm", "calming"])
    
    let change = ParsableWord(context: .change, words: ["change", "increase"])
    
    let circle = ParsableWord(context: .circle, words: ["circle", "circles"])
    
    let colourThemeLight = ParsableWord(context: .colourThemeLight, words: ["day", "light"])
    
    let colourThemeDark = ParsableWord(context: .colourThemeDark, words: ["dark", "night"])
    
    let command = ParsableWord(context: .command, words: ["command", "commands"])
    
    let count = ParsableWord(context: .count, words: ["count", "counted"])
    
    let deep = ParsableWord(context: .deep, words: ["deep"])
    
    let deincrement = ParsableWord(context: .deincrement, words: ["decrease"])
    
    let difference = ParsableWord(context: .difference, words: ["difference"])
    
    let dots = ParsableWord(context: .dots, words: ["dot", "dots"])
    
    let down = ParsableWord(context: .down, words: ["down", "downwards"])
    
    let empty = ParsableWord(context: .empty, words: ["empty"])
    
    let energy = ParsableWord(context: .energy, words: ["energy", "energize"])
    
    let exercise = ParsableWord(context: .exercise, words: ["exercise", "exercises"])
    
    let exhale = ParsableWord(context: .exhale, words: ["exhale", "exhalation"])
    
    let explain = ParsableWord(context: .explain, words: ["explain", "explanation"])
    
    let focus = ParsableWord(context: .focus, words: ["focus", "focused"])
    
    let full = ParsableWord(context: .full, words: ["full"])
    
    let go = ParsableWord(context: .go, words: ["go"])
    
    let help = ParsableWord(context: .help, words: ["help"])
    
    let history = ParsableWord(context: .history, words: ["history"])
    
    let how = ParsableWord(context: .how, words: ["how"])
    
    let intermediate = ParsableWord(context: .intermediate, words: ["intermediate"])
    
    let increment = ParsableWord(context: .increment, words: ["increase"])
    
    let inhale = ParsableWord(context: .inhale, words: ["inhale", "inhalation"])
    
    let info = ParsableWord(context: .info, words: ["info", "information"])
    
    let lay = ParsableWord(context: .lay, words: ["lay", "laying"])
    
    let learn = ParsableWord(context: .learn, words: ["learn"])
    
    let manage = ParsableWord(context: .manage, words: ["manage"])
    
    let me = ParsableWord(context: .user, words: ["me", "I", "myself"])
    
    let mode = ParsableWord(context: .mode, words: ["mode"])

    let more = ParsableWord(context: .more, words: ["more", "expand", "additional"])
    
    let message = ParsableWord(context: .message, words: ["reading", "speed", "text", "message"])

    
    let name = ParsableWord(context: .name, words: ["name"])
    
    let navigation = ParsableWord(context: .navigation, words: ["navigate", "navigation"])
    
    let need = ParsableWord(context: .need, words: ["need"])
    
    let new = ParsableWord(context: .new, words: ["new"])
    
    let notification = ParsableWord(context: .notification, words: ["notification", "notifications"])
    
    let nostril = ParsableWord(context: .nostril, words: ["nostril"])
    
    let not = ParsableWord(context: .not, words: ["not"])
    
    let pranayama = ParsableWord(context: .pranayama, words: ["pranayama"])
    
    let posture = ParsableWord(context: .posture, words: ["posture"])
    
    let session = ParsableWord(context: .session, words: ["session"])
    
    let settings = ParsableWord(context: .settings, words: ["setting", "settings"])
    
    let skull = ParsableWord(context: .skull, words: ["skull", "skulls"])
    
    let shine = ParsableWord(context: .shine, words: ["shine", "shining", "shiny"])
    
    let show = ParsableWord(context: .show, words: ["show"])
    
    let sleep = ParsableWord(context: .sleep, words: ["sleep"])
    
    let sound = ParsableWord(context: .sound, words: ["sound", "volume"])
    
    let speed = ParsableWord(context: .speed, words: ["speed"])
    
    let start = ParsableWord(context: .start, words: ["start", "begin"])
    
    let sustain = ParsableWord(context: .sustain, words: ["sustain"])
    
    let sure = ParsableWord(context: .sure, words: ["sure"])
    
    let on = ParsableWord(context: .on, words: ["on"])
    
    let off = ParsableWord(context: .off, words: ["off"])
    
    let timeModifier = ParsableWord(context: .timeModifier, words: ["second", "seconds", "minute", "minutes", "hour", "hours"])
    
    let turn = ParsableWord(context: .turn, words: ["turn"])
    
    let what = ParsableWord(context: .what, words: ["what"])
    
    let work = ParsableWord(context: .work, words: ["works", "work"])
    
//    let call: (WordContext, [String]) = (.call, ["call"])
//
//    let calm: (WordContext, [String]) = (.calm, ["calm", "calming"])
//
//    let change : (WordContext, [String]) = (.change, ["change", "increase", "decrease"])
//
//    let colourThemeLight: (WordContext, [String]) = (.colourThemeLight, [ "day", "light"])
//    let colourThemeDark: (WordContext, [String]) = (.colourThemeDark, ["dark", "night"])
//
//    let deep  : (WordContext, [String]) = (.deep, ["deep"])
//    let deincrement : (WordContext, [String]) = (.deincrement, ["decrease"])
//    let direction: (WordContext, [String]) = (.direction, ["up", "down", "left", "right"])
//
//    let exercise: (WordContext, [String]) = (.exercise, ["exercise", "exercises"])
//    let pranayamaExerciseName: (WordContext, [String]) = (.pranayamaExerciseName, ["deep", "breathing", "calming", "calm", "breath", "counted", "count", "bellows", "bellow", "shining", "skull", "alternate", "nostril"])
//
//    let help : (WordContext, [String]) = (.help, ["help"])
//
//    let increment : (WordContext, [String]) = (.increment, ["increase"])
//
//    let learn: (WordContext, [String]) = (.learn, ["learn"])
//
//    let me: (WordContext, [String]) = (.user, ["me", "I", "myself"])
//
//    let mode: (WordContext, [String]) = (.mode, ["mode"])
//
//    let moreInfo : (WordContext, [String]) = (.moreInfo, ["more", "info", "explain"])
//
//    let name: (WordContext, [String]) = (.name, ["name"])
//
//
//    let navigation : (WordContext, [String]) = (.navigation, ["history", "settings"])
//
//    let readingSpeed : (WordContext, [String]) = (.readingSpeed, ["reading", "speed", "text", "message"])
//
//    let sound : (WordContext, [String]) = (.sound, ["sound", "volume", "mute"])
//
//    let speed: (WordContext, [String]) = (.readingSpeed, ["speed"])
//
//    //    let state : (WordContext, [String]) = (.state, ["on", "off", "toggle"])
//    let on : (WordContext, [String]) = (.on, ["on"])
//    let off: (WordContext, [String]) = (.off, ["off"])
//
//    let timeModifier : (WordContext, [String]) = (.timeModifier, ["second", "seconds", "minute", "minutes", "hour", "hours"])
//
    
    
    // If slow have functions that check against arrays following prompt answer paths
    // like [.number, .timeModifier]
    
    func getArrayOfAllContexts() -> [ParsableWord] {
        return   [app,advanced, alternate, all, beginner, bellows, breath, call, calm, change, circle, colourThemeLight, colourThemeDark, command, count,  deep, deincrement, difference, dots, down, empty, energy, exercise, exhale, explain, focus, full, go, help, history,  how, intermediate, increment, inhale, info, lay, learn, manage, me, mode, more, name, need, new, navigation, nostril, notification, not, message, pranayama, posture, session, settings, skull, show, shine, sleep, sound, speed, start, sustain, sure, on, off, timeModifier, turn, what, work]
    }
    func iterateOverAllItemsLookingForExactMatches(word: WordWithContext) -> WordWithContext{
        let arrayOfAllContexts = getArrayOfAllContexts()
        var tempWord = word
        for item in arrayOfAllContexts {
            if item.words.contains(word.word) {
                
                tempWord.contexts.append(item.context)
            }
        }
        return tempWord
    }
    
    func iterateOverAllItemsLookingForPartialMatch2(word: WordWithContext) -> WordWithContext {
        let arrayOfAllContexts = getArrayOfAllContexts()
        var tempWord = word
        var array: [String: WordContext] = [:]
        for item in arrayOfAllContexts {
            let arrayOfWords = item.words
            for wordInArray in arrayOfWords {
                if wordInArray.contains(tempWord.word) {
                    if array.values.contains(item.context) == false {
                        array[wordInArray] = item.context
                    }
                    //                    if array.contains(item.0) == false {
                    //
                    //                        array.append((item.0)
                    //                    }
                }
            }
            
        }
        //        if array.isEmpty == false {
        ////            array.append(.partial)
        //        }
        tempWord.possibles = array
//        print(tempWord)
        
        return tempWord
    }
    
    func iterateOverAllItemsLookingForPartialMatch(word: WordWithContext) -> [WordWithContext]{
        let arrayOfAllContexts = getArrayOfAllContexts()
        var tempWord = word
        var array: [WordWithContext] = []
        for item in arrayOfAllContexts {
            let arrayOfWords =  item.words
            for wordInArray in arrayOfWords {
                if wordInArray.contains(tempWord.word) {
                    tempWord.contexts.append(item.context)
                    tempWord.contexts.append(.partial)
                    tempWord.word = wordInArray
                    array.append( tempWord)
                    tempWord = word
                }
            }
        }
        return array
    }
    func findBy(context: WordContext) -> [String]{ // this will be worth it for searching partials / after first time a partial is identified it carries the context with it9
        // will also be benefiial for finding from prompt patten \
//        print(context)
        let dictionary: [WordContext: [String]] = [colourThemeDark.context : colourThemeDark.words, colourThemeLight.context : colourThemeLight.words, mode.context :mode.words]
        if let grabContext = dictionary[context] {
            
            return grabContext
        } else {
            return []
        }
        
    }
    
}
let wordContextList = WordContextList()
