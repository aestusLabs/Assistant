//
//  NumberAndCircleCollectionViewCell.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-23.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class NumberAndCircleCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var circleView: Circle!
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        circleView.backgroundColor = getColourFor.lightGrey()
        
    }

}
