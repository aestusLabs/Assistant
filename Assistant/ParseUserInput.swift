//
//  ParseUserInput.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-05.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
struct ParseUserInput {
    func parse(userInput: String, dictionaryOfPreviouslyParesed: [String: [WordContext]], currentPrompt: Prompt) -> [ButtonData] {
        
        if currentPrompt.promptType == .setName {
            
            return [ButtonData(title: userInput, action: .setName, global: false, premium: false)]
        }
        
// MARK: Get the context of the word
        let wordsWithContext = parseUserInputForContext(userInput: userInput, dictionaryOfPreviouslyParsed: dictionaryOfPreviouslyParesed, currentPrompt: currentPrompt)
        //  print(wordsWithContext)
        
        
//MARK: 1 See If Matches Current Prompt
        
//MARK:     See if it matches the current prompt answer format
        let currentPromptMatch = checkIfWordsMatch(answerFormat: currentPrompt.answerFormat, words: wordsWithContext)
        //print("currentPromptMatch \(currentPromptMatch)")
        
      
//MARK: Creates Button Title From Words
        // It also adds an s to second or minute if first word is a number > 1
        let buttonTitle = getButtonTitleFrom(words: wordsWithContext)
       
    
// MARK: See if it matches the current prompt
        if currentPromptMatch == .exact || currentPromptMatch == .exactWithExtraWords {
            if currentPrompt.answerFormat != [] {
//                print("Button Title: \(buttonTitle), action: current prompt action")
                
                let button = ButtonData(title: buttonTitle, action: .useCurrentPromptAction, global: false, premium: false)
                return [button]
            }
        }
        
// MARK:2 See If Matches Global Command
        
        
        
// MARK: Get Probabilities from wordsWithContext
        let possibleButtons = findIntent.triageUserInput(words: wordsWithContext, userInput: userInput)
//        let buttonTitles = possibleButtons.0
        
        //
//        let result =  findIntent.triageUserInput(words: wordsWithContext)
//       let buttonTitles = result.0
//        print("ButtonTitles = \(buttonTitles)")
//         let globalArrays =  globalAnswerFormats.getArrayOfGlobalAnswerFormats()
//         //    var arrayOfMatchingGlobal: [[WordContext]] = []
//         //    var matchesRatings: [ContextMatches] = []
//         for array in globalArrays {
//         let match = checkIfWordsMatch(answerFormat: array.0, words: wordsWithContext)
//         if match == .exact || match == .exactWithExtraWords {
//         print("Global match = \(match), \(array.1)")
//         return (buttonTitle, array.1)
//         //            matchesRatings.append( match)
//         }
//         }
        
//         print(wordsWithContext)
         //
 
 
        //    for word in wordsWithContext {
        ////        if word.contexts.contains(.ignore) || word.contexts.isEmpty {
        //
        ////        } else {
        //        if currentPromptMatch != .none || matchesRatings.isEmpty == false {
        //        buttonTitle += word.word
        //            buttonTitle += " "
        //        }
        ////        }
        //    }
        //    print("Button Title: \(buttonTitle), action \()")
        return possibleButtons
    }
    
    
    func getButtonTitleFrom(words: [WordWithContext]) -> String {
        var buttonTitle = ""
        
// MARK: Converts WordWithContext To Button Title Strings
        var over1Number = false
        for word in words {

            
            if word.contexts.count >= 1 {
                if word.contexts[0] == .number {
                    if word.word != "1" {
                        over1Number = true
                    }
                }
                buttonTitle += word.word
                if word.contexts[0] == .timeModifier && over1Number {
                    buttonTitle += "s"
                }
            }
            
            buttonTitle += " " // add's spaces between words
        }
        if buttonTitle != "" {
        buttonTitle.removeLast() // removes space at end
        }
        return buttonTitle
    }
    
    
    func parseUserInputForContext(userInput: String, dictionaryOfPreviouslyParsed: [String: [WordContext]], currentPrompt: Prompt) -> [WordWithContext]{
        
// MARK: Divide user input into words
        let words = formatUserString(userInput: userInput)
        //print(words)
        
// MARK: Add to word lists
        
        var wordLists : (parsed: [String], unparsed: [String]) = ([], [])
        if dictionaryOfPreviouslyParsed.count != 0 {
            wordLists = compareWordsToParsedDictionary(words: words, dictionary: dictionaryOfPreviouslyParsed)
        } else {
            wordLists.unparsed = words
        }
        
// MARK: Turn words into WordsWithContext
    // This is a custom class
        
        var wordsWithContext = turnWordsIntoWordsWithContext(words: wordLists.unparsed)
        
// MARK: Try to give word context
        wordsWithContext = compareWordsToCommonIgnoreList(words: wordsWithContext)
        wordsWithContext = checkIfNumber(words: wordsWithContext)
        wordsWithContext = checkForExactMatches(words: wordsWithContext)
        wordsWithContext = checkForPartialMatches2(words: wordsWithContext)
        wordsWithContext = guessWordForPartial2(words: wordsWithContext, currentPrompt: currentPrompt)

        return wordsWithContext
    }
    
    
    func formatUserString(userInput: String)  -> [String] {
        var userString = userInput
        userString = lowercaseString(userInput: userString)
        // TODO remove punctuation function
        let words = userString.wordsWithoutPunctuation// divideIntoWords(userString: userString)
//        print(words)
        return words
    }
    
