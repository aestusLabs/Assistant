//
//  HydrateTotalsCompact.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-12.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class HydrateTotalsCompact: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var cardBackground: UIView!
    @IBOutlet weak var intervalLabel: UILabel!
    @IBOutlet weak var intervalProgressBar: UIProgressView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalProgressBar: UIProgressView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        Bundle.main.loadNibNamed("HydrateTotalsCompactView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    func setColours() {
        intervalLabel.textColor = getColourFor.label()
        totalLabel.textColor = getColourFor.label()
        cardBackground.backgroundColor = getColourFor.cardBackground()
    }
}
