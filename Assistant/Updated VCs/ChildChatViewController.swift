//
//  ChildChatViewController.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-01-10.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData
class ChildChatViewController: UIViewController, NewPageObservation, UITextFieldDelegate {
   
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var hurryUpButton: UIButton!
    
    @IBOutlet weak var chatBarBackground: UIView!
    @IBOutlet weak var chatBarTextField: UITextField!
    

    
    @IBOutlet weak var chatBarBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var hurryUpButtonBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var topBarLabel: UILabel!
    
    @IBOutlet weak var messageProgressBar: UIProgressView!
    
    @IBOutlet weak var hurryUpWidth: NSLayoutConstraint!
    
    var bottomRefreshActive = false
    
//    var autoCompletionPossibilities = ["Apple", "Pineapple", "Orange"]
//    var autoCompleteCharacterCount = 0
//    var autoCompleteTimer = Timer()
    
    // Page VC Stuff
    var parentPageViewController: PageViewController!
    func getParentPageViewController(parentRef: PageViewController) {
        parentPageViewController = parentRef
    }
    //
    
    // Add Items Variables
    var addItemsTimer = Timer()
    var currentButtons: [IndexPath] = [] // These are the buttons presented (this is used to delete them)
    //
    
    var itemsShown: [Item] = [] // History of all items shown (When a prompt segment is added to the view they go in this array
    var promptTypesShown: [PromptType] = []
    var currentPrompt: Prompt = createPromptFor(promptType: .whatCanIHelpWith)
    var pendingCell = PendingItemCell() // this is so I can stop the animation


    
    // These are so I can tap to show next or all
    var delaysArray: [Int] = []
    var segmentsArray: [[Item]] = []
    var timerCount = 0

    //
    
    // Playable Session Widget Variables
    var player = AVAudioPlayer()
    var indexRowsOfPlayableSessions: [Int] = []
    //
    
    // These will probably be deleted
    var spacerHeight: CGFloat = 29 // For under the Over View Buttons
    var testButtonStackView = UIStackView()

   
    
    var unintelligableInput = false
    
    var managedContext: NSManagedObjectContext!
    lazy var coreDataStack = CoreDataStack(modelName: "BreatheHistory")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.chatBarTextField.delegate = self
//        showNextLabel.isHidden = true
        managedContext = coreDataStack.managedContext

        
        
