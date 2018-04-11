//
//  ShowCommandsTableViewCell.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-04-09.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class ShowCommandsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cellButton: UIButton!
    
    @IBOutlet weak var bodyLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var cardBackground: UIView!
    
    var isExpanded = false
    var bodyItems: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpButton()
        setColours()
//        isExpanded = true
        if isExpanded {
            
            bodyLabel.text = convertBodyItemsToString()
        }
        
    }
    
    func setUpButton() {
        cellButton.setTitle("Show All", for: .normal)
        cellButton.layer.cornerRadius = 15
        cellButton.backgroundColor = getColourFor.appColour()
        cardBackground.layer.cornerRadius = 16
        
        //        background.layer.shadowColor = getColourFor.shadow() //UIColor.lightGray.cgColor
        cardBackground.layer.shadowOpacity = 0.25
        cardBackground.layer.shadowOffset = CGSize(width: 0, height: 4)
        cardBackground.layer.shadowRadius = 4
        
    }
    func setColours() {
        cardBackground.backgroundColor = getColourFor.cardBackground()
        titleLabel.textColor = getColourFor.label()
        bodyLabel.textColor = getColourFor.label()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func buttonTapped(_ sender: Any) {
        if isExpanded == false {
            cellButton.setTitle("Hide All", for: .normal)
//            bodyLabel.text = convertBodyItemsToString()

            isExpanded = true
        } else {
            cellButton.setTitle("Show All", for: .normal)
//            bodyLabel.text = bodyItems.first!
            isExpanded = false
        }
    }
    func convertBodyItemsToString() -> String{
        var labelText = ""
        for item in bodyItems {
            labelText += item
            labelText += "\n"
            labelText += "\n"

        }

        if labelText != "" {
        for _ in 1...2 {
            labelText.removeLast()
        }
        }
//        bodyLabel.text = labelText
        return labelText
    }
    
}
