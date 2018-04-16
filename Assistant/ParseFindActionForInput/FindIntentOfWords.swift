//
//  FindIntentOfWords.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-05.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
// Organize this next



// MARK: Possible Improvement have words to match be an array of (WordContext, Double) That way I can assign different amounts of weight to each word
func genericFindIntent(words: [WordWithContext], wordsToMatch: [WordContext]) -> Double {
    var percentMet = 0.0
    var percentToAdd = 100.0 / Double(wordsToMatch.count)
    for matchWord in wordsToMatch {
        for word in words {
            if word.contexts.contains(matchWord) {
                percentMet += percentToAdd
            }
        }
    }
    return percentMet
}


struct FindIntentFromWords {
    
    
    func triageUserInput(words: [WordWithContext], userInput: String) -> [ButtonData]{
//        var result: [ButtonData] = []
        var results: [(buttonData: [ButtonData], percent: Double)] = []
        
        // the ossiblity check will be removed and look for highest percentages and give multiple buttons if match multiple
        
        
        
        let matchWordsWithContextWithActions = MatchWordsWithContextWithActions()
        let generalButtons = matchWordsWithContextWithActions.findPossibleGeneralButtons(words: words)
        for button in generalButtons {
            results.append((buttonData: [button.0], percent: button.1))
        }
        
        
        if appInfo.appType == .assistant || appInfo.appType == .breathe {
            /// PUT all Breathe related intents here
            let breatheIntents = MatchWordsWithBreatheActions()
            let breatheButtons = breatheIntents.findPossibleBreatheButtons(words: words)
            for button in breatheButtons {
                results.append((buttonData: [button.0], percent: button.1))
            }
            
        }
        
      
        
        results.append(matchWordsWithContextWithActions.checkIfCallMeChangeNameIntent(words: words, userInput: userInput))
        results.append(matchWordsWithContextWithActions.chekIfChangeNameIntent(words: words, userInput: userInput))
        results.append(matchWordsWithContextWithActions.isColourSchemeIntent(words: words))
        results.append(matchWordsWithContextWithActions.navigate(words: words))

        if results.count == 1 {
            return results[0].buttonData
        }
        

        
        results =  results.sorted(by: {$0.percent > $1.percent})
        
        if results.count >= 2 { // this stops unrelated buttons from being shown when it's pretty sure
            if results[1].percent < 70  && results[0].percent > 80{
                return results[0].buttonData
            }
        }
    
        
        var returnButtons: [ButtonData] = []
        var count = 0
        for result in results {
            
            if count >= 3 {
                break
            }
            for item in result.buttonData {
                
                returnButtons.append(item)
                count += 1
                if count >= 3 {
                    break
                }
            }
//            returnButtons.append(result.buttonData)
            
            count += 1
            
        }
        
        
        return returnButtons
//
    }
    
  
}
let findIntent = FindIntentFromWords()