    func lowercaseString(userInput: String) -> String {
        let lowerCased = userInput.lowercased()
        return lowerCased
    }
    func removePunctuation(userInput: String) -> String {
        let punctuationless = ""
        
        for letter in userInput {
            //        if letter
        }
        return ""
    }
    
    func divideIntoWords(userString: String) -> [String] {
        let words = userString.components(separatedBy: " ")
        return words
    }
    
    func compareWordsToParsedDictionary(words: [String], dictionary: [String:[WordContext]]) -> (unparsed: [String], parsed: [String]) {
        var unparsedWords: [String] = []
        var parsedWords: [String] = []
        for word in words {
            
            if dictionary.keys.contains(word) {
                parsedWords.append(word)
                
            } else {
                unparsedWords.append(word)
            }
        }
        return (unparsedWords, parsedWords)
    }
    
    func turnWordsIntoWordsWithContext(words: [String]) -> [WordWithContext] {
        var array : [WordWithContext]  = []
        for word in words {
            let wordWithContext = WordWithContext(word: word, contexts: [], possibles: nil, mostProbable: nil)
            array.append(wordWithContext)
        }
        return array
    }
    
    
    
    func checkIfNumber(words: [WordWithContext]) -> [WordWithContext] {
        var array: [WordWithContext] = []
        for word in words {
            var tempWord = word
            if  isNumber(userInput: word.word) != 9999 {
                tempWord.contexts.append(.number)
            }
            array.append(tempWord)
        }
        return array
    }
    
    func checkIfWordsMatch(answerFormat: [WordContext], words: [WordWithContext]) -> ContextMatches{
        
// MARK: Sees if the words are in the answerformat
        var matches: [Bool] = []
        for word in words {
            for context in word.contexts {
                if answerFormat.contains(context) {
                    //                    print(context)
                    matches.append(true)
                    break
                }
            }
        }

// MARK: Sees if they are an exact match
        if words.count == answerFormat.count && words.count == matches.count {
            return .exact
        } else if words.count > answerFormat.count && answerFormat.count == matches.count {
            return .exactWithExtraWords
        }
        
        return .none
        
    }
    
    
    func checkForExactMatches(words: [WordWithContext]) -> [WordWithContext] {
        var newArray: [WordWithContext] = []
        for word in words {
            var tempWord = word
            if word.contexts != [.ignore] {
                tempWord = wordContextList.iterateOverAllItemsLookingForExactMatches(word: word)
            }
            newArray.append(tempWord)
        }
        return newArray
    }
    
    func checkForPartialMatches2(words: [WordWithContext]) -> [WordWithContext] {
        var wordsArray: [WordWithContext] = []
        for word in words {
            var tempWord = word
            
            if word.contexts.isEmpty {
                tempWord = wordContextList.iterateOverAllItemsLookingForPartialMatch2(word: word)
            }
            wordsArray.append(tempWord)
        }
        return wordsArray
    }
    
    //    func checkForPartialMatches(words: [WordWithContext]) ->  [WordWithContext] {
    //        var newArray: [(String,[WordWithContext])] = []
    //
    //        for word in words {
    //            var tempWord = word
    //            if word.contexts.isEmpty {
    ////                newArray.append((word.word, []))
    ////                tempWord.
    //                newArray.append()
    //                //                tempWord.contexts.append(.partial)
    //            }
    ////            newArray.append(tempWord)
    //        }
    //        return newArray
    //    }
    
