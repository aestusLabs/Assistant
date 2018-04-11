//
//  PlayableSessionTableViewCell.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-01-24.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class PlayableSessionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lungsSpacer: UIView!
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var lungsImageView: UIImageView!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var lungsWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var lungsTrailingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var lungsLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var lungsHeightConstraint: NSLayoutConstraint!
    
    var indexPathOfCell = 0
    
    var sessionType: SessionType = .deepBreathing
    var inhale = 0
    var fullSustain = 0
    var exhale = 0
    var emptySustain = 0
    var totalLengthInSeconds = 0
    var totalCycles = 0
    var secondsElapsed = 0
    var startOfLastBreath = 0
    var breath: [(BreathParts, Int)] = []
    var sessionTimer = Timer()
    var closedNostril = "Close Right"
    var nostrilCount = 1
    var breathPartLength = 0
    var currentPartOfBreathInstruction = ""
    var cycleBreakLengthInS = 0
    var numberOfBreathsPerCycle = 0
    var breakLength = 0
    var nextCycleStartTime = 0
    var isBreak = false

    
    func popluateFromManager() {
        sessionType = sessionManager.sessionType
        inhale = sessionManager.inhale
        fullSustain = sessionManager.fullSustain
        exhale = sessionManager.exhale
        emptySustain = sessionManager.emptySustain
        totalLengthInSeconds = sessionManager.totalLengthInSeconds
        totalCycles = sessionManager.totalCycles
        cycleBreakLengthInS = sessionManager.cycleBreakLengthInS
        numberOfBreathsPerCycle = sessionManager.numberOfBreathsPerCycle
    
        sessionManager.clearAllValues()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        background.backgroundColor = .white
        background.layer.cornerRadius = 16
        
//        background.layer.shadowColor = getColourFor.shadow() //UIColor.lightGray.cgColor
        background.layer.shadowOpacity = 0.25
        background.layer.shadowOffset = CGSize(width: 0, height: 9)
        background.layer.shadowRadius = 8
//        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 8)
        progressBar.progressTintColor = getColourFor.appColour()
        progressBar.trackTintColor =  getColourFor.vcBackground()
        progressBar.layer.cornerRadius =  8//progressBar.frame.height / 2.0//10
        progressBar.clipsToBounds = true

        progressBar.layer.sublayers![1].cornerRadius = 8 //progressBar.frame.height / 2.0
        progressBar.subviews[1].clipsToBounds = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedWidget))
        self.background.addGestureRecognizer(tap)
        
        setColours()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    
    func getBackgroundColour() -> UIColor {
        return getColourFor.cardBackground()
    }
    func setColours() {
        background.layer.shadowColor = getColourFor.shadow()
        progressBar.progressTintColor = getColourFor.progressTrack()
        progressBar.trackTintColor = getColourFor.trackTint()
        background.backgroundColor = getBackgroundColour()
        timeLabel.textColor = getColourFor.label()
        instructionLabel.textColor = getColourFor.label()
    }
    
    func start() {
       // progressBar.progress = 0.0
        print(lungsImageView.alpha)
        if lungsImageView.alpha == 1.0 {
//            shrinkLungs(initalShrink: false)
        } else if lungsImageView.alpha >= 0.2 && lungsImageView.alpha <= 0.21{
//            enlargeLungs(time: )
        }
    }
    
    func shrinkLungs(time: TimeInterval) {
        self.lungsHeightConstraint.constant = 150
        
        UIView.animate(withDuration: time) {
            self.layoutIfNeeded()
            self.lungsImageView.alpha = 0.2
            
        }
    }
    
    func enlargeLungs(time: TimeInterval) {

        self.lungsHeightConstraint.constant = lungsSpacer.frame.width - 32
        
        if background.frame.width > background.frame.height {
            
            self.lungsHeightConstraint.constant = lungsSpacer.frame.height - 8
        }
        UIView.animate(withDuration: time) {
            self.layoutIfNeeded()
//            self.progressBar.setProgress(1.0, animated: true)// = 1.0
            self.lungsImageView.alpha = 1.0
        }
    }
    
//    func fullSustain(time: TimeInterval) {
//        progressBar.progressTintColor = .black //getColour.chatVC.background()
//        progressBar.trackTintColor = getColour.app.appColour
//        self.progressBar.setProgress(0.0, animated: false)// = 1.0
//        UIView.animate(withDuration: time) {
//            self.layoutIfNeeded()
//
//            self.progressBar.setProgress(1.0, animated: true)// = 1.0
//
//        }
//    }
    
    func animateProgressBar(time: TimeInterval) {
 
        
        
        self.progressBar.layer.removeAllAnimations()
        self.progressBar.progress = 0.0
        self.progressBar.layoutIfNeeded()
        self.progressBar.layer.removeAllAnimations()

        self.progressBar.progress = 1.0
        UIView.animate(withDuration: time) {
            self.progressBar.layoutIfNeeded()

        }
 
        
//        UIView.animate(withDuration: time, animations: {
//            self.progressBar.layoutIfNeeded()
//
//        }) { (true) in
//            <#code#>
//        }
        
//        UIView.animate(withDuration: time, animations: {
//            self.progressBar.setProgress(1.0, animated: true)// = 1.0
//
//        }) { (true) in
////            self.progressBar.progress = 0.0
//        }
        
        
//        _ = Timer.scheduledTimer(withTimeInterval: time / 2, repeats: false, block: { (view) in
//            self.progressBar.setProgress(0.0, animated: false)// = 0.0
//
//        })
    }
    

}
