//
//  ChildChatVCChatBarExtension.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-17.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
import UIKit
extension ChildChatViewController {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if unintelligableInput {
            var messages: [Item] = []
            let userMessage = createUserMessageItem(text: textField.text!)
            var message = createAssistantMessageItem(text: "I'm sorry, I couldn't understand what you typed. I apologize for my ignorance but I'm still learning. If I can understand what you are saying I'll create suggestion buttons for you.")
            let noPossibleTypeAbleAnswer = createAssistantMessageItem(text: "This item doesn't support typable answers, sorry. If you were trying to do something else:")
            if currentPrompt.userInputUnrecognizedString != "" {
                message = createAssistantMessageItem(text: currentPrompt.userInputUnrecognizedString) 
            }
            messages.append(message)
            if currentPrompt.userInputUnrecognizedString == "" {
                messages.append(noPossibleTypeAbleAnswer)
            }
            if currentPrompt.userInputUnrecognizedString != "" {
                let understandMessage = createAssistantMessageItem(text: currentPrompt.userInputUnrecognizedString)
                messages.append(understandMessage)
            }
            
//            let goBackButton = ButtonData(title: "Go Back", action: .continueWhatYouWereDoing, global: false, premium: false)
            let seeGlobalButtons = ButtonData(title: "See What I Can Do", action: .showAllGlobalCommands, global: false, premium: false)
            let continueButton = ButtonData(title: "Go Back", action: .continueWhatYouWereDoing, global: false, premium: false)
            chatManager.pendingQueue.insert(currentPrompt.promptType, at: 0)
            let buttonCloud = createButtonCloud(buttons: [seeGlobalButtons, continueButton], promptType: .test)
            messages.append(buttonCloud)
//            chatManager.pendingQueue.insert(currentPrompt.promptType, at: 0)
//            _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { (view) in
//                self.changeto()
//
//            })
//            addUserMessageToTableView(input: textField.text!)
            addItemsToTableView(segments: [[userMessage], messages])
            chatBarTextField.text = ""
        } else {
            let buttons = itemsShown.last as! ButtonCloudData
            if buttons.userInputButtonSuggestions.count == 1 {
                let cell = tableView(tableView, cellForRowAt: IndexPath(row: itemsShown.count - 1 , section: 0)) as! ButtonCloudTableViewCell
//
//
//                let buttonCloudCell = cell as! ButtonCloudTableViewCell
//               let view =  buttonCloudCell.viewWithTag(buttons.buttons.count)
//                let button = view as! UIButton
//                tappedButton(sender: button)
                
                let item = itemsShown.last
                let buttonData = item as! ButtonCloudData
                
                if buttonData.transformationToUserMessage == true { // stops buttons on prompts like Settings from turning into usermessages
                    cell.displayInUserMessageMode(animate: true)
                    cell.userMessageBackground.isHidden = false
                    buttonData.collapsed = true
              
                }
                let returnButton = buttons.userInputButtonSuggestions[0]
                triageAction(action: returnButton.action, userInput: returnButton.title)
                chatBarTextField.text = ""
                chatBarTextField.resignFirstResponder()
                changeto(showKeyboard: false)
            } 
        }
        
        return true
    }
    
