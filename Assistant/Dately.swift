//
//  Dately.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-15.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation

struct Dately { // Dates Made Easy
    
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
}
let dately = Dately()
