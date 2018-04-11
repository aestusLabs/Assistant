//
//  CalendarMonthTableViewCell.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-06.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class CalendarMonthTableViewCell: UITableViewCell {
    // Idea to allow it to increase in size
    // change height of background on awake form nib
    // change stackview heights
    // change size of text and do the .fitWdith thing
    
    
    
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var backgroundHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var monthLabel: UILabel!
    
    @IBOutlet weak var mondayLabel: UILabel!
    
    @IBOutlet weak var tuesdayLabel: UILabel!
    
    @IBOutlet weak var wednesdayLabel: UILabel!
    
    @IBOutlet weak var thursdayLabel: UILabel!
    
    @IBOutlet weak var fridayLabel: UILabel!
    
    @IBOutlet weak var saturdayLabel: UILabel!
    
    @IBOutlet weak var sundayLabel: UILabel!
    
    
    @IBOutlet weak var monday1Circle: UIView!
    @IBOutlet weak var monday1Number: UILabel!
    
    @IBOutlet weak var tuesday1Circle: UIView!
    @IBOutlet weak var tuesday1Number: UILabel!
    
    @IBOutlet weak var wednesday1Circle: UIView!
    @IBOutlet weak var wednesday1Number: UILabel!
    
    @IBOutlet weak var thursday1Circle: UIView!
    @IBOutlet weak var thursday1Number: UILabel!
    
    @IBOutlet weak var friday1Circle: UIView!
    @IBOutlet weak var friday1Number: UILabel!
    
    @IBOutlet weak var saturday1Circle: UIView!
    @IBOutlet weak var saturday1Number: UILabel!
    
    @IBOutlet weak var sunday1Circle: UIView!
    @IBOutlet weak var sunday1Number: UILabel!
    
    @IBOutlet weak var monday2Circle: UIView!
    @IBOutlet weak var monday2Number: UILabel!
    
    @IBOutlet weak var tuesday2Circle: UIView!
    @IBOutlet weak var tuesday2Number: UILabel!
    
    @IBOutlet weak var wednesday2Circle: UIView!
    @IBOutlet weak var wednesday2Number: UILabel!
    
    @IBOutlet weak var thursday2Circle: UIView!
    @IBOutlet weak var thursday2Number: UILabel!
    
    @IBOutlet weak var friday2Circle: UIView!
    @IBOutlet weak var friday2Number: UILabel!
    
    @IBOutlet weak var saturday2Circle: UIView!
    @IBOutlet weak var saturday2Number: UILabel!
    
    @IBOutlet weak var sunday2Circle: UIView!
    @IBOutlet weak var sunday2Number: UILabel!
    
    @IBOutlet weak var monday3Circle: UIView!
    @IBOutlet weak var monday3Number: UILabel!
    
    @IBOutlet weak var tuesday3Circle: UIView!
    @IBOutlet weak var tuesday3Number: UILabel!
    
    @IBOutlet weak var wednesday3Circle: UIView!
    @IBOutlet weak var wednesday3Number: UILabel!
    
    @IBOutlet weak var thursday3Circle: UIView!
    @IBOutlet weak var thursday3Number: UILabel!
    
    @IBOutlet weak var friday3Circle: UIView!
    @IBOutlet weak var friday3Number: UILabel!
    
    @IBOutlet weak var saturday3Circle: UIView!
    @IBOutlet weak var saturday3Number: UILabel!
    
    @IBOutlet weak var sunday3Circle: UIView!
    @IBOutlet weak var sunday3Number: UILabel!
    
    @IBOutlet weak var monday4Circle: UIView!
    @IBOutlet weak var monday4Number: UILabel!
    
    @IBOutlet weak var tuesday4Circle: UIView!
    @IBOutlet weak var tuesday4Number: UILabel!
    
    @IBOutlet weak var wednesday4Circle: UIView!
    @IBOutlet weak var wednesday4Number: UILabel!
    
    @IBOutlet weak var thursday4Circle: UIView!
    @IBOutlet weak var thursday4Number: UILabel!
    
    @IBOutlet weak var friday4Circle: UIView!
    @IBOutlet weak var friday4Number: UILabel!
    
    @IBOutlet weak var saturday4Circle: UIView!
    @IBOutlet weak var saturday4Number: UILabel!
    
    @IBOutlet weak var sunday4Circle: UIView!
    @IBOutlet weak var sunday4Number: UILabel!
    
    @IBOutlet weak var monday5Circle: UIView!
    @IBOutlet weak var monday5Number: UILabel!
    
    @IBOutlet weak var tuesday5Circle: UIView!
    @IBOutlet weak var tuesday5Number: UILabel!
    
    @IBOutlet weak var wednesday5Circle: UIView!
    @IBOutlet weak var wednesday5Number: UILabel!
    
    @IBOutlet weak var thursday5Circle: UIView!
    @IBOutlet weak var thursday5Number: UILabel!
    
    @IBOutlet weak var friday5Circle: UIView!
    @IBOutlet weak var friday5Number: UILabel!
    
    @IBOutlet weak var saturday5Circle: UIView!
    @IBOutlet weak var saturday5Number: UILabel!
    
    @IBOutlet weak var sunday5Circle: UIView!
    @IBOutlet weak var sunday5Number: UILabel!
    
    @IBOutlet weak var monday6Circle: UIView!
    @IBOutlet weak var monday6Number: UILabel!
    
    @IBOutlet weak var tuesday6Circle: UIView!
    @IBOutlet weak var tuesday6Number: UILabel!
    
    @IBOutlet weak var wednesday6Circle: UIView!
    @IBOutlet weak var wednesday6Number: UILabel!
    
    @IBOutlet weak var thursday6Circle: UIView!
    @IBOutlet weak var thursday6Number: UILabel!
    
    @IBOutlet weak var friday6Circle: UIView!
    @IBOutlet weak var friday6Number: UILabel!
    
    @IBOutlet weak var saturday6Circle: UIView!
    @IBOutlet weak var saturday6Number: UILabel!
    
    @IBOutlet weak var sunday6Circle: UIView!
    @IBOutlet weak var sunday6Number: UILabel!
    
    
    @IBOutlet weak var row6StackView: UIStackView!
    
    @IBOutlet weak var row6StackViewHeightConstraint: NSLayoutConstraint!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setColours()
