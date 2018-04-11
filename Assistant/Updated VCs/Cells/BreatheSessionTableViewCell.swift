//
//  BreatheSessionTableViewCell.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-01-11.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class BreatheSessionTableViewCell: UITableViewCell {

    @IBOutlet weak var typeImage: UIImageView!
    
    @IBOutlet weak var dotsView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var background: UIView!
    
    @IBOutlet weak var inhaleOne: UIView!
    @IBOutlet weak var inhaleTwo: UIView!
    @IBOutlet weak var inhaleThree: UIView!
    @IBOutlet weak var inhaleFour: UIView!
    @IBOutlet weak var inhaleFive: UIView!
    @IBOutlet weak var inhaleSix: UIView!
    @IBOutlet weak var inhaleSeven: UIView!
    @IBOutlet weak var inhaleEight: UIView!
    
    @IBOutlet weak var exhaleOne: UIView!
    @IBOutlet weak var exhaleTwo: UIView!
    @IBOutlet weak var exhaleThree: UIView!
    @IBOutlet weak var exhaleFour: UIView!
    @IBOutlet weak var exhaleFive: UIView!
    @IBOutlet weak var exhaleSix: UIView!
    @IBOutlet weak var exhaleSeven: UIView!
    @IBOutlet weak var exhaleEight: UIView!
    
    @IBOutlet weak var fullSustainOne : UIView!
    @IBOutlet weak var fullSustainTwo : UIView!
    @IBOutlet weak var fullSustainThree : UIView!
    @IBOutlet weak var fullSustainFour : UIView!
    @IBOutlet weak var fullSustainFive : UIView!
    @IBOutlet weak var fullSustainSix : UIView!
    @IBOutlet weak var fullSustainSeven : UIView!
    @IBOutlet weak var fullSustainEight : UIView!
    
    @IBOutlet weak var emptySustainOne : UIView!
    @IBOutlet weak var emptySustainTwo : UIView!
    @IBOutlet weak var emptySustainThree : UIView!
    @IBOutlet weak var emptySustainFour : UIView!
    @IBOutlet weak var emptySustainFive : UIView!
    @IBOutlet weak var emptySustainSix : UIView!
    @IBOutlet weak var emptySustainSeven : UIView!
    @IBOutlet weak var emptySustainEight : UIView!

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateLabelHeight: NSLayoutConstraint!
    
    @IBOutlet weak var cellHeight: NSLayoutConstraint!
    
    
    
    var sessionType: SessionType = .unassigned
    var inhale = 0
    var exhale = 0
    var fullSustain = 0
    var emptySustain = 0
    var totalLengthInSeconds = 0
    var totalCycles = 0
    var cycleBreakLengthInS = 0
    var numberOfBreathsPerCycle = 0
    
    
    var secondsElapsed = 0
    var startOfLastBreath = 0
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        background.backgroundColor = .white
        background.layer.cornerRadius = 13
        
//        background.layer.shadowColor = getColourFor.shadow() //UIColor.lightGray.cgColor
        background.layer.shadowOpacity = 0.25
        background.layer.shadowOffset = CGSize(width: 0, height: 2)
        background.layer.shadowRadius = 2
        setColours()
//        typeLabel.adjustsFontSizeToFitWidth = true
//     roundCorners()
//        self.layoutSubviews()
    }

    
    func setColours() {
        background.layer.shadowColor = getColourFor.shadow()
       timeLabel.textColor = getColourFor.label()
        typeLabel.textColor = getColourFor.label()
        background.backgroundColor = getColourFor.cardBackground()
        dateLabel.textColor = getColourFor.label()
    }
    func getInhaleCircles() -> [UIView] {
        return [inhaleOne, inhaleTwo, inhaleThree, inhaleFour, inhaleFive, inhaleSix, inhaleSeven, inhaleEight]
    }
    func getExhaleCircles() -> [UIView] {
        return [exhaleOne, exhaleTwo, exhaleThree, exhaleFour, exhaleFive, exhaleSix, exhaleSeven, exhaleEight]
    }
    
    func getFullSustainCircles() -> [UIView] {
        return [fullSustainOne, fullSustainTwo, fullSustainThree, fullSustainFour, fullSustainFive, fullSustainSix, fullSustainSeven, fullSustainEight]
    }
    func getEmptySustainCircles() -> [UIView] {
        return [emptySustainOne, emptySustainTwo, emptySustainThree, emptySustainFour, emptySustainFive, emptySustainSix, emptySustainSeven, emptySustainEight]
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func colourDots() {
        let inhaleDots = getInhaleCircles()
        var count = 0
        for _ in 1...inhale {
            inhaleDots[count].backgroundColor = getColourFor.appColour()
            count += 1
        }
        let exhaleDots = getExhaleCircles()
        count = 0
        for _ in 1...exhale {
            exhaleDots[count].backgroundColor = getColourFor.appColour()
            count += 1
        }
        
        if fullSustain != 0 {
        let fullSustainDots = getFullSustainCircles()
        count = 0
        for _ in 1...fullSustain {
            fullSustainDots[count].backgroundColor = getColourFor.appColour()
            count += 1
        }
        }
        if emptySustain != 0 {
        let emptySustainDots = getEmptySustainCircles()
        count = 0
        for _ in 1...emptySustain {
            emptySustainDots[count].backgroundColor = getColourFor.appColour()
            count += 1
        }
        }
        
    }
    
    func populateSessionManager() {
        sessionManager.sessionType = sessionType
        sessionManager.inhale = inhale
        sessionManager.exhale = exhale
        sessionManager.fullSustain = fullSustain
        sessionManager.emptySustain = emptySustain
        sessionManager.totalLengthInSeconds = totalLengthInSeconds
        sessionManager.totalCycles = totalCycles
        sessionManager.secondsElapsed = secondsElapsed
        sessionManager.startOfLastBreath = startOfLastBreath
        sessionManager.cycleBreakLengthInS = cycleBreakLengthInS
        sessionManager.numberOfBreathsPerCycle = numberOfBreathsPerCycle
//        sessionManager.br
   
        
    }
    
    func roundCorners() {
        
        
        let cornerRadius = inhaleOne.frame.width / 2
        let inhaleCircles = getInhaleCircles()
        for circle in inhaleCircles {
            circle.layer.cornerRadius = 4//circle.frame.width / 2
            circle.clipsToBounds = true
        }
        let exhaleCircles = getExhaleCircles()
        for circle in exhaleCircles {
            circle.layer.cornerRadius = 4 //cornerRadius
        }
        let fullCircles = getFullSustainCircles()
        for circle in fullCircles {
            circle.layer.cornerRadius = 3 //cornerRadius
        }
        let emptyCircles = getEmptySustainCircles()
        for circle in emptyCircles {
            circle.layer.cornerRadius = cornerRadius
        }
    }
    
    
    
}


class Circle: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let radius: CGFloat = self.bounds.size.width / 2.0
        
        self.layer.cornerRadius = radius
    }
}
