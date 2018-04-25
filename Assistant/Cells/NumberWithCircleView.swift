//
//  NumberWithCircleView.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-20.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class NumberWithCircleView: UIView {

    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var circleView: Circle!
    
    
    class func instanceFromNib() -> NumberWithCircleView {
        return UINib(nibName: "NumberWithCircleView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! NumberWithCircleView
    }
    
    func setUpView() {
        numberLabel.adjustsFontSizeToFitWidth = true
        circleView.backgroundColor = getColourFor.lightGrey()
        
    }

}
