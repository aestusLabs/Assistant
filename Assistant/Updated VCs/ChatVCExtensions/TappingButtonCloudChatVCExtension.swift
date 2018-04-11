//
//  TappingButtonCloudExtension.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-12.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
import UIKit
extension ChildChatViewController {
    
    
    
    func addTapsToButtons(shownButtons: [UIButton]) {
        
        var count = 0
        for button in shownButtons {
//            print(shownButtons.count)

//            print(button.titleLabel?.text)
            button.addTarget(self, action: #selector(tappedButton(sender:)), for: .touchUpInside)
            button.tag = count
            count += 1
        }
    }
    
    @objc func tappedButton(sender: UIButton) {
        //print("Tapped in cloud button \(sender.tag)")
        
        chatBarTextField.text = ""
        
        if let cell =  sender.superview?.superview?.superview?.superview as? ButtonCloudTableViewCell {
            let indexPath = tableView.indexPath(for: cell)
            let item = itemsShown[indexPath!.row]
            let buttonData = item as! ButtonCloudData
            let action = cell.buttons[sender.tag].action
            let allButtons = buttonData.buttons + buttonData.userInputButtonSuggestions

            
            
           
            if action == .goToHistory  {
                let historyVC = storyboard!.instantiateViewController(withIdentifier: "HistoryVC") as! HistoryViewController
                present(historyVC, animated: true, completion: nil)
            } else if action == .goToSettings {
                let settingsVC = storyboard!.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsViewController
                present(settingsVC, animated: true, completion: nil)
            } else if action == .showAllGlobalCommands {
                let commandsVC = storyboard!.instantiateViewController(withIdentifier: "CommandsVC") as! CommandsViewController
                present(commandsVC, animated: true, completion: nil)
            } else {
            
            
          
                // MARK: Change To User Message
                if buttonData.transformationToUserMessage == true { // stops buttons on prompts like Settings from turning into usermessages
                    cell.displayInUserMessageMode(animate: true)
                    cell.userMessageBackground.isHidden = false
                    buttonData.collapsed = true
                    
//                    if allButtons[sender.tag].global {
//                        cell.userMessageBackground.backgroundColor = getColourFor.globalButton()
//                    }
                }
            
           
            
         
            
            if action != .cancelAnswerChange  && action != .customAnswerEntry {
                    cell.userMessageLabel.text = sender.titleLabel?.text
                    buttonData.inputText = cell.userMessageLabel.text!
            } else {
                cell.userMessageLabel.text = buttonData.inputText
                if action == .cancelAnswerChange {
                    tableView.beginUpdates()
                    tableView.endUpdates()
                }
            }
   
//            tableView.beginUpdates()
//            tableView.endUpdates()

            // MARK: Act On Button Action
            if action == .customAnswerEntry {
                cell.userMessageLabel.text = buttonData.inputText
                chatManager.pendingQueue.insert(buttonData.promptType!, at: 0)
                changeto(showKeyboard: true)
            }


        if action != .cancelAnswerChange && action != .customAnswerEntry {

                if cell.buttons[sender.tag].action == .selectedExercise && indexPath?.row != itemsShown.count - 1 {
                    chatManager.pendingQueue = []
//                    print("Seleced Exercise")

                }
            
//                print(sender.tag)


                if allButtons[sender.tag].global {
                    chatManager.pendingQueue.insert(currentPrompt.promptType, at: 0)
                }
            
                var response = ""
                if allButtons[sender.tag].premium && user.premium == false {
                    chatManager.pendingQueue.insert(currentPrompt.promptType, at: 0)
                    if let assistantResponse = triageAction(action: .premiumButton, userInput: (sender.titleLabel?.text!)!) {
                        response = assistantResponse
                    }
                    
                    cell.userMessageBackground.backgroundColor = getColourFor.userMessagePremium()
                } else {
                    cell.userMessageBackground.backgroundColor = getColourFor.userMessage()
                    
                    if action == .goToSettings {
                        let settingsVC = storyboard!.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsViewController
                        present(settingsVC, animated: true, completion: nil)
                    } else {
                        if let assistantResponse = triageAction(action: action, userInput: (sender.titleLabel?.text!)!) {
                            response = assistantResponse
                        }
                        
                    }
                }
            
                let responseMessage = createAssistantMessageItem(text: response)
                var number = 1 // this is to know which row is the last shown button cloud row
                if response != "" {
                    addItemsToTableView(segments: [[responseMessage]])
                    number = 2
                }
//                if currentPrompt.promptType == .whatCanIHelpWith {
//                    chatManager.pendingQueue = [.whatCanIHelpWith]
//                }
            
                if indexPath?.row == itemsShown.count - number || cell.buttons[sender.tag].action == .selectedExercise || allButtons[sender.tag].global == true {
                    _ = Timer.scheduledTimer(withTimeInterval: 0.0, repeats: false, block: { (view) in
                        self.changeto(showKeyboard: false)

                    })
                    
                }
            
            }
        }
        }
    }
    
   
    
    @objc func tapUserMessage(sender: UITapGestureRecognizer) {
//        print("Tapped")
        if let cell = sender.view?.superview?.superview?.superview as? ButtonCloudTableViewCell {
            let indexPath = tableView.indexPath(for: cell)
            
            let item = itemsShown[indexPath!.row]
            let buttonData = item as! ButtonCloudData
            buttonData.collapsed = false
            let cancelButton = ButtonData(title: "Cancel", action: .cancelAnswerChange, global: true, premium: false)
            let customButton = ButtonData(title: "Type Answer", action: .customAnswerEntry, global: true, premium: false)
            
            var hasButtons = false // make sure they aren't added 2x
            for button in cell.buttons {
                if button.title == "Cancel" {
                    hasButtons = true
                }
            }
            if hasButtons == false {
                cell.buttons.append(cancelButton)
                if buttonData.typeableAnswer == true {
                cell.buttons.append(customButton)
                }
            }
//            buttonData.buttons.append(cancelButton)
            
//            let indexPath = IndexPath(item: itemsShown.count - 1, section: 0)
//            tableView.reloadRows(at: [indexPath!], with: .none)
//            scrollDownTableView()
            
            cell.userMessageBackground.isHidden = true
            cell.animateUserMessageToButtonCloud()
            tableView.beginUpdates()
            tableView.endUpdates()
            addTapsToButtons(shownButtons: cell.shownButtons)

            cell.setColours()
        }
        
    }
}
