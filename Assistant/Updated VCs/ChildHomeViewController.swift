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
    var prompt: Prompt = homePrompt.createPrompt()
    var parentPageViewController: PageViewController!
    func getParentPageViewController(parentRef: PageViewController) {
        parentPageViewController = parentRef
    }
    var itemsShown: [Item] = []
    var spacerHeight: CGFloat = 29
    var managedContext: NSManagedObjectContext!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var background: UIView!
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var topBarLabel: UILabel!
    @IBOutlet weak var chatBarButton: UIView!
    
    @IBOutlet weak var chatBarLabel: UILabel!
    lazy var coreDataStack = CoreDataStack(modelName: "BreatheHistory")

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        prompt =
//        currentPrompt = prompt!
        
        options = SubscriptionService.shared.options

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleOptionsLoaded(notification:)),
                                               name: SubscriptionService.optionsLoadedNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handlePurchaseSuccessfull(notification:)),
                                               name: SubscriptionService.purchaseSuccessfulNotification,
                                               object: nil)
//        if let subscriptions = options {
//            if subscriptions.isEmpty == false {
//                print(subscriptions.first!.product.localizedTitle)
//                print(subscriptions.first!.formattedPrice)
//            }
//
//        }
        
//        handleOptionsLoaded(notification: <#T##Notification#>)
        
        
        if SubscriptionService.shared.currentSessionId != nil &&
            SubscriptionService.shared.hasReceiptData {
            user.premium = true
        }

        
        
        user.updateValuesFromDefaults()
        managedContext = coreDataStack.managedContext
        setUpTableView()
        addHomePromptToTableView(segments: prompt.itemSegments)
        setUpColours()
        //add(promptSegments: prompt!.itemSegments, isChat: false, tv: tableView)
        // Do any additional setup after loading the view.
        setUpChatBarButton()
        
        
        
//        askUserPermissionToShowNotifications()
//        setDailyNotification()
//        trialSaveToCD()
        //fetchAllSessionsFromCD()
