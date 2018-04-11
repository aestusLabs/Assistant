//
//  HistoryViewController.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-03-26.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit
import CoreData
class HistoryViewController: UIViewController {
    var managedContext: NSManagedObjectContext!
    lazy var coreDataStack = CoreDataStack(modelName: "BreatheHistory")

    @IBOutlet weak var topBar: UIView!
    
    @IBOutlet weak var topBarLabel: UILabel!
    
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var background: UIView!
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpColours()
        managedContext = coreDataStack.managedContext

        do {
            try fetchedResultsController.performFetch()
        } catch let error as NSError {
            print("Fetching error: \(error), \(error.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setUpColours() {
        topBar.backgroundColor = getColourFor.topBar()
        topBarLabel.textColor = getColourFor.label()
        background.backgroundColor = getColourFor.vcBackground()
        closeButton.backgroundColor = getColourFor.topBar()
        closeButton.setTitleColor(getColourFor.label(), for: .normal)
    }
    func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 61
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
    }

    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    lazy var fetchedResultsController:
        NSFetchedResultsController<Session> = {
            // 1
            let fetchRequest: NSFetchRequest<Session> = Session.fetchRequest()
            
            let sort = NSSortDescriptor(key: #keyPath(Session.date),
                                        ascending: false)
            fetchRequest.sortDescriptors = [sort]
            
            // 2
            
            
            let fetchedResultsController = NSFetchedResultsController(
                fetchRequest: fetchRequest,
                managedObjectContext: coreDataStack.managedContext,
                sectionNameKeyPath: nil,
                cacheName: nil)
            return fetchedResultsController
    }()

}
extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.sections![0].numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("BreatheSessionTableViewCell", owner: self, options: nil)?.first as! BreatheSessionTableViewCell

        let session = fetchedResultsController.object(at: indexPath)
        cell.exhale = Int(session.exhaleLength)
        cell.inhale = Int(session.inhaleLength)
        cell.fullSustain = Int(session.fullSustainLength)
        cell.emptySustain = Int(session.emptySustainLength)
        cell.totalCycles = Int(session.numberOfCycles)
        cell.numberOfBreathsPerCycle = Int(session.numberOfBreathsPerCycle)
        cell.cycleBreakLengthInS = Int(session.cycleBreakLength)
//        cell.startOfLastBreath = 0
//        cell.secondsElapsed = 0
        cell.colourDots()
        cell.typeLabel.text = session.sessionType!
        cell.timeLabel.text = myConvert.displayTimeFrom(seconds: Int(session.durationInS))
        cell.typeImage.image = myConvert.getImageForBreathe(sessionType: myConvert.sessionTypeFrom(string: session.sessionType!))
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        cell.dateLabel.text = formatter.string(from: session.date! as Date)
//let cell = Bundle.main.loadNibNamed("HistoryItemTableViewCell", owner: self, options: nil)?.first as! HistoryItemTableViewCell
        return cell
    }
}
