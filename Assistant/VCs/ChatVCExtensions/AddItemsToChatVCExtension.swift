//
//  AddItemsToChatVCExtension.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-01-20.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

extension ChildChatViewController {
    
    func addSegmentsToTableView(segments: [[Item]]) {
        addSegmentsPreparation(segments: segments)
        makeSureAddItemsTimerIsntRunning()
        turnOnAddItemsTimer()
    }
    
        func addSegmentsPreparation(segments: [[Item]]) {
            chatBarTextField.resignFirstResponder()
            segmentsArray = segments
            delaysArray = calculateDelayTimesFor(segments: segmentsArray)
        }
        func makeSureAddItemsTimerIsntRunning() {
            if addItemsTimer.isValid  {
                addItemsTimer.invalidate()
            }
        }
    
        func turnOnAddItemsTimer() {
            guard let firstDelay = self.delaysArray.first else {
                return
            }
//            self.animateProgressBar(firstDelay: firstDelay)

            addItemsTimer = .scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (view) in
//                self.messageProgressBar.setProgress(0.0, animated: false)// = 0.0 //7777777

                self.seeIfShowHurryUpButton()
                guard let firstDelay = self.delaysArray.first else {
                    return
                }
                guard let firstSegment = self.segmentsArray.first else {
                    return
                }
//                self.chatBarTextField.isEnabled = false // this is to stop a crash from an early tap.
    
                self.checkIfInsertItems(timerCount: self.timerCount, segment: firstSegment, firstDelay: firstDelay)
                self.timerCount += 1
            })
        }
    
        func seeIfShowHurryUpButton() {
            if  self.delaysArray.first! <= 1 {
                //self.hurryUpButton.isHidden = true
                self.hurryUpWidth.constant = 0

                UIView.animate(withDuration: 0.5, animations: {
                    self.view.layoutIfNeeded()
                })
            } else {
                if self.delaysArray.first! >= 5 && self.timerCount <= self.delaysArray.first! - 2 {
//                    self.hurryUpButton.alpha = 1.0
//                    self.hurryUpButton.isHidden = false
                    self.hurryUpWidth.constant = 95
                    self.hurryUpButton.backgroundColor = getColourFor.appColour()
                    print(self.hurryUpButton.titleLabel)
                    self.hurryUpButton.isHidden = false
                    
                    self.hurryUpButton.alpha = 1.0
                    UIView.animate(withDuration: 0.5, animations: {
                        self.view.layoutIfNeeded()

                    })
                }
            }
            if self.timerCount == self.delaysArray.first! - 1  {// or delay time < 2 secibds
                self.hurryUpWidth.constant = 0

                UIView.animate(withDuration: 0.5, animations: {
                    self.view.layoutIfNeeded()

//                    self.hurryUpButton.alpha = 0.0
                }, completion: { (true) in
//                    self.hurryUpButton.isHidden = true
                    
                })
            }
        }
    
        func animateProgressBar(firstDelay: Int) {
//            print(firstDelay)
            
            var animationTime = firstDelay // ********
            if animationTime < 1 {
                animationTime = 1
            }
            UIView.animate(withDuration: TimeInterval(animationTime)) {
                
            }
//            self.messageProgressBar.setProgress(0.0, animated: false)// = 0.0

            UIView.animate(withDuration: TimeInterval(animationTime), animations: {
                self.messageProgressBar.setProgress(1.0, animated: true)// = 1.0

            }) { (true) in
               
//                self.messageProgressBar.setProgress(0.0, animated: false)// = 0.0
            }
            _ = Timer.scheduledTimer(withTimeInterval: TimeInterval(animationTime) - 0.1, repeats: false, block: { (view) in

                self.messageProgressBar.setProgress(0.0, animated: false)// = 0.0

            })
        }
    
        func checkIfInsertItems(timerCount: Int, segment: [Item], firstDelay: Int) {
            if self.timerCount == firstDelay || firstDelay == 0 {

                self.timerCount = 0
                self.removeFirstItemFromDelaysArray()
                
//                self.messageProgressBar.setProgress(0.0, animated: false)// = 0.0

                self.insertItems(items: segment)

                self.segmentsArray.removeFirst()
                if self.segmentsArray.isEmpty {
                    self.addItemsTimer.invalidate()
                    self.messageProgressBar.setProgress(0.0, animated: false)// = 0.0

                }
                
                
            }
        }
        func insertItems(items: [Item]) {
            
            let paths = calculateIndexPaths()
            
//            print(items)
            
            
            
            for path in paths {
//                print(path)
            }
            
            
            for item in items {
                itemsShown.append(item)
            }
            tableView.beginUpdates()
            tableView.insertRows(at: paths, with: .none)
            tableView.endUpdates()
            
            
                self.scrollDownTableView()
            
            
            guard let firstDelay = self.delaysArray.first else {
                return
            }
            
            if items.last?.type == .assistantMessage || segmentsArray.isEmpty == false{
                self.animateProgressBar(firstDelay: firstDelay)
            }

        }
            func scrollDownTableView() {
                if self.itemsShown.count > 0 {
                    tableView.scrollToRow(at: IndexPath(item: self.itemsShown.count-1, section: 0), at: .bottom, animated: true)
                }
            }
    
    
    
    
    
    
    
    
    func addUserMessageToTableView(input: String) {
        let userMessage =  createUserMessageItem(text: input)
        itemsShown.append(userMessage)
//        let pendingItem = createPendingItem()
//        itemsShown.append(pendingItem)
        
//        print(itemsShown.count)
//        print(tableView.numberOfRows(inSection: 0))
        var itemsShownCount = self.itemsShown.count

      
        var paths: [IndexPath] = []
        

        
        let path1 =  IndexPath(row: self.itemsShown.count - 2, section: 0)
        let path2 = IndexPath(row: self.itemsShown.count - 1 , section: 0)
        
//        print(itemsShown.count)
        
        self.tableView.beginUpdates()
        //            if paths.count >= 1 {
        //                        paths.removeFirst()
        //                        }
        self.tableView.insertRows(at: [path1, path2] , with: UITableViewRowAnimation.none)
        self.tableView.endUpdates()
        if self.currentPrompt.promptType != .settings {
            self.scrollDownTableView()
        }
    }
    
    func hurryUpAddNext(segment: [Item]) {
        insertItemsIntoView(items: segment)
        segmentsArray.removeFirst()
        timerCount = delaysArray.first!
//        print(timerCount)
//        print(delaysArray)
        delaysArray.removeFirst()
        messageProgressBar.setProgress(0.0, animated: false)
        if segmentsArray.isEmpty {
//            stopAndRemovePendingItem()
            stopAddItemsTimer()

            timerCount = 0
            UIView.animate(withDuration: 0.5, animations: {
                self.hurryUpButton.alpha = 0.0
            }, completion: { (true) in
                self.hurryUpButton.isHidden = true
                
            })
        }
    }
    func insertItemsIntoView(items: [Item]) {
      
        let itemsShownCount = self.itemsShown.count
        var paths: [IndexPath] = []
        for x in 1...items.count {
            if itemsShownCount == 0 {
                let path =  IndexPath(row: 0 + x - 1, section: 0)
                paths.append(path)
            } else {
                let path =  IndexPath(row: self.itemsShown.count - 1 + x, section: 0)
                paths.append(path)
            }
        }
        self.getIndexOfButtons()
        
        for item in items {
            itemsShown.append(item)
        }
        
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: paths , with: UITableViewRowAnimation.none)
        self.tableView.endUpdates()
        if self.currentPrompt.promptType != .settings  {
            
//            if tableView.contentOffset.y <= (tableView.contentSize.height - tableView.frame.size.height)  {
                self.scrollDownTableView()

//            }
        }
    }
    
        func getIndexOfButtons() {
            currentButtons = []
            var count = 0
            for item in itemsShown {
                if item.type == .inViewButton {
                    let indexPath = IndexPath(item: count, section: 0)
                    currentButtons.append(indexPath)
                }
                count += 1
            }
        }
    

    func addItemsToTableView(segments: [[Item]]) {
        var rowsOfTheTopItemOfSegments:[Int] = []
        
        for segment in segments {
            insertItemsIntoView(items: segment)
            rowsOfTheTopItemOfSegments.append(itemsShown.count - 1)
        }
    }
    
  
    
    // ---
    
    private func removeFirstItemFromDelaysArray() {
        self.delaysArray.removeFirst()
    }
    
    func stopAddItemsTimer() {
        self.chatBarTextField.isEnabled = true
        self.addItemsTimer.invalidate()
    }
    
  
    
 
    func calculateIndexPaths()-> [IndexPath] {
        let itemsShownCount = self.itemsShown.count
        var paths: [IndexPath] = []
        if let firstSegmentCount = self.segmentsArray.first?.count {
            for x in 1...firstSegmentCount {
                //                                print(itemsShownCount)
                //                                print(x)
                
                //                                make sure I am only inserting the new items
                if itemsShownCount == 0 {
                    let path =  IndexPath(row: 0 + x - 1, section: 0)
                    paths.append(path)
                } else {
//                    print(self.itemsShown.count)
                    
                    let path =  IndexPath(row: self.itemsShown.count - 1 + x, section: 0)
                    paths.append(path)
                }
            }
//            print(paths)
            }
        
        return paths
    }
    
    
    
    
    
   private func calculateDelayTimesFor(segments: [[Item]]) -> [Int] {
        let doubleDelayArray = calculateDelayForEachSegment(segments: segments)
        let intDelayArray = convertDoubleDelayArrayIntoIntArray(doubleDelayArray: doubleDelayArray)
    return intDelayArray
    
    }
    
  
    
   
    
  
    
    
    
    
    
    
   
    
    
    
    
    
    
    
    
  
    
    
    private func calculateDelayForEachSegment(segments: [[Item]]) -> [Double] {
        var delay = [0.0]
//        var previousDelay = 0.0
        
        for segment in segments {
            for item in segment {
                if item.type == .assistantMessage {
                    let message = item as! AssistantMessage
                    let numOfWords = calculateNumberOfWordsIn(string: message.text)
                    var delayTime = calculateDelayBetweenText(numberOfWordsOfCurrent: numOfWords)
                    if delayTime < 2 {
                        delayTime = 2

                    }
                    delay.append(delayTime) // + previousDelay)
//                    previousDelay += delayTime
                }
            }
        }
        return delay
        
    }
    
    
    // MARK: Delay Calculating Sub-Functions
    private func convertDoubleDelayArrayIntoIntArray(doubleDelayArray: [Double]) -> [Int]{
        var delays: [Int] = []
        for delay in doubleDelayArray {
            delays.append(Int(delay))
        }
        return delays
    }
    
    private func calculateNumberOfWordsIn(string: String) -> Int {
        let components = string.components(separatedBy: " ")
        return components.count
    }
    private func calculateDelayBetweenText(numberOfWordsOfCurrent: Int) -> Double {
        
        let doubleNum = Double(numberOfWordsOfCurrent)
        let speed = user.readingSpeed
        switch speed {
        case .superSlow:
            return doubleNum / 175.0 * 60
        case .slow:
            return doubleNum / 225.0 * 60
        case .average:
            return doubleNum / 275.0 * 60
        case .fast:
            return doubleNum / 325.0 * 60
        case .superFast:
            return doubleNum / 375.0 * 60
        default:
            print("Error calculating delay time")
        }
        return doubleNum / 1 * 60
    }
    
    
    
}
