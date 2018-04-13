//
//  HydrateDayAtGlanceTableViewCell.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-13.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class HydrateDayAtGlanceTableViewCell: UITableViewCell {

    @IBOutlet weak var intervalsLabel: UILabel!
    @IBOutlet weak var cardBackground: UIView!
    
    @IBOutlet weak var circleOne: UIView!
    @IBOutlet weak var circleTwo: UIView!
    @IBOutlet weak var circleThree: UIView!
    @IBOutlet weak var circleFour: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        makeCardFrom(view: cardBackground)
        setColours()
        roundViews()
    }

    func setColours() {
        cardBackground.backgroundColor = getColourFor.cardBackground()
        intervalsLabel.textColor = getColourFor.label()
        colourCircles()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func roundViews() {
        circleOne.layer.cornerRadius = 7.5
        circleTwo.layer.cornerRadius = 7.5
        circleThree.layer.cornerRadius = 7.5
        circleFour.layer.cornerRadius = 7.5
    }
    func colourCircles() {
        let circles = [circleOne, circleTwo,circleThree, circleFour]
        for circle in circles {
            circle?.backgroundColor = getColourFor.trackTint()
        }
            if hydrateManager.interval1Total >= hydrateManager.interval1Goal {
                circleOne.backgroundColor = getColourFor.hydrateAppColour()
                
            } else {
                if hydrateManager.currentInterval == 1 {
                    circleOne.backgroundColor =   getColourFor.trackTint()
                } else {
                circleOne.backgroundColor = getColourFor.hydrateUnderGoalColour()
                }
        }
        
            if hydrateManager.interval2Total >= hydrateManager.interval2Goal {
                circleTwo.backgroundColor = getColourFor.hydrateAppColour()
                
            } else {
                if hydrateManager.currentInterval <= 2 {
                circleTwo.backgroundColor =    getColourFor.trackTint()
                } else {
                    circleTwo.backgroundColor = getColourFor.hydrateUnderGoalColour()
                }
        }

        if hydrateManager.interval3Total >= hydrateManager.interval3Goal {
            circleThree.backgroundColor = getColourFor.hydrateAppColour()
            
        } else {
            if hydrateManager.currentInterval <= 3 {
                circleThree.backgroundColor = getColourFor.trackTint()
            } else {
                circleThree.backgroundColor = getColourFor.hydrateUnderGoalColour()
            }
        }
        if hydrateManager.interval4Total >= hydrateManager.interval4Goal {
            circleFour.backgroundColor = getColourFor.hydrateAppColour()
            
        } else {
            if hydrateManager.currentInterval <= 4 {
               circleFour.backgroundColor = getColourFor.trackTint()
            } else {
                circleFour.backgroundColor = getColourFor.hydrateUnderGoalColour()
            }
        }
        
    }
    
}
