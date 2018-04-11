//
//  AssistantMessageTableViewCell.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-01-10.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class AssistantMessageTableViewCell: UITableViewCell {


    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var background: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        background.layer.cornerRadius = 16
        background.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        circleView.layer.cornerRadius = 10

        setColours()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setColours() {
        background.backgroundColor = getColourFor.assistantMessageBackground()
        label.textColor = getColourFor.label()
        circleView.backgroundColor = getColourFor.appColour()
    }
}
