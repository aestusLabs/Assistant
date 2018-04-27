//
//  SlideToAddWaterTableViewCell.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-26.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class SlideToAddWaterTableViewCell: UITableViewCell {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var background: UIView!
    
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        makeCardFrom(view: background)
        label.text = "Slide To Add"
        slider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)

        if hydrateManager.metric == false {
            slider.maximumValue = 64
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    @IBAction func sliderMoved(_ sender: UISlider) {
        print(sender.value)
        var multipleValue = 1
        if hydrateManager.metric {
            multipleValue = 5
        }
        let amount = Int(sender.value) * multipleValue
        label.text = "Add \(amount)\(hydrateManager.getUnits())"
        
    }
    @objc func onSliderValChanged(slider: UISlider, event: UIEvent) {
        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
            
            case .ended:
                var multipleValue = 1
                if hydrateManager.metric {
                    multipleValue = 5
                }
                triageAction(action: .addWater, userInput:"\(Int(slider.value) * multipleValue)")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addedWater"), object: nil)
                UIView.animate(withDuration: 0.5, animations: {
                    self.slider.value = 0.0

                })
                label.text = "Slide To Add"
            default:
                break
            }
        }
    }
    
}
