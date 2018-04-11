//
//  PointsTableViewCell.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-01-31.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class PointsTableViewCell: UITableViewCell {
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var theImageView: UIImageView!
    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var bottomLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        background.layer.cornerRadius = 10
        
        background.layer.shadowColor = getColourFor.shadow() //UIColor.lightGray.cgColor
        background.layer.shadowOpacity = 0.25
        background.layer.shadowOffset = CGSize(width: 0, height: 4)
        background.layer.shadowRadius = 4
        
        // Testing
        
        theImageView.image = #imageLiteral(resourceName: "Lungs")
        topLabel.text = "Session Completed"
        bottomLabel.text = "5 points"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