        hurryUpWidth.constant = 0
        setUpTableView()
        setUpHurryUpButton()
        setUpChatBar()
        addSegmentsToTableView(segments: currentPrompt.itemSegments)
        setColours()
//        tableView.footerView(forSection: 0)?.isHidden = true
//        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (view) in
//            print("Content Offset: \(self.tableView.contentOffset.y)")
//        })
    }
    func setColours() {
        hurryUpButton.layer.shadowColor = getColourFor.shadow()
        messageProgressBar.trackTintColor = getColourFor.vcBackground()
        messageProgressBar.progressTintColor = getColourFor.appColour()
        topBar.backgroundColor = getColourFor.topBar()
        topBarLabel.textColor = getColourFor.label()
        background.backgroundColor = getColourFor.vcBackground()
        chatBarBackground.backgroundColor = getColourFor.chatBarBackground()
        chatBarTextField.attributedPlaceholder = NSAttributedString(string: "Tap To Talk To Me",
                                                                    attributes: [NSAttributedStringKey.foregroundColor: getColourFor.chatBarPlaceholderLabel()])
        chatBarTextField.textColor = getColourFor.label()
        tableView.footerView(forSection: 0)?.backgroundColor = getColourFor.appColour()
        hurryUpButton.backgroundColor = getColourFor.appColour()
        hurryUpButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    func setUpChatBar() {
        chatBarBackground.layer.cornerRadius = 18
        chatBarTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    @objc func refreshColours() {
        
        setColours()
        tableView.reloadData()
    }
    
    func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 61
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
    }
    
    func setUpHurryUpButton() {
//        hurryUpButton.isHidden = true
        hurryUpButton.setTitle("Show Next", for: .normal)
        hurryUpButton.layer.cornerRadius = 15
//        hurryUpButton.layer.shadowColor = UIColor.lightGray.cgColor
//        hurryUpButton.layer.shadowOpacity = 0.5
//        hurryUpButton.layer.shadowOffset = CGSize(width: 0, height: 9)
//        hurryUpButton.layer.shadowRadius = 8
        hurryUpButton.addTarget(self, action: #selector(tappedHurryUpButton), for: .touchUpInside)
        let longpress = UILongPressGestureRecognizer(target: self, action: #selector(heldHurryUpButton))
        longpress.minimumPressDuration = 1.0
        hurryUpButton.addGestureRecognizer(longpress)
        hurryUpButton.backgroundColor = getColourFor.appColour()
       
        
//        hurryUpButton.addTarget(self, action: #selector(heldHurryUpButton), for: .touchDown)
        
    }
    
    
    func resetUserInputButtons(buttonData: ButtonCloudData) {
        buttonData.userInputButtonSuggestions = []
        buttonData.animateShowing = false
    }
    
   
    
    @objc func tappedHurryUpButton() {
//        print("Tapped button")
        if let segment = segmentsArray.first {
//            print(timerCount)
//            print(delaysArray.first!)
//            hurryUpButton.isHidden = true

            
//            if timerCount != delaysArray.first! && timerCount != delaysArray.first! - 1 {
            
                hurryUpAddNext(segment: segment)
//            }
        }
    }
    @objc func heldHurryUpButton() {
//        print("Held button")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        chatManager.currentVC = .chat // I probably don't need this
        NotificationCenter.default.addObserver(self, selector: #selector(finishedSession), name: NSNotification.Name(rawValue: "finishedSession"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playInhaleSound), name: NSNotification.Name(rawValue: "playInhaleSound"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playExhaleSound), name: NSNotification.Name(rawValue: "playExhaleSound"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playFullSustainSound), name: NSNotification.Name(rawValue: "playFullSustainSound"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playEmptySustainSound), name: NSNotification.Name(rawValue: "playEmptySustainSound"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(playBreakEnd), name: NSNotification.Name(rawValue: "playBreakEnd"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playBreakStart), name: NSNotification.Name(rawValue: "playBreakStart"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(playFinishedSound), name: NSNotification.Name(rawValue: "playFinishedSound"), object: nil)
  NotificationCenter.default.addObserver(self, selector: #selector(stopPlayer), name: NSNotification.Name(rawValue: "stopPlayer"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(sessionStopped), name: NSNotification.Name(rawValue: "sessionStopped"), object: nil)

         NotificationCenter.default.addObserver(self, selector: #selector(refreshColours), name: NSNotification.Name(rawValue: "refreshColours"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        
//     NotificationCenter.default.addObserver(self, selector: #selector(tappedButtonInCloud), name: NSNotification.Name(rawValue: "buttonTapped"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateTableView), name: NSNotification.Name(rawValue: "tableViewUpdate"), object: nil)

        chatBarTextField.isEnabled = false // this and the timer below are to prevent a crash if tapped before first prompt is shown
        _ = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (view) in
            self.chatBarTextField.isEnabled = true
        })
        _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { (view) in
            if chatManager.showKeyboard {
                self.chatBarTextField.becomeFirstResponder()
                chatManager.showKeyboard = false
            }
        })
        
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
//        print(indexRowsOfPlayableSessions)
        messageProgressBar.setProgress(0.0, animated: false)
        for row in indexRowsOfPlayableSessions {
            let indexPath = IndexPath(row: row, section: 0)
            let cell = tableView.cellForRow(at: indexPath)
            if let widget = cell as? PlayableSessionTableViewCell {
                if widget.sessionTimer.isValid {
                    widget.pause()
                }
            }
        }
        if addItemsTimer.isValid {
            addItemsTimer.invalidate()
            let _ = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (view) in
                for item in self.segmentsArray {
                    self.hurryUpAddNext(segment: item)
                }
            })
            
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    

    
   
    
    func getPromptFrom(promptType: PromptType) { // used for changing the currentPrompt from HomeVC
        currentPrompt = createPromptFor(promptType: promptType)
    }
   
    @objc func finishedSession() {
        let date = Date() as NSDate
        let newSession = Session(context: managedContext)

        newSession.date = date
        newSession.sessionType = myConvert.stringFrom(sessionType: sessionManager.sessionType)
        newSession.durationInS = Int16(sessionManager.totalLengthInSeconds)
        newSession.inhaleLength = Int16(sessionManager.inhale)
        newSession.exhaleLength = Int16(sessionManager.exhale)
        newSession.fullSustainLength = Int16(sessionManager.fullSustain)
        newSession.emptySustainLength = Int16(sessionManager.emptySustain)
        newSession.cycleBreakLength = Int16(sessionManager.cycleBreakLengthInS)
        newSession.numberOfBreathsPerCycle = Int16(sessionManager.numberOfBreathsPerCycle)
        newSession.numberOfCycles = Int16(sessionManager.totalCycles)
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Error saving trial session (\(error))")
        }
        changeto(showKeyboard: false)
    }
    @objc  func changeto(showKeyboard: Bool) {
//   print(chatManager.pendingQueue)
//    chatBarTextField.text = ""
    
        
        if let firstInQueue = chatManager.pendingQueue.first {
            currentPrompt = createPromptFor(promptType: firstInQueue)
            promptTypesShown.append(currentPrompt.promptType)
            var segments = currentPrompt.itemSegments
//            if showKeyboard {
//                let showKeyboardItem = createLaunchKeyboardItem()
//                segments.append([showKeyboardItem])
//            }
            //    addSegmentsToTableView(segments: segments)
//            _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { (view) in
                self.addSegmentsToTableView(segments: segments)
//            })
            
            
            
            
//            addItemsToTableView(segments: currentPrompt.itemSegments)
            
            chatManager.pendingQueue.removeFirst()
            
        } else { // Removes the pending cell
            
            
//            pendingCell.stopTimer()
//            if itemsShown.isEmpty == false {
//            itemsShown.removeLast()
//            }
//            tableView.reloadData()
        }
//        if showKeyboard {
//            _ = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { (view) in
//                self.chatBarTextField.becomeFirstResponder()
//
//            })
//
//        }
    }
//    @objc func tappedButtonInCloud() {
//        // Keyboard/TextField Stuff
//
//        chatBarTextField.text = ""
//        // chatBarTextField.resignFirstResponder()
//        ////
//
//
//
//        print(chatManager.buttonTappedPositionInItemsShown)
//
//        if  let cellData = itemsShown[chatManager.buttonTappedPositionInItemsShown] as? ButtonCloudData {
//            cellData.tappedButtonIndex = chatManager.buttonTappedIndex
//            cellData.animateShowing = false
//
//            //print(cellData.tappedButtonIndex)
//
//        }
//
//        if chatManager.buttonTappedPositionInItemsShown == itemsShown.count - 1 {
//
//        let _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: { (view) in
//
//            //self.addUserInputToTableView(input: button.inputString)
////            self.addUserMessageToTableView(input: button.inputString)
////            triageAction(action: button.action, userInput: button.inputString)
//            self.changeto()
//        })
//        }
//
//
//        chatManager.buttonTappedIndex = -999
//        chatManager.buttonTappedPositionInItemsShown = -999
//    }
    
//    @objc func tappedInViewButton(sender: UITapGestureRecognizer) {
//        let view = sender.view //as! ButtonTableViewCell
//        let button = view?.superview?.superview?.superview as! ButtonTableViewCell
//
//        tableView.beginUpdates()
//        var tempArray: [Item2] = []
//        var count = 0
//
//        // For Removing The Buttons When One Is Tapped
//        var arrayOfRows: [Int] = []
//        for item in currentButtons {
//            arrayOfRows.append(item.row)
//        }
//        for item in itemsShown {
//            if arrayOfRows.contains(count) == false {
//                tempArray.append(item)
//            }
//            count += 1
//        }
//        itemsShown = tempArray
//
//
//        tableView.deleteRows(at: currentButtons, with: UITableViewRowAnimation.fade)
//        tableView.endUpdates()
//
//
//            let _ = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false, block: { (view) in
//
//                //self.addUserInputToTableView(input: button.inputString)
//                self.addUserMessageToTableView(input: button.inputString)
//                triageAction(action: button.action, userInput: button.inputString)
//                self.changeto()
//            })
//
//
//    }
    
    

}