@objc func textFieldDidChange() {
    unintelligableInput = false
    if let lastItem = itemsShown.last {
    if lastItem.type != .buttonCloud { // This adds a button cloud to the view if there isn't one
        if let userInput = chatBarTextField.text {
            if chatBarTextField.text != "" {
                
             
                let buttonCloud = createButtonCloud(buttons: [], promptType: .test)
//                print(buttonCloud.buttons)
                
                addItemsToTableView(segments: [[buttonCloud]])
            }
        }
    }
    
    if let buttons = itemsShown.last {
       
        if buttons.type == .buttonCloud {
            let buttonData = buttons as! ButtonCloudData
            //                buttonData.userInputButtonSuggestions = []
            //                buttonData.animateShowing = false
            resetUserInputButtons(buttonData: buttonData)
            
            if let userInput = chatBarTextField.text {
                let parsed = parseUserInput.parse(userInput: userInput, dictionaryOfPreviouslyParesed: [:], currentPrompt: currentPrompt)
                
                if parsed.isEmpty {
                    unintelligableInput = true
                }
                
                for button in parsed {
                    if button.action == .useCurrentPromptAction {
                        //                            button.action = currentPrompt.action
                        
                        buttonData.userInputButtonSuggestions.append(ButtonData(title: button.title, action: currentPrompt.action, global: button.premium, premium: button.premium))
                    } else {
                        
                        buttonData.userInputButtonSuggestions.append(button)
                    }
                    
                }
//                autoCompletionPossibilities = []
//                for button in buttonData.userInputButtonSuggestions {
//                    autoCompletionPossibilities.append(button.title)
//                }
//                print(autoCompletionPossibilities)
                
          
                        
                        let indexPath = IndexPath(item: itemsShown.count - 1, section: 0)
                        
                        
                        tableView.reloadRows(at: [indexPath], with: .none)
                        
                        scrollDownTableView()
                    
            }
        } else {

            
            
         
            
            
            
        }
//        if chatBarTextField.text == "" {
//
//            itemsShown.removeLast()
//            let indexPath = IndexPath(row: itemsShown.count - 1, section: 0)
//            tableView.deleteRows(at: [indexPath], with: .none)
//            tableView.beginUpdates()
//            tableView.endUpdates()
//
//        }
    }
    /*
     if chatBarTextField.text != "" {
     //            chatBar.sendButton.backgroundColor = appInfo.appColour
     //            chatBar.sendButton.isEnabled = true
     
     } else {
     //            chatBar.sendButton.backgroundColor = .lightGray
     //            chatBar.sendButton.isEnabled = false
     //            addButtons(buttonNames: chatManager.promptHistory[chatManager.currentPrompt].buttons, globalCommand: false, actions: nil)
     }
     
     if let userInput = chatBarTextField.text {
     
     
     
     let parsed = parseUserInput.parse(userInput: userInput, dictionaryOfPreviouslyParesed: [:], currentPrompt: currentPrompt)
     print("******")
     print(parsed.0)
     
     if parsed.1.contains(.none) == false {
     //        var arrayOfWords: [String] = []
     //        for word in parsed.0.components(separatedBy: " ") {
     //            arrayOfWords.append(word.capitalized())
     //        }
     //            let uppercased = parsed.0.capitalized
     var bool = false
     if parsed.1.contains(.useCurrentPromptAction) == false {
     bool = true
     }
     print(parsed.0)
     print(bool)
     
     // OLD       addButtons(buttonNames: parsed.0, globalCommand: bool, actions: parsed.1)
     if let buttons = itemsShown.last {
     if buttons.type == .buttonCloud {
     let buttonData = buttons as! ButtonCloudData
     
     if let firstButtonReturned = parsed.0.first {
     if let firstActionReturned = parsed.1.first  {
     
     
     
     
     buttonData.userInputButtonSuggestions.append((title: firstButtonReturned, action: currentPrompt.action))
     let indexPath = IndexPath(item: itemsShown.count - 1, section: 0)
     tableView.reloadRows(at: [indexPath], with: .none)
     }
     
     }
     
     }
     }
     
     }
     
     
     }
     
     */
    }
    
    
    
    
}