//        print(itemsShown)
        
   
//        print(itemsShown)
        _ = Timer.scheduledTimer(withTimeInterval: 10, repeats: false, block: { (view) in
            print("Hit 10s")
            print(self.options?.first)
        })
        
    }
    
    @objc func handleOptionsLoaded(notification: Notification) {
        
        DispatchQueue.main.async { [weak self] in
            self?.options = SubscriptionService.shared.options
            if let subscriptions = self?.options {
                            if subscriptions.isEmpty == false {
                                print(subscriptions.first!.product.localizedTitle)
                                print(subscriptions.first!.formattedPrice)
                                
                            }
                
                        }
//            self?.tableView.reloadData()
        }
    }
    
    @objc func handlePurchaseSuccessfull(notification: Notification) {
        DispatchQueue.main.async { [weak self] in
//            self?.tableView.reloadData()
        }
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
    override func viewDidAppear(_ animated: Bool) {
        
        
        chatManager.currentVC = .home
        itemsShown = []
        prompt = homePrompt.createPrompt()
        addHomePromptToTableView(segments: prompt.itemSegments )
        getLast3ItemsFromCD()

        NotificationCenter.default.addObserver(self, selector: #selector(transitionToChat), name: NSNotification.Name(rawValue: "switchToChatVC"), object: nil)
               NotificationCenter.default.addObserver(self, selector: #selector(refreshColours), name: NSNotification.Name(rawValue: "refreshColours"), object: nil)
        if user.finishedOnboarding == false && user.onboardingInProgress == false{
            user.onboardingInProgress = true
            chatManager.pendingQueue.append(contentsOf: paths.onboardingPromptTypes)
            
            transitionToChat()
        }
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
//    func trialSaveToCD() {
//       let newSession = Session(context: managedContext)
//        let date = Date() as NSDate
//        
//        newSession.date = date
//        newSession.sessionType = "Deep Breathing"
//        newSession.durationInS = 300
//        newSession.inhaleLength = 4
//        newSession.exhaleLength = 8
//        newSession.fullSustainLength = 0
//        newSession.emptySustainLength = 0
//        newSession.cycleBreakLength = 0
//        newSession.numberOfBreathsPerCycle = 0
//        newSession.numberOfCycles = 0
//        do {
//            try managedContext.save()
//        } catch let error as NSError {
//            print("Error saving trial session (\(error))")
//        }
//    }
    
    func fetchAllSessionsFromCD() {
        let fetch: NSFetchRequest<Session> = Session.fetchRequest()
        
        do {
        let results = try managedContext.fetch(fetch)
            for result in results {
                print(" ")
//                print(result)
                print(result.sessionType)
                print(" ")
            }
        } catch let error as NSError {
            print("Error fetching results")
        }
    }
    
    func getLast3ItemsFromCD() {
        var uniqueSessions: [Session] = []
        let fetchRequest: NSFetchRequest<Session> = Session.fetchRequest()
        
        let sort = NSSortDescriptor(key: #keyPath(Session.date),
                                    ascending: false)
        fetchRequest.sortDescriptors = [sort]
        fetchRequest.fetchLimit = 10
        do {
            let results = try managedContext.fetch(fetchRequest)
            for result in results {
                print(result.sessionType)
//                if uniqueSessions.contains(result) == false {
//                    uniqueSessions.append(result)
//                }
                var addBool = true
                var arrayOfSameCounts: [Int] = []
                for session in uniqueSessions {
                    var sameCount = 0
                    if session.sessionType! == result.sessionType {
                       sameCount += 1
                    }
                    if session.durationInS == result.durationInS {
                        sameCount += 1
                    }
                    if session.inhaleLength == result.inhaleLength {
                        sameCount += 1
                    }
                    if session.exhaleLength == result.exhaleLength {
                        sameCount += 1
                    }
                    if session.fullSustainLength == result.fullSustainLength {
                        sameCount += 1
                    }
                    if session.emptySustainLength == result.emptySustainLength {
                        sameCount += 1
                    }
                    if session.cycleBreakLength == result.cycleBreakLength {
                        sameCount += 1
                    }
                    if session.numberOfBreathsPerCycle == result.numberOfBreathsPerCycle {
                        sameCount += 1
                    }
                    if session.numberOfCycles == result.numberOfCycles {
                        sameCount += 1
                    }
                    arrayOfSameCounts.append(sameCount)
                }
                if arrayOfSameCounts.contains(9) == false{
                        uniqueSessions.append(result)
                }
            }
        } catch let error as NSError {
            print("Error fetching")
        }
//        print(uniqueSessions)
        
        var threeRecomendations: [Session] = []
        var max = 2
        if uniqueSessions.count < 3 {
            max = uniqueSessions.count - 1
        }
        if max != -1 {
            for x in 0...max {
                threeRecomendations.append(uniqueSessions[x])
            }
        }
            var itemCount = 0
            var tempArray: [Item] = []
            for item in itemsShown {
                if item.type != .passableSession {
                    tempArray.append(item)
                } else {
                    if threeRecomendations.isEmpty == false {
                        
                    tempArray.append(createPassableSession(sessionType: myConvert.sessionTypeFrom(string: threeRecomendations[0].sessionType!), inhale: Int(threeRecomendations[0].inhaleLength), exhale: Int(threeRecomendations[0].exhaleLength), fullSustain: Int(threeRecomendations[0].fullSustainLength), emptySustain: Int(threeRecomendations[itemCount].emptySustainLength), totalLengthInSeconds: Int(threeRecomendations[0].durationInS), numberOfBreathsPerCycle: Int(threeRecomendations[0].numberOfBreathsPerCycle), breakLengthForCycle: Int(threeRecomendations[0].cycleBreakLength), totalCycles: Int(threeRecomendations[0].numberOfCycles), secondsElapsed: 0, startOfLastBreath: 0))
                        threeRecomendations.removeFirst()
                    } else {
                        tempArray.append(item)
                    }

                }
            }
        print(tempArray)
        
        itemsShown = tempArray
        
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


//class ChildHomeViewController: ParentViewController, NewPageObservation {
////    var parentPageViewController: PageViewController!
//    var tableViewVC : ParentViewController!
//    var prompt: Prompt? = nil
//    func getParentPageViewController(parentRef: PageViewController) {
//        parentPageViewController = parentRef
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        prompt = homePrompt.createPrompt()
//       currentPrompt = prompt!
//
//
//        add(promptSegments: prompt!.itemSegments, isChat: false, tv: tableView)
//        // Do any additional setup after loading the view.
//
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    override func viewDidAppear(_ animated: Bool) {
//        chatManager.currentVC = .home
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}

