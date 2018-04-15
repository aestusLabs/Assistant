//
//  ParseTime.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-03-06.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation




struct ParseTime {

func parseTime(text: String)  -> DateComponents {
    if text.contains(":") {
        return parseTimeWithColon(string: text)
    } else if isWrittenTime(string: text) {
        return parseWrittenTime(string: text)
    } else {
        return parseTimeWithNoSpace(string: text)
    }
    
}

private func parseTimeWithColon(string: String) -> DateComponents {
    /// 4am, 9PM
    // 3 am, 9 PM
    //3:09am // 4:38 PM
    
    var parsedHour = 0
    var parsedMinutes = 0
    
    let componentsSeperatedByColon = string.components(separatedBy: ":")
    
    if componentsSeperatedByColon.count != 2 {
        return DateComponents()
    }
    if let hour = Int(componentsSeperatedByColon[0]) {
        parsedHour = hour
    }
    
    var numbers = ""
    var letters = ""
    let split = splitIntoLettersAndNumbers(string: componentsSeperatedByColon[1])
    numbers = split.numbers
    letters = split.letters
    
    if let minutes = Int(numbers) {
        parsedMinutes = minutes
    }
    
    parsedHour += isPM(letters: letters, parsedHour: parsedHour)
    
    
    
    var dateComponents = DateComponents()
    dateComponents.hour = parsedHour
    dateComponents.minute = parsedMinutes
    return dateComponents
    
}



private func parseTimeWithNoSpace(string: String) -> DateComponents{
    var parsedHour = 0
    
    var numbers = ""
    var letters = ""
    
    let split = splitIntoLettersAndNumbers(string: string)
    numbers = split.numbers
    letters = split.letters
    
    if let hour = Int(numbers) {
        parsedHour = hour
    }
    
    parsedHour += isPM(letters: letters, parsedHour: parsedHour)
    
    var dateComponents = DateComponents()
    dateComponents.hour = parsedHour
    return dateComponents
}

private func parseWrittenTime(string: String) -> DateComponents {
    var parsedHour = 0
    var parsedMinutes = 0
    
    let words = string.components(separatedBy: " ")
    
    var numberWords: [String] = []
    var otherWords: [String] = []
    for word in words {
        if isWrittenNumber(userInput: word) != 9999{
            numberWords.append(word)
        } else {
            otherWords.append(word)
        }
    }
    
    if numberWords.count == 1 {
        parsedHour = isWrittenNumber(userInput: numberWords[0])
    } else if numberWords.count == 2 {
        parsedHour = isWrittenNumber(userInput: numberWords[0])
        parsedMinutes = isWrittenNumber(userInput: numberWords[1])
    } else if numberWords.count == 3 {
        parsedHour = isWrittenNumber(userInput: numberWords[0])
        parsedMinutes = isWrittenNumber(userInput: numberWords[1]) + isWrittenNumber(userInput: numberWords[2])
        
    }
    
    for word in otherWords {
        parsedHour += isPM(letters: word, parsedHour: parsedHour)
        
        if word == "afternoon" || word == "evening" || word == "night" {
            parsedHour += 12
        }
    }
    
    var dateComponents = DateComponents()
    dateComponents.hour = parsedHour
    dateComponents.minute = parsedMinutes
    return dateComponents
}

private func splitIntoLettersAndNumbers(string: String) -> (numbers: String, letters: String){
    var numbers = ""
    var letters = ""
    for letter in string {
        if let number = Int(String(letter)) {
            numbers += String(letter)
        } else  {
            if letter != " " {
                letters += String(letter)
            }
        }
    }
    return (numbers, letters)
}

private func isPM(letters: String, parsedHour: Int) -> Int {
    var add = 0
    let lowerCasedLetters = letters.lowercased()
    if lowerCasedLetters == "pm" || lowerCasedLetters == "p.m." || lowerCasedLetters == "p.m" || lowerCasedLetters == "pm."{
        if parsedHour <= 12 {
            add += 12
        }
    }
    return add
}

func isWrittenNumber(userInput: String) -> Int {
    //    if let number = Int(userInput) {
    //        return number
    //    }
    
    switch userInput {
    case "one":
        return 1
    case "two":
        return 2
    case "three":
        return 3
    case "four":
        return 4
    case "five":
        return 5
    case "six":
        return 6
    case "seven":
        return 7
    case "eight":
        return 8
    case "nine":
        return 9
    case "ten":
        return 10
    case "eleven":
        return 11
    case "twelve":
        return 12
    case "thirteen":
        return 13
    case "fourteen":
        return 14
    case "fifteen":
        return 15
    case "sixteen":
        return 16
    case "seventeen":
        return 17
    case "eighteen":
        return 18
    case "nineteen":
        return 19
    case "twenty":
        return 20
    case "thirty":
        return 30
    case "fourty":
        return 40
    case "fifty":
        return 50
    default:
        return 9999
    }
    
}


private func isWrittenTime(string: String) -> Bool {
    let words = string.components(separatedBy: " ")
    for word in words {
        if isWrittenNumber(userInput: word) != 9999{
//            print(word)
            return true
        }
    }
    return false
}
}
let timeParser = ParseTime()


// can't do 2 49pm,"four 52 in the afternoon"
// pass it over and convert all word numbers to numbers


