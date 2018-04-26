//
//  Dately.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-15.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation

// TODO: Date From Components (Look at Hydrate Actions for start of day)
struct Dately { // Dates Made Easy
    
    func isDateBeforeDateTwo(date: Date, dateTwo: Date) -> Bool {
        if date <= dateTwo {
            return true
        } else {
            return false
        }
    }
    
    func isSameDay(dateOne: Date, dateTwo: Date) -> Bool {
        let calendar = Calendar.current
        let dateOneYear = calendar.component(.year, from: dateOne)
        let dateOneMonth = calendar.component(.month, from: dateOne)
        let dateOneDay = calendar.component(.day, from: dateOne)
        
        let dateTwoYear = calendar.component(.year, from: dateTwo)
        let dateTwoMonth = calendar.component(.month, from: dateTwo)
        let dateTwoDay = calendar.component(.day, from: dateTwo)
        
        if dateOneYear != dateTwoYear {
            return false
        } else if dateOneMonth != dateTwoMonth {
            return false
        } else if dateOneDay != dateTwoDay {
            return false
        }
        return true
      
    }
    
    func isSecondDateWithin24HoursOfFirstDate(firstDate: Date, secondDate: Date) -> Bool{
        let firstDatePlus24h = firstDate.addingTimeInterval(86400)
        if secondDate < firstDatePlus24h {
            return true
        } else {
            return false
        }
    }
    
    func isSecondDateWithin18HoursOfFirstDate(firstDate: Date, secondDate: Date) -> Bool{
        let firstDatePlus18h = firstDate.addingTimeInterval(64800)
        if secondDate < firstDatePlus18h {
            
            return true
        } else {
            
            return false
        }
    }
    func dateComponentsFor(date: Date) -> (year: Int, month: Int, day: Int, hour: Int, minutes: Int, seconds: Int){
        let calendar = Calendar.current

        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        return (year, month, day, hour, minutes, seconds)
      
    }
}
let dately = Dately()
extension Date {
    
    var twoDaysAgo: Date {
        return Calendar.current.date(byAdding: .day, value: -2, to: noon)!
    }
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return tomorrow.month != month
    }
}
extension Date {
    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }
    var firstDayOfTheMonth: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
    }
}

