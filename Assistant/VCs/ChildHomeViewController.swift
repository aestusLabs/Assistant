//
//  ChildHomeViewController.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-01-10.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit
import CoreData
import StoreKit
class ChildHomeViewController: UIViewController, NewPageObservation, UITableViewDelegate, UITableViewDataSource {
    //    var parentPageViewController: PageViewController!
//    var tableViewVC : ParentViewController!
    var prompt: Prompt = homePrompt.createHydrateHome()
    var parentPageViewController: PageViewController!
    func getParentPageViewController(parentRef: PageViewController) {
        parentPageViewController = parentRef
    }
    var itemsShown: [Item] = []
    var spacerHeight: CGFloat = 29
    var managedContext: NSManagedObjectContext!
    var hydrateManagedContext: NSManagedObjectContext!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var background: UIView!
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var topBarLabel: UILabel!
    @IBOutlet weak var chatBarButton: UIView!
    
    @IBOutlet weak var chatBarLabel: UILabel!
    lazy var coreDataStack = CoreDataStack(modelName: "BreatheHistory")
    lazy var hydrateCoreDataStack = CoreDataStack(modelName: "HydrateHistory")
    
    
    func getPromptForApp() -> Prompt {
        if appInfo.appType == .assistant {
            return homePrompt.createHydrateHome()
        } else if appInfo.appType == .breathe {
            return homePrompt.createBreathePrompt()
        } else if appInfo.appType == .hydrate {
            if dately.isSecondDateWithin18HoursOfFirstDate(firstDate: hydrateManager.lastDayStarted, secondDate: Date() ) == false{
                hydrateManager.lastDayStarted = Date()
                return homePrompt.hydrateGoodMorningPrompt()
            }
            return homePrompt.createHydrateHome()
        }
        
        // This should never be hit
        return homePrompt.createBreathePrompt()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNotificationObservers()
        
        
        options = SubscriptionService.shared.options

    
        if SubscriptionService.shared.currentSessionId != nil &&
            SubscriptionService.shared.hasReceiptData {
            user.premium = true
        }

        
        

        user.updateValuesFromDefaults()
        managedContext = coreDataStack.managedContext
        hydrateManagedContext = hydrateCoreDataStack.managedContext
        setUpTableView()

        setUpColours()
  
        setUpChatBarButton()

        _ = Timer.scheduledTimer(withTimeInterval: 10, repeats: false, block: { (view) in
            print("Hit 10s")
            print(self.options?.first)
        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if appInfo.appType == .hydrate || appInfo.appType == .assistant {
            updateHydrateDefaultValues()
            if dately.isSecondDateWithin18HoursOfFirstDate(firstDate: hydrateManager.lastDayStarted, secondDate: Date()) {
                updateHydrateManagerFromCDValues()
            }
        }
        
        printAllHydrateCDObjects()
        chatManager.currentVC = .home
        itemsShown = []
        prompt = getPromptForApp()
        addHomePromptToTableView(segments: prompt.itemSegments )
        if appInfo.appType == .breathe {
            getLast3ItemsFromCD()
        }
        NotificationCenter.default.addObserver(self, selector: #selector(transitionToChat), name: NSNotification.Name(rawValue: "switchToChatVC"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(refreshColours), name: NSNotification.Name(rawValue: "refreshColours"), object: nil)
        if user.finishedOnboarding == false && user.onboardingInProgress == false{
            user.onboardingInProgress = true
            chatManager.pendingQueue.append(contentsOf: paths.getOnboardingPath())
            
            transitionToChat()
        }
    }
    
    func addNotificationObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleOptionsLoaded(notification:)),
                                               name: SubscriptionService.optionsLoadedNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handlePurchaseSuccessfull(notification:)),
                                               name: SubscriptionService.purchaseSuccessfulNotification,
                                               object: nil)
    }
    
 
    @objc func refreshColours() {
        setUpColours()
        tableView.reloadData()
    }
    
    func setUpChatBarButton() {
        chatBarButton.layer.cornerRadius = 18
        let tap = UITapGestureRecognizer(target: self, action:  #selector(tappedChatBarButton))
        chatBarButton.addGestureRecognizer(tap)
        
    }
    @objc func tappedChatBarButton() {
        chatManager.pendingQueue = []
        chatManager.pendingQueue = [.whatCanIHelpWith]
        chatManager.showKeyboard = true
        transitionToChat()
    }
    
    func setUpColours() {
        topBar.backgroundColor = getColourFor.topBar()
        topBarLabel.textColor = getColourFor.label()
        background.backgroundColor =  getColourFor.vcBackground()
        chatBarButton.backgroundColor = getColourFor.chatBarBackground()
        chatBarLabel.textColor = getColourFor.fadedLabel()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 61
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
    }
    
    func addHomePromptToTableView(segments: [[Item]]) {
        for segment in segments {
            itemsShown.append(contentsOf: segment)
        }
        tableView.reloadData()
    }
    

    
  
    
    
    // Premium Funcs
    var options: [Subscription]?
   
    
    
}

extension ChildHomeViewController {
    
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsShown.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentItem = itemsShown[indexPath.row]
        
//        var cell = UITableViewCell()

        
        
        

        
        if let cell = getCellForItemType.getCellFor(item: currentItem) {
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            
            if currentItem.type == .buttonCloud {
                let buttonCell = cell as! ButtonCloudTableViewCell
                addTapsToButtons(shownButtons: buttonCell.shownButtons)
//                buttonCell.animateButtonsMovingUp()
            } else if currentItem.type == .passableSession {
                let sessionWidget = cell as! BreatheSessionTableViewCell
                let tap = UITapGestureRecognizer(target: self, action: #selector(tappedSessionWidget(sender:)))
                sessionWidget.background.addGestureRecognizer(tap)
            }
        
            
            return cell
        }
        
        return getCellForItemType.pendingCell()
        
    }

    
    func clearQueue() {
        chatManager.pendingQueue = []
    }
    
 @objc   func transitionToChat() {
        parentPageViewController.goToNextPage()
    }
    
    
    
    
 
}



