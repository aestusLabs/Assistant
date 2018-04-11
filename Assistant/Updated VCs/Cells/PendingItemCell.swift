//
//  PendingItemCell.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-01-11.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class PendingItemCell: UITableViewCell {

    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var circle: UIView!
    var timer = Timer()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        circle.backgroundColor = getColourFor.appColour()
        circle.layer.cornerRadius = 5
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func animate() {
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (view) in
            self.animation()
        }
        timer.fire()
        
    }
    var count = 0
    func animation() {
        
        let colour1 = UIColor(red: 0.996078431, green: 0.509803922, blue: 0.635294118, alpha: 1.0)
        let colour2 = UIColor(red: 0.996078431, green: 0.549019608, blue: 0.623529412, alpha: 1.0)
        let colour3 = UIColor(red: 0.996078431, green: 0.584313725, blue: 0.615686275, alpha: 1.0)
        let colour4 = UIColor(red: 0.996078431, green: 0.623529412, blue: 0.596078431, alpha: 1.0)
        let colour5 = UIColor(red: 0.996078431, green: 0.658823529, blue: 0.584313725, alpha: 1.0)
        let colour6 = UIColor(red:  0.996078431, green: 0.698039216, blue: 0.57254902, alpha: 1.0)
        let colour7 = UIColor(red: 0.996078431, green: 0.737254902, blue: 0.560784314, alpha: 1.0)
        let colour8 = UIColor(red: 0.992156863, green: 0.77254902, blue: 0.545098039, alpha: 1.0)
        let colour9 = UIColor(red: 0.992156863, green: 0.811764706, blue: 0.533333333, alpha: 1.0)
        let colour10 = UIColor(red: 0.992156863, green: 0.847058824, blue: 0.521568627, alpha: 1.0)
        let colour11 = UIColor(red: 0.992156863, green: 0.88627451, blue: 0.505882353, alpha: 1.0)
        let colour12 = UIColor(red: 0.992156863, green: 0.921568627, blue: 0.494117647, alpha: 1.0)
        let colour13 = UIColor(red: 0.992156863, green: 0.960784314, blue: 0.482352941, alpha: 1.0)
        var colours = [colour1, colour2, colour3, colour4, colour5, colour6, colour7, colour8, colour9, colour10, colour11, colour12, colour13, colour12, colour11, colour10, colour9, colour8, colour7, colour6, colour5, colour4, colour3, colour2, colour1]
        
        func changeColour() {
//            print(count)
            if count + 1 < colours.count {
                circle.backgroundColor = colours[count]
                count += 1
            } else {
                count = 0
            }
        }
        UIView.animate(withDuration: 1.0, animations: {
            self.widthConstraint.constant = 40
            self.layoutIfNeeded()
            changeColour()
            
        }) { (true) in
            UIView.animate(withDuration: 1.0, animations: {
                self.widthConstraint.constant = 10
                self.layoutIfNeeded()
                changeColour()
            })
            
            
        }
        //        UIView.animate(withDuration: 0.5, animations: {
        ////            self.centerXConstraint.constant = self.centerXConstraint.constant - 30
        //            self.widthConstraint.constant = 40
        //            self.layoutIfNeeded()
        //        }) { (true) in
        //            UIView.animate(withDuration: 0.5, animations: {
        ////                self.centerXConstraint.constant = self.centerXConstraint.constant - 30
        //                self.widthConstraint.constant = 10
        //                self.layoutIfNeeded()
        //            }, completion: { (false) in
        //                UIView.animate(withDuration: 0.5, animations: {
        //                    self.centerXConstraint.constant = self.centerXConstraint.constant + 30
        //                    self.widthConstraint.constant = 30
        //                    self.layoutIfNeeded()
        //                }, completion: { (true) in
        //                    UIView.animate(withDuration: 0.5, animations: {
        //                        self.centerXConstraint.constant = self.centerXConstraint.constant + 30
        //                        self.widthConstraint.constant = 10
        //                        self.layoutIfNeeded()
        //                    })
        //                })
        //            })
        //        }
    }
    func stopTimer() {
        timer.invalidate()
    }
}