@objc func keyboardWillShow(notification: Notification) {
//    print("Showed")
    
    
    
    
    if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
        let duration: TimeInterval = (notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        
        
        chatBarBottomConstraint.constant = keyboardSize.height + 6
        tableViewBottomConstraint.constant = keyboardSize.height + 50
        
//        hurryUpButtonBottomConstraint.constant = keyboardSize.height + 68
        UIView.animate(withDuration: duration, animations: {
            self.view.layoutIfNeeded()
        })
        
//        scrollDownTableView()
        tableView.scrollToRow(at: IndexPath(item: self.itemsShown.count-1, section: 0), at: .bottom, animated: false)
//        tableView.contentInset = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0)

    }
}
@objc func keyboardWillHide(notification: Notification) {
//    print("Hidden")
    let duration: TimeInterval = (notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
//    print(duration)
    
    chatBarBottomConstraint.constant =  6
    tableViewBottomConstraint.constant = 50
//    hurryUpButtonBottomConstraint.constant = 68
//    tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)

    UIView.animate(withDuration: duration, animations: {
        self.view.layoutIfNeeded()
    })
    
}
    
    // MARK: Autocomplete
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { //1
//        var subString = (textField.text!.capitalized as NSString).replacingCharacters(in: range, with: string) // 2
//        subString = formatSubstring(subString: subString)
//        
//        if subString.count == 0 { // 3 when a user clears the textField
//            resetValues()
//        } else {
//            searchAutocompleteEntriesWIthSubstring(substring: subString) //4
//        }
//        return true
//    }
//    func formatSubstring(subString: String) -> String {
//        let formatted = String(subString.dropLast(autoCompleteCharacterCount)).lowercased().capitalized //5
//        return formatted
//    }
//    
//    
//    
//    func resetValues() {
//        autoCompleteCharacterCount = 0
//        chatBarTextField.text = ""
//    }
//    
//    func searchAutocompleteEntriesWIthSubstring(substring: String) {
//        let userQuery = substring
//        let suggestions = getAutocompleteSuggestions(userText: substring) //1
//        
//        if suggestions.count > 0 {
//            autoCompleteTimer = .scheduledTimer(withTimeInterval: 0.01, repeats: false, block: { (timer) in //2
//                let autocompleteResult = self.formatAutocompleteResult(substring: substring, possibleMatches: suggestions) // 3
//                self.putColourFormattedTextInTextField(autocompleteResult: autocompleteResult, userQuery : userQuery) //4
//                self.moveCaretToEndOfUserQueryPosition(userQuery: userQuery) //5
//            })
//        } else {
//            autoCompleteTimer = .scheduledTimer(withTimeInterval: 0.01, repeats: false, block: { (timer) in //7
//                self.chatBarTextField.text = substring
//            })
//            autoCompleteCharacterCount = 0
//        }
//    }
//    
//    func getAutocompleteSuggestions(userText: String) -> [String]{
//        var possibleMatches: [String] = []
//        for item in autoCompletionPossibilities { //2
//            let myString:NSString! = item as NSString
//            let substringRange :NSRange! = myString.range(of: userText)
//            
//            if (substringRange.location == 0)
//            {
//                possibleMatches.append(item)
//            }
//        }
//        return possibleMatches
//    }
//    
//    func putColourFormattedTextInTextField(autocompleteResult: String, userQuery : String) {
//        let colouredString: NSMutableAttributedString = NSMutableAttributedString(string: userQuery + autocompleteResult)
//        colouredString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.green, range: NSRange(location: userQuery.count,length:autocompleteResult.count))
//        self.chatBarTextField.attributedText = colouredString
//    }
//    func moveCaretToEndOfUserQueryPosition(userQuery : String) {
//        if let newPosition = self.chatBarTextField.position(from: self.chatBarTextField.beginningOfDocument, offset: userQuery.count) {
//            self.chatBarTextField.selectedTextRange = self.chatBarTextField.textRange(from: newPosition, to: newPosition)
//        }
//        let selectedRange: UITextRange? = chatBarTextField.selectedTextRange
//        chatBarTextField.offset(from: chatBarTextField.beginningOfDocument, to: (selectedRange?.start)!)
//    }
//    func formatAutocompleteResult(substring: String, possibleMatches: [String]) -> String {
//        var autoCompleteResult = possibleMatches[0]
//        autoCompleteResult.removeSubrange(autoCompleteResult.startIndex..<autoCompleteResult.index(autoCompleteResult.startIndex, offsetBy: substring.count))
//        autoCompleteCharacterCount = autoCompleteResult.count
//        return autoCompleteResult
//    }
//    
    
    
}
