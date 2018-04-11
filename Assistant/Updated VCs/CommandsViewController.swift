//
//  CommandsViewController.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-04-09.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class CommandsViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var topBarLabel: UILabel!
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var background: UIView!
    
    @IBOutlet weak var closeButtonOutlet: UIButton!
    
    
    var itemsShown: [Item] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        itemsShown = commands.getAllCommands()
        var itemCount = 0
//        for item in itemsShown {
//            var widget = item as! CommandWidget
////            widget.position = itemCount
////            widget.position
//            itemCount += 1
//        }
        setUpColours()
        setUpTableView()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpColours() {
        topBar.backgroundColor = getColourFor.topBar()
        topBarLabel.textColor = getColourFor.label()
        background.backgroundColor =  getColourFor.vcBackground()
        closeButtonOutlet.backgroundColor = getColourFor.topBar()
        closeButtonOutlet.setTitleColor(getColourFor.label(), for: .normal)
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

}

extension CommandsViewController {
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
            
            
            if currentItem.type == .commandWidget {
                let widget = cell as! ShowCommandsTableViewCell
                widget.cellButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
            }
        
            
            
            return cell
        }
        
        return getCellForItemType.pendingCell()
        
    }
    
    @objc func tappedButton(button: UIButton) {
//        contentDidChange()
        var row = 0
         if let cell =  button.superview?.superview?.superview as? ShowCommandsTableViewCell {
            
                print(cell.titleLabel.text)
            var count = 0
            for item in itemsShown {
                
                if let commandWidget = item as? CommandWidget {
                    
                    if commandWidget.title == cell.titleLabel.text! {
                        commandWidget.isExpanded = !commandWidget.isExpanded
                        if cell.isExpanded == false {
                            cell.bodyLabel.text = cell.bodyItems.first!
                        } else {
                     cell.bodyLabel.text = cell.convertBodyItemsToString()
//                    commandWidget.isExpanded = !commandWidget.isExpanded
                        row = count
                        print(commandWidget.title)
                        print(commandWidget.isExpanded)
                        }
                        let indexPath = IndexPath(row: count, section: 0)
//                        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                    }
                    count += 1
                }
                
            }
            
        }
        contentDidChange(row: row)

    }
    func contentDidChange(row: Int) {
//        tableView.beginUpdates()
//        tableView.endUpdates()
        tableView.reloadData()
//        let indexPath = IndexPath(item: row, section: 0)
//        tableView.reloadRows(at: [indexPath], with: .top)
    }
}

struct Commands {
    func getAllCommands() -> [CommandWidget] {
        
        return [session(), appWorks(), navigation(), notifications(), changeData(), learn()]
    }
    
    func session() -> CommandWidget {
        let widget = CommandWidget()
        widget.title = "Session"
        widget.bodyItems = ["'Start New Session'", "'Start Deep Breathing Session'", "'Start Counted Breath Session'", "'Start Alt Nostril Session'", "'Start Bellows Breath Session'", "'Start Shining Skull Breath Session'", "'Start Calming Breath Session'", "'Show Beginner Exercises'" , "'Show Intermediate Exercises'" , "'Show Advanced Exercises'" ,"'Show Calming Exercises'", "'Show Focus Exercises'", "'Show Energizing Exercises'", "'Show Exercises To Help Me Sleep'"  ,"'Change Inhale Length'", "'Change Exhale Length'",  "'Change Full Sustain Length'",  "'Change Empty Sustain Length'"]
        widget.type = .commandWidget
        return widget
    }
    
    func learn() -> CommandWidget {
        let widget = CommandWidget()
        widget.title = "Learn"
        widget.bodyItems = ["'What Is Pranayama'" ,"'How To Breath'", "'Learn About Exercises'", "'Learn About Deep Breathing'", "'Learn About Counted Breath'","'Learn About Alt Nostril Breathing'", "'Learn About Bellows Breath'", "'Learn About Shining Skull Breath'", "'Learn About Calming Breath'", "'Difference Between Bellows Breath And Shining Skull Breath", "'Can I Lay Down While Doing The Exercises?'", "What Should My Posture Be?" ]
        widget.type = .commandWidget

        return widget
    }
    func appWorks() -> CommandWidget {
        let widget = CommandWidget()
        widget.title = "How App Works"
        widget.bodyItems = ["'How Does The App Work?", "'What Do The Dots Mean?'", "'Second Item'"]
        widget.type = .commandWidget
        return widget
    }
    
    func navigation() -> CommandWidget {
    let widget = CommandWidget()
        widget.title = "Navigation"
        widget.bodyItems = ["'Show Settings'", "'Show History'", "'Show All Commands'", "'Go To Settings'", "'Go To _____'"]
        widget.type = .commandWidget

        return widget
    }
    func notifications() -> CommandWidget {
        let widget = CommandWidget()
        widget.title = "Notifications"
        widget.bodyItems = ["'Manage Daily Notifications'", "'Turn On Notifications'", "'Turn Off Notifications'"]
        widget.type = .commandWidget

        return widget
    }
    
    func changeData() -> CommandWidget {
        let widget = CommandWidget()
        widget.title = "Change Stuff"
        widget.bodyItems = ["'Change Name To ____'", "'Call Me _____'", "'Dark Mode'", "'Change Message Speed'", "'Increase Message Speed'", "'Decrease Message Speed'"]
        widget.type = .commandWidget

        return widget
    }
}
let commands = Commands()
