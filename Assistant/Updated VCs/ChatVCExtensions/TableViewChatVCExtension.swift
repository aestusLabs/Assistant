//
//  ChildChatVCTableViewExtension.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-17.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
import UIKit
extension ChildChatViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsShown.count
    }
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexRowsOfPlayableSessions.contains(indexPath.row) {
            let cell = tableView.cellForRow(at: indexPath)
            if let widget = cell as? PlayableSessionTableViewCell {
                if widget.sessionTimer.isValid {
                    widget.pause()
                }
            }
        }
    }
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        
//        if tableView.contentSize.height > tableView.frame.size.height {
//            
//          return 250
//        } else {
//            return CGFloat.leastNonzeroMagnitude
//        }
//    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footer = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 44))
//
//        if tableView.contentSize.height > tableView.frame.size.height {
//            footer.backgroundColor = getColourFor.appColour()
//        } else {
//            footer.backgroundColor = .blue
//        }
//        return footer
//    }
 
   /*
    func bottomRefresh() {
        print("@@@@@@@@@@@@@@@@@@")
      
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block: { (view) in
            self.tappedHurryUpButton()

        })
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { (view) in
            self.bottomRefreshActive = false
        })
    }
 */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     /*
        if tableView.contentOffset.y >= (tableView.contentSize.height - tableView.frame.size.height)  {
            
            tableView.footerView(forSection: 0)?.backgroundColor = getColourFor.appColour()
            if tableView.contentSize.height > tableView.frame.size.height {
                showNextLabel.isHidden = false

//            itemsShown.append()
//            tableView.reloadData()
//            scrollDownTableView()
                if bottomRefreshActive == false {
                    bottomRefreshActive = true
                    bottomRefresh()
                }
            //you reached end of the table
            }
        }
        */
        
        
        
        let currentItem = itemsShown[indexPath.row]
        
        var isLastShown = false
        if indexPath.row == itemsShown.count - 1 {
                isLastShown = true
        }
        
        if let cell = getCellForItemType.getCellFor(item: currentItem) {
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            
            if currentItem.type == .buttonCloud {
                let buttonCell = cell as! ButtonCloudTableViewCell
                addTapsToButtons(shownButtons: buttonCell.shownButtons)
                let tap = UITapGestureRecognizer(target: self, action: #selector(tapUserMessage(sender:)))
                tap.numberOfTapsRequired = 2
                buttonCell.userMessageBackground.addGestureRecognizer(tap)
//                buttonCell.animateButtonsMovingUp()
            } else if currentItem.type == .passableSession {
//                let sessionWidget = cell as! BreatheSessionTableViewCell
//                let tap = UITapGestureRecognizer(target: self, action: #selector(tappedSessionWidget(sender:)))
//                sessionWidget.background.addGestureRecognizer(tap)
            } else if currentItem.type == .playableSession  {
                
                let playableSessionWidget = cell as! PlayableSessionTableViewCell
                playableSessionWidget.indexPathOfCell = indexPath.row
                if indexRowsOfPlayableSessions.contains(indexPath.row) == false {
                    indexRowsOfPlayableSessions.append(indexPath.row)
                }
            } else if currentItem.type == .dayOfWeekSelection {
                let selectDaysOfWeekWidget = cell as! WeekSelectionTableViewCell
                addTapsToDayOfWeekSelectionWidget(buttons: selectDaysOfWeekWidget.getArrayOfCircles())
                
            } else if currentItem.type == .launchKeyboard {
                if indexPath.row == itemsShown.count - 1 {
                    chatBarTextField.becomeFirstResponder()
                }
            } 
            
            return cell
        }
        
        return getCellForItemType.pendingCell()
        
    }
    @objc func toggledIntegrationWidget(sender: UISwitch) {
//        print("Toggled")
        HealthKitSetupAssistant.authorizeHealthKit { (authorized, error) in
            
            guard authorized else {
                
                let baseMessage = "HealthKit Authorization Failed"
                
                if let error = error {
//                    print("\(baseMessage). Reason: \(error.localizedDescription)")
                } else {
//                    print(baseMessage)
                }
                
                return
            }
            
            print("HealthKit Successfully Authorized.")
        }

    }
    @objc func updateTableView() {
        //                let indexPath = IndexPath(row: itemsShown.count - 1, section: 0)
        //
        //        let cell = tableView.cellForRow(at: indexPath)
        //            cell?.heightAnchor.constraint(equalToConstant: 75)
        //.layoutIfNeeded()
        //        tableView.beginUpdates()
        //        tableView.endUpdates()
        
        let item = itemsShown.last as! ButtonCloudData
        item.collapsed = true
        item.inputText = chatManager.tappedButtonText
        chatManager.tappedButtonText = ""
        let indexPath = IndexPath(row: itemsShown.count - 1, section: 0)
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}
