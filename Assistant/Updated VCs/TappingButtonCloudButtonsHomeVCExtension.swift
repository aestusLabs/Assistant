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
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "switchToChatVC"), object: nil)
            
            if cell.buttons[sender.tag].action != .goToSettings && cell.buttons[sender.tag].action != .showAllGlobalCommands && cell.buttons[sender.tag].action != .goToHistory {
                transitionToChat()
            } else if cell.buttons[sender.tag].action == .showAllGlobalCommands {
                let commandsVC = storyboard!.instantiateViewController(withIdentifier: "CommandsVC") as! CommandsViewController
                present(commandsVC, animated: true, completion: nil)
            } else if cell.buttons[sender.tag].action == .goToHistory {
                let historyVC = storyboard!.instantiateViewController(withIdentifier: "HistoryVC") as! HistoryViewController
                present(historyVC, animated: true, completion: nil)
            } else {
                let settingsVC = storyboard!.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsViewController
                present(settingsVC, animated: true, completion: nil)
            }
            
        } //else if chatManager.currentVC == .chat {
        
//        print("Tapped in cloud button \(sender.tag)")
        }
//
//        chatBarTextField.text = ""
//
//        if let cell =  sender.superview?.superview?.superview?.superview as? ButtonCloudTableViewCell {
//
//
//            cell.displayInUserMessageMode(animate: true)
//
//
//            let indexPath = tableView.indexPath(for: cell)
//
//            cell.userMessageLabel.text = sender.titleLabel?.text
//            cell.userMessageBackground.isHidden = false
//
//            let item = itemsShown[indexPath!.row]
//            let buttonData = item as! ButtonCloudData
//            buttonData.inputText = cell.userMessageLabel.text!
//            buttonData.collapsed = true
//
//
//            tableView.beginUpdates()
//            tableView.endUpdates()
//
//
//
//
//
//
//            if cell.buttons[sender.tag].action == .selectedExercise && indexPath?.row != itemsShown.count - 1 {
//                chatManager.pendingQueue = []
//                print("Seleced Exercise")
//
//            }
//            let action = cell.buttons[sender.tag].action
//            print(sender.tag)
//
//            let allButtons = buttonData.buttons + buttonData.userInputButtonSuggestions
//
//            if allButtons[sender.tag].global {
//                chatManager.pendingQueue.insert(currentPrompt.promptType, at: 0)
//            }
//
//
//            var response = ""
//            if allButtons[sender.tag].premium && user.premium == false {
//                chatManager.pendingQueue.insert(currentPrompt.promptType, at: 0)
//                if let assistantResponse = triageAction(action: .premiumButton, userInput: (sender.titleLabel?.text!)!) {
//                    response = assistantResponse
//                }
//
//                cell.userMessageBackground.backgroundColor = getColourFor.userMessagePremium()
//            } else {
//                cell.userMessageBackground.backgroundColor = getColourFor.userMessage()
//                if let assistantResponse = triageAction(action: action, userInput: (sender.titleLabel?.text!)!) {
//                    response = assistantResponse
//                }
//            }
//
//            let responseMessage = createAssistantMessageItem(text: response)
//            var number = 1 // this is to know which row is the last shown button cloud row
//            if response != "" {
//                addItemsToTableView(segments: [[responseMessage]])
//                number = 2
//            }
//
//            if indexPath?.row == itemsShown.count - number || cell.buttons[sender.tag].action == .selectedExercise {
//                _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { (view) in
//                    self.changeto()
//
//                })
//
//            }
//        }
    }
    
}
