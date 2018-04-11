//
//  TitleDividerTableViewCell.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-21.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class TitleDividerTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.textColor = getColourFor.label()
        titleLabel.adjustsFontSizeToFitWidth = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setTitleText(title: String) {
        titleLabel.text = title
    }
}
