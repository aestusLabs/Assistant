//
//  TappingButtonCloudButtonsHomeVCExtension.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-22.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
import UIKit
extension ChildHomeViewController {
    func addTapsToButtons(shownButtons: [UIButton]) {
        
        var count = 0
        for button in shownButtons {
            button.addTarget(self, action: #selector(tappedButton(sender:)), for: .touchUpInside)
            button.tag = count
            count += 1
        }
    }
    
    @objc func tappedButton(sender: UIButton) {
                if let cell =  sender.superview?.superview?.superview?.superview as? ButtonCloudTableViewCell {
 
        cell.buttonTapped = true
        
        chatManager.pendingQueue = []
        
        chatManager.currentPromptType = cell.currentPromptType
        
        triageAction(action: cell.buttons[sender.tag].action, userInput: cell.buttons[sender.tag].title)
        
        if chatManager.currentVC == .home {

            
            let action = cell.buttons[sender.tag].action
            let input = cell.buttons[sender.tag].title

            if  hydrateActionsSeeIfNeedToUpdateVC(action: action) {
                
            } else if action != .goToSettings && action != .showAllGlobalCommands && action != .goToHistory {
                transitionToChat()
                
            } else if action == .showAllGlobalCommands {
                let commandsVC = storyboard!.instantiateViewController(withIdentifier: "CommandsVC") as! CommandsViewController
                present(commandsVC, animated: true, completion: nil)
                
            } else if action == .goToHistory {
                let historyVC = storyboard!.instantiateViewController(withIdentifier: "HistoryVC") as! HistoryViewController
                present(historyVC, animated: true, completion: nil)
                
            } else {
                let settingsVC = storyboard!.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsViewController
                present(settingsVC, animated: true, completion: nil)
            }
            
        } 
        }

    }
    
}
