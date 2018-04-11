//
//  DayOfWeekSelectionWidgetExtension.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-12.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
import UIKit
extension ChildChatViewController {
    
    func addTapsToDayOfWeekSelectionWidget(buttons: [UIView]) {
        for button in buttons {
            addTapTo(circleView: button)
        }
    }
    
    private func addTapTo(circleView: UIView) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedDay(sender:)))
        circleView.addGestureRecognizer(tap)
    }
    @objc func tappedDay(sender: UITapGestureRecognizer) {
//        print("Tapped")
        if let cell =  sender.view?.superview?.superview?.superview?.superview as? WeekSelectionTableViewCell {
            //let indexPath = tableView.indexPath(for: cell)
            cell.tappedButton(number: (sender.view?.tag)! - 1000)
            chatManager.dailyNotificationDays = cell.getActiveDays()
//            print(chatManager.dailyNotificationDays)
            
        }
        
    }
}
