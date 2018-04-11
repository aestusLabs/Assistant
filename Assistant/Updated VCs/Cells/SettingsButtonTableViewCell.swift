//
//  SettingsButtonTableViewCell.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-03-08.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class SettingsButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var buttonLabel: UILabel!
    @IBOutlet weak var buttonImage: UIImageView!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var behindIconView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setColours()
        background.layer.cornerRadius = 8
        
        
        //        background.layer.shadowColor =  getColourFor.shadow()//UIColor.lightGray.cgColor
//        background.layer.shadowOpacity = 0.25
//        background.layer.shadowOffset = CGSize(width: 0, height: 2)
//        background.layer.shadowRadius = 8
        
       behindIconView.layer.cornerRadius = 15
        
    }
    
    func setColours() {
        background.layer.shadowColor = getColourFor.shadow()
        background.backgroundColor = getColourFor.cardBackground()
        buttonLabel.textColor = getColourFor.label()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
