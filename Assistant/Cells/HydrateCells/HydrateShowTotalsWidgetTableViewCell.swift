//
//  HydrateShowTotalsWidgetTableViewCell.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-12.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class HydrateShowTotalsWidgetTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cardBackground: UIView!
    @IBOutlet weak var intervalProgressBar: UIProgressView!
    
    @IBOutlet weak var totalProgressBar: UIProgressView!
    
    @IBOutlet weak var currentIntervalTotal: UILabel!
    
    @IBOutlet weak var dayTotal: UILabel!
    
    @IBOutlet weak var currentIntervalGoal: UILabel!
    
    @IBOutlet weak var dayGoal: UILabel!
    
    @IBOutlet weak var currentInterval: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        makeCardFrom(view: cardBackground)
        makeProgressBarsLookGood()

    }
    

    
    func makeProgressBarsLookGood() {
        intervalProgressBar.progressTintColor = getColourFor.hydrateAppColour()
        intervalProgressBar.trackTintColor = getColourFor.trackTint()
        
        totalProgressBar.progressTintColor = getColourFor.hydrateAppColour()
        totalProgressBar.trackTintColor = getColourFor.trackTint()
        
        
        intervalProgressBar.layer.cornerRadius =  6
        intervalProgressBar.clipsToBounds = true
        intervalProgressBar.layer.sublayers![1].cornerRadius = 6
        intervalProgressBar.subviews[1].clipsToBounds = true
        
        totalProgressBar.layer.cornerRadius =  6
        totalProgressBar.clipsToBounds = true
        totalProgressBar.layer.sublayers![1].cornerRadius = 8
        totalProgressBar.subviews[1].clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateProgressBars() {
        
        intervalProgressBar.progress =  Float(hydrateManager.getCurrentIntervalsTotal()) / Float(hydrateManager.getCurrentIntervalsGoal())
        totalProgressBar.progress = (Float(hydrateManager.interval1Total) + Float(hydrateManager.interval2Total) + Float(hydrateManager.interval3Total) + Float(hydrateManager.interval4Total)) / Float(hydrateManager.dailyGoal)
        UIView.animate(withDuration: 1.0) {
            self.intervalProgressBar.layoutIfNeeded()
            self.totalProgressBar.layoutIfNeeded()
        }
        // TODO: Change colour if over goal
    }
    func updateLabels() {
        dayTotal.text = "\(hydrateManager.getDaysTotal())\(hydrateManager.getUnits())"
        dayGoal.text = "\(hydrateManager.dailyGoal)\(hydrateManager.getUnits())"
        currentIntervalTotal.text = "\(hydrateManager.getCurrentIntervalsTotal())\(hydrateManager.getUnits())"
        currentIntervalGoal.text = "\(hydrateManager.getCurrentIntervalsGoal())\(hydrateManager.getUnits())"
            currentInterval.text = "Interval \(hydrateManager.getCurrentInterval(dateToCheck: Date()))"
    }
    
}
func makeCardFrom(view: UIView) {
    view.layer.cornerRadius = 13
    view.layer.shadowOpacity = 0.25
    view.layer.shadowOffset = CGSize(width: 0, height: 2)
    view.layer.shadowRadius = 2
}
