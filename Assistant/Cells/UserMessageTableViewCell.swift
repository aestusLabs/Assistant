//
//  UserMessageTableViewCell.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-01-11.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class UserMessageTableViewCell: UITableViewCell {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var circle: UIView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        background.layer.cornerRadius = 16
        background.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        background.backgroundColor = getColourFor.appColour()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .white
        
        circle.layer.cornerRadius = 12.5
        circle.backgroundColor = .white
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
