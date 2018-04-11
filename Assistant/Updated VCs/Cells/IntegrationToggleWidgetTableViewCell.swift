//
//  IntegrationToggleWidgetTableViewCell.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-26.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class IntegrationToggleWidgetTableViewCell: UITableViewCell {

    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var widgetImage: UIImageView!
    @IBOutlet weak var widgetLabel: UILabel!
    @IBOutlet weak var widgetSwitch: UISwitch!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setColours()
        background.layer.cornerRadius = 16
        
         // UIColor.lightGray.cgColor
        background.layer.shadowOpacity = 0.25
        background.layer.shadowOffset = CGSize(width: 0, height: 9)
        background.layer.shadowRadius = 8
        
        widgetLabel.adjustsFontSizeToFitWidth = true
        widgetSwitch.addTarget(self, action: #selector(toggledIntegrationWidget(sender:)), for: .valueChanged)

    }
    func setColours() {
        background.layer.shadowColor = getColourFor.shadow()
        background.backgroundColor = getColourFor.cardBackground()
        widgetLabel.textColor = getColourFor.label()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
        @objc func toggledIntegrationWidget(sender: UISwitch) {
            HealthKitSetupAssistant.authorizeHealthKit { (authorized, error) in
    
                guard authorized else {
    
                    self.widgetSwitch.setOn(false, animated: true)
                    let baseMessage = "HealthKit Authorization Failed"
    
                    if let error = error {
                        print("\(baseMessage). Reason: \(error.localizedDescription)")
                    } else {
                        print(baseMessage)
                    }
    
                    return
                }
                user.healthIntegration = true
                user.saveToDefaults()
                print("HealthKit Successfully Authorized.")
            }
    
        }
}
