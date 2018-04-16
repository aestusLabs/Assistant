//
//  CompactInformationTableViewCell.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-15.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class CompactInformationTableViewCell: UITableViewCell {

    @IBOutlet weak var cardBackground: UIView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var subLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        makeCardFrom(view: cardBackground)
        setColours()
    }
    func setColours() {
        cardBackground.backgroundColor = getColourFor.appColour()
        mainLabel.textColor = UIColor.white // getColourFor.label()
        subLabel.textColor = UIColor.white // getColourFor.label()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
