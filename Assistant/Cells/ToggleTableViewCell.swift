//
//  ToggleTableViewCell.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-20.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class ToggleTableViewCell: UITableViewCell {

    @IBOutlet weak var background: UIView!
    
    @IBOutlet weak var toggleImageView: UIImageView!
    
    @IBOutlet weak var toggleLabel: UILabel!
    
    @IBOutlet weak var toggleSwitch: UISwitch!
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setColours()
        background.layer.cornerRadius = 16
        
//        background.layer.shadowColor =  getColourFor.shadow()//UIColor.lightGray.cgColor
        background.layer.shadowOpacity = 0.25
        background.layer.shadowOffset = CGSize(width: 0, height: 9)
        background.layer.shadowRadius = 8
        
        toggleLabel.text = "Test: On"
        toggleImageView.image = #imageLiteral(resourceName: "Lungs")
        
    }
    
    func setColours() {
        background.layer.shadowColor = getColourFor.shadow()
        background.backgroundColor = getColourFor.cardBackground()
        toggleLabel.textColor = getColourFor.label()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