//        background.backgroundColor = .white
        background.layer.cornerRadius = 16
        
//        background.layer.shadowColor = getColourFor.shadow() //UIColor.lightGray.cgColor
        background.layer.shadowOpacity = 0.25
        background.layer.shadowOffset = CGSize(width: 0, height: 9)
        background.layer.shadowRadius = 8
        let circles = getAllCircles()
        for circle in circles {
            circle.layer.cornerRadius = 12.5
//            circle.backgroundColor = background.backgroundColor
        }
        let numbers = getAllNumberLabels()
        for number in numbers {
            number.text = ""
            number.font = UIFont.systemFont(ofSize: 15)
        }
        
//        updateNumbers(startDay: 6, numberOfDaysInMonth: 31)
        
        let testMonth = CalendarMonthData()
        testMonth.month = .feb
        testMonth.dayMonthStartsOn = .wed
        testMonth.activeDays = [3, 12, 9, 5, 19, 21, 23, 24]
        testMonth.numberOfDaysInMonth = 28
        
        monthLabel.text = convertMonthToString(month: testMonth.month)
        updateNumbers(startDay: convertDayToInt(startDay: testMonth.dayMonthStartsOn), numberOfDaysInMonth: testMonth.numberOfDaysInMonth)
        showCirclesFor(activeDays: testMonth.activeDays, dayMonthStarts: convertDayToInt(startDay: testMonth.dayMonthStartsOn))
        if monday6Number.text == "" {
            
//            row6StackView.isHidden = true
           row6StackView.removeFromSuperview()
//            row6StackViewHeightConstraint.constant = -row6StackViewHeightConstraint.constant
            backgroundHeightConstraint.constant = 250
//            self.layoutIfNeeded()
        }
    }
    func setColours() {
        background.layer.shadowColor = getColourFor.shadow()
        background.backgroundColor = getColourFor.cardBackground()
        monthLabel.textColor = getColourFor.label()
        let numbers = getAllNumberLabels()
        for number in numbers {
            number.textColor = getColourFor.label()
        }
        mondayLabel.textColor = getColourFor.label()
        tuesdayLabel.textColor = getColourFor.label()
        wednesdayLabel.textColor = getColourFor.label()
        thursdayLabel.textColor = getColourFor.label()
        fridayLabel.textColor = getColourFor.label()
        saturdayLabel.textColor = getColourFor.label()
        sundayLabel.textColor = getColourFor.label()
        
        let circles = getAllCircles()
        for circle in circles {
            circle.backgroundColor = background.backgroundColor
        }
    }
    
    func showCirclesFor(activeDays: [Int], dayMonthStarts: Int) {
        let circles = getAllCircles()
        let numbers = getAllNumberLabels()
        
        for day in activeDays {
            circles[dayMonthStarts + 1 + day].backgroundColor = getColourFor.appColour()
            
            numbers[dayMonthStarts + 1 +  day].textColor = .white //background.backgroundColor
            numbers[dayMonthStarts + 1 + day].font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        }
    }
    
    func convertMonthToString(month: Month) -> String {
        switch month {
        case .jan:
            return "January"
        case .feb:
            return "February"
        case .mar:
            return "March"
        case .apr:
            return "April"
        case .may:
            return "May"
        case .jun:
            return "June"
        case .jul:
            return "July"
        case .aug:
            return "August"
        case .sep:
            return "September"
        case .oct:
            return "October"
        case .nov:
            return "November"
        case .dec:
            return "December"
        case .unassigned:
            return "Error"
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getAllCircles() -> [UIView] {
        return [monday1Circle, tuesday1Circle, wednesday1Circle, thursday1Circle, friday1Circle, saturday1Circle, sunday1Circle, monday2Circle, tuesday2Circle,wednesday2Circle, thursday2Circle, friday2Circle, saturday2Circle, sunday2Circle, monday3Circle, tuesday3Circle, wednesday3Circle, thursday3Circle, friday3Circle, saturday3Circle, sunday3Circle, monday4Circle, tuesday4Circle, wednesday4Circle, thursday4Circle, friday4Circle, saturday4Circle, sunday4Circle, monday5Circle, tuesday5Circle, wednesday5Circle, thursday5Circle, friday5Circle, saturday5Circle, sunday5Circle, monday6Circle, tuesday6Circle, wednesday6Circle, thursday6Circle, friday6Circle, saturday6Circle, sunday6Circle]
    }
    
    func getAllNumberLabels() -> [UILabel] {
        return [monday1Number, tuesday1Number, wednesday1Number, thursday1Number, friday1Number, saturday1Number, sunday1Number,monday2Number, tuesday2Number, wednesday2Number, thursday2Number, friday2Number, saturday2Number, sunday2Number, monday3Number, tuesday3Number, wednesday3Number, thursday3Number, friday3Number, saturday3Number, sunday3Number, monday4Number, tuesday4Number, wednesday4Number, thursday4Number, friday4Number, saturday4Number, sunday4Number, monday5Number, tuesday5Number, wednesday5Number, thursday5Number, friday5Number, saturday5Number, sunday5Number, monday6Number, tuesday6Number,wednesday6Number, thursday6Number, friday6Number, saturday6Number,sunday6Number]
    }
    
    
    func updateNumbers(startDay: Int, numberOfDaysInMonth: Int) {
        var numberLabelCount = startDay
        let allNumberLabels = getAllNumberLabels()
        for x in 1...numberOfDaysInMonth {
            allNumberLabels[numberLabelCount].text = "\(x)"
            numberLabelCount += 1
        }
    }
    
    func convertDayToInt(startDay: Day) -> Int {
        switch startDay {
        case .mon:
            return 0
        case .tue:
            return 1
        case .wed:
            return 2
        case .thu:
            return 3
        case .fri:
            return 4
        case .sat:
            return 5
        case .sun:
            return 6
            
        case .unassigned:
            return 37707
        }
    }
    
}

class CalendarMonthData {
    var month: Month = .unassigned
    var dayMonthStartsOn: Day = .unassigned
    var numberOfDaysInMonth = 0
    var activeDays: [Int] = []
    
    var day1 = CalendarDayData()
    var day2 = CalendarDayData()
    var day3 = CalendarDayData()
    var day4 = CalendarDayData()
    var day5 = CalendarDayData()
    var day6 = CalendarDayData()
    var day7 = CalendarDayData()
    var day8 = CalendarDayData()
    var day9 = CalendarDayData()
    var day10 = CalendarDayData()
    var day11 = CalendarDayData()
    var day12 = CalendarDayData()
    var day13 = CalendarDayData()
    var day14 = CalendarDayData()
    var day15 = CalendarDayData()
    var day16 = CalendarDayData()
    var day17 = CalendarDayData()
    var day18 = CalendarDayData()
    var day19 = CalendarDayData()
    var day20 = CalendarDayData()
    var day21 = CalendarDayData()
    var day22 = CalendarDayData()
    var day23 = CalendarDayData()
    var day24 = CalendarDayData()
    var day25 = CalendarDayData()
    var day26 = CalendarDayData()
    var day27 = CalendarDayData()
    var day28 = CalendarDayData()
    var day29 = CalendarDayData()
    var day30 = CalendarDayData()
    var day31 = CalendarDayData()
    
    func getArrayOfDays() -> [CalendarDayData] {
        return [day1, day2, day3, day4, day5,day6, day7, day8, day9, day10, day11, day12, day13, day14, day15, day16, day17, day18, day19, day20, day21, day22, day23, day24, day25, day26, day27, day28, day29, day30, day31]
    }
    
//    func assignDayNumbers(numOfDaysInMonth: Int) {
//        let days = getArrayOfDays()
//        var count = 0
//        for x in 1...numOfDaysInMonth {
//            days.
//        }
//
//    }
    
}

class CalendarDayData {
    var dayNumber: Int? = nil
    var activeCircle: Bool = false
    
}

enum Month {
    case jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec
    case unassigned
}
enum Day: Int {
    case sun =  1, mon = 2, tue = 3, wed = 4, thu = 5,fri = 6, sat = 7
    case unassigned = 47
    
    
}

func getDayStringFrom(day: Day) -> String {
    switch day{
    case .sun:
        return "Sunday"
    case .mon:
        return "Monday"
    case .tue:
        return "Tuesday"
    case .wed:
        return "Wednesday"
    case .thu:
        return "Thursday"
    case .fri:
        return "Friday"
    case .sat:
        return "Saturday"
    default:
        return "Error"
    }
}