    struct CommonIgnoreList {
        let list = ["the"]
        
        func isOnList(word: String) -> Bool {
            
            return false
        }
    }
    let commonIgnoreList = CommonIgnoreList()
    
    func compareWordsToCommonIgnoreList(words: [WordWithContext] )  -> [WordWithContext] {
        var updatedArrayOfWords: [WordWithContext] = []
        for word in words {
            var tempWord = word
            if commonIgnoreList.isOnList(word: word.word) {
                let ignore = WordContext.ignore
                tempWord.contexts.append(ignore)
                updatedArrayOfWords.append(tempWord)
            }
            updatedArrayOfWords.append(word)
        }
        return updatedArrayOfWords
    }
    
    func guessWordForPartial2(words: [WordWithContext], currentPrompt: Prompt) -> [WordWithContext] {
        
        var array: [WordWithContext] = []
        var possibilitiesProbability: [Double] = []
        
        for word in words {
//            print ("Word \(word)")
            var tempWord = word
            let userInput = tempWord.word
//            print(currentPrompt.answerFormat)
            
            var probability = 0.0
            if let possibilities = tempWord.possibles{
                for possibility in possibilities {
//                    print("###################### ")
//                    print(possibility.key)
                    let lettersCount = userInput.count
//                    print( possibility.key.prefix(lettersCount))
                    if possibility.key.prefix(lettersCount) == userInput {
                        probability += 3
                    }
                    if currentPrompt.answerFormat.contains(possibility.value) {
                        probability += 2
                    }
                    
//                    print(probability)
                    possibilitiesProbability.append(probability)
                    if probability >= possibilitiesProbability.max()! {
                        tempWord.mostProbable = possibility
                        tempWord.word = possibility.key
                        tempWord.contexts = [possibility.value]
                    }
                    probability = 0.0
                    
                    
                }
                
//                print(tempWord)
                
                
            }
            array.append(tempWord)
        }
        return array
    }
    
    func guessWordForPartial(words: [WordWithContext], currentPrompt: Prompt) -> [WordWithContext] {
        // This will need to be updated to try and best guess what the word is not just the first one it finds
        
        var array: [WordWithContext] = []
        for word in words {
            var tempWord = word
            if word.contexts.contains(.partial) {
//                print(" ")
//                print(word)
                
                var wordList: [String] = []
                wordList = wordContextList.findBy(context: word.contexts.first!)
//                print(wordList)
                
                for context in word.contexts {
                    if currentPrompt.answerFormat.contains(context) {
                        wordList = wordContextList.findBy(context: context)
                    }
                }
//                print(wordList)
                
                for wordFromList in wordList {
                    if wordFromList.contains(tempWord.word) {
                        
                        tempWord.word = wordFromList
                        
                    }
                }
            }
            
            array.append(tempWord)
        }
        return array
    }
    
    func isNumber(userInput: String) -> Int {
        if let number = Int(userInput) {
            return number
        }
        
        return timeParser.isWrittenNumber(userInput:userInput)
//        switch userInput {
//        case "one":
//            return 1
//        case "two":
//            return 2
//        case "three":
//            return 3
//        case "four":
//            return 4
//        case "five":
//            return 5
//        case "six":
//            return 6
//        case "seven":
//            return 7
//        case "eight":
//            return 8
//        case "nine":
//            return 9
//        case "ten":
//            return 10
//        case "eleven":
//            return 11
//        case "twelve":
//            return 12
//        case "thirteen":
//            return 13
//        case "fourteen":
//            return 14
//        case "fifteen":
//            return 15
//        case "sixteen":
//            return 16
//        case "seventeen":
//            return 17
//        case "eighteen":
//            return 18
//        case "nineteen":
//            return 19
//        case "twenty":
//            return 20
//        default:
//            return 9999
//        }
        
    }
    
}
let parseUserInput = ParseUserInput()




enum ContextMatches {
    case exact, exactWithExtraWords, matchesMost, matchesSome, none
}
extension String {
    var wordsWithoutPunctuation: [String] {
        return components(separatedBy: .punctuationCharacters)
            .joined()
            .components(separatedBy: .whitespaces)
            .filter{!$0.isEmpty}
    }
}
