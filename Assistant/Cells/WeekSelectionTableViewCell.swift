//
//  WeekSelectionTableViewCell.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-12.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class WeekSelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var mondayCircle: UIView!
    @IBOutlet weak var mondayLetter: UILabel!
    
    @IBOutlet weak var tuesdayCircle: UIView!
    @IBOutlet weak var tuesdayLetter: UILabel!
    
    @IBOutlet weak var wednesdayCircle: UIView!
    @IBOutlet weak var wednesdayLetter: UILabel!
    
    @IBOutlet weak var thursdayCircle: UIView!
    @IBOutlet weak var thursdayLetter: UILabel!
    
    @IBOutlet weak var fridayCircle: UIView!
    @IBOutlet weak var fridayLetter: UILabel!
    
    @IBOutlet weak var saturdayCircle: UIView!
    @IBOutlet weak var saturdayLetter: UILabel!
    
    @IBOutlet weak var sundayCircle: UIView!
    @IBOutlet weak var sundayLetter: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        background.backgroundColor = .white
        background.layer.cornerRadius = 16
        
//        background.layer.shadowColor = getColourFor.shadow() //UIColor.lightGray.cgColor
        background.layer.shadowOpacity = 0.25
        background.layer.shadowOffset = CGSize(width: 0, height: 9)
        background.layer.shadowRadius = 8
        
        let allCircles = getArrayOfCircles()
        for circle in allCircles {
            circle.layer.cornerRadius = 15
            circle.backgroundColor = getColourFor.appColour()
        }
        let allLetters = getArrayOfLetters()
        for letter in allLetters {
            letter.font = UIFont.boldSystemFont(ofSize: 17)
            letter.textColor = UIColor.white
        }
        setColours()
  
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func getBackgroundColour() -> UIColor {
        return getColourFor.cardBackground()
    }
    
    func getCircleHighlightColour() -> UIColor {
        return getColourFor.appColour()
    }
    
    func getCircleColour() -> UIColor {
        return getColourFor.grey()
    }
    
    func setColours() {
        background.layer.shadowColor = getColourFor.shadow()
        background.backgroundColor = getBackgroundColour()
        let allCircles = getArrayOfCircles()
        for circle in allCircles {
            circle.backgroundColor = getCircleHighlightColour()
        }
        let allLetters = getArrayOfLetters()
        for letter in allLetters {
            letter.textColor = getColourFor.label()
        }
    }
    
    func getArrayOfCircles() -> [UIView] {
        return [mondayCircle, tuesdayCircle, wednesdayCircle, thursdayCircle, fridayCircle, saturdayCircle, sundayCircle]
    }
    
    func getArrayOfLetters() -> [UILabel] {
        return [mondayLetter, tuesdayLetter, wednesdayLetter, thursdayLetter, fridayLetter, saturdayLetter, sundayLetter]
    }
    
    func tappedButton(number: Int) {
        let allCircles = getArrayOfCircles()
        let allLetters = getArrayOfLetters()
        
        
        if allCircles[number].backgroundColor == getCircleHighlightColour() {
            allCircles[number].backgroundColor = getCircleColour()
            allLetters[number].textColor = getColourFor.label()
            allLetters[number].font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        } else {
            allCircles[number].backgroundColor = getCircleHighlightColour()
            allLetters[number].textColor = UIColor.white
            allLetters[number].font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        }
    }
    
    func getActiveDays() -> [Day] {
        let allCircles = getArrayOfCircles()
        var days: [Day] = []
        for x in 0...6 {
            if allCircles[x].backgroundColor == getCircleHighlightColour() {
                if x == 0 {
                    days.append(.mon)
                }
                if x == 1 {
                    days.append(.tue)
                }
                if x == 2 {
                    days.append(.wed)
                }
                if x == 3 {
                    days.append(.thu)
                }
                if x == 4 {
                    days.append(.fri)
                }
                if x == 5 {
                    days.append(.sat)
                }
                if x == 6 {
                    days.append(.sun)
                }
                
            }
        }
        return days
    }
}
