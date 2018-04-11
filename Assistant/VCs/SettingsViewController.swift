//
//  SettingsViewController.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-03-08.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI
import StoreKit
class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate {


    @IBOutlet weak var topBarLabel: UILabel!
    
    @IBOutlet weak var topBar: UIView!
    
    @IBOutlet weak var background: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var closeButton: UIButton!

    var settingsItems: [Item] = []
    var itemsShown: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpColours()
        setUpTableView()
        // Do any additional setup after loading the view.
        let prompt = otherPrompts.newSettings()
        
        for segment in prompt.itemSegments {
            for item in segment {
                itemsShown.append(item)
                settingsItems.append(item)
            }
        }
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setUpColours() {
        topBar.backgroundColor = getColourFor.topBar()
        topBarLabel.textColor = getColourFor.label()
        background.backgroundColor =  getColourFor.vcBackground()
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

    @IBAction func closeButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
}

extension SettingsViewController {
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
            
            
            
            if currentItem.type == .settingsButton {
                
                let button = cell as! SettingsButtonTableViewCell
             
                let tap = UITapGestureRecognizer(target: self, action: #selector(tappedButton(sender:)))
                button.background.addGestureRecognizer(tap)
            } else if currentItem.type == .buttonCloud {
                let buttonCell = cell as! ButtonCloudTableViewCell
                let tap = UITapGestureRecognizer(target: self, action: #selector(tappedButton(sender:)))
                
                for button in buttonCell.shownButtons {
                    button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
                }

            }
            
            
            return cell
        }
        
        return getCellForItemType.pendingCell()
        
    }
    
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["someone@somewhere.com"])
        mailComposerVC.setSubject("Sending you an in-app e-mail...")
        mailComposerVC.setMessageBody("Sending e-mail in-app is not so bad!", isHTML: false)
        
        return mailComposerVC
    }

func showSendMailErrorAlert() {
    let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
    sendMailErrorAlert.show()
}

// MARK: MFMailComposeViewControllerDelegate Method
func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    controller.dismiss(animated: true, completion: nil)
}
    @objc func tappedBackButton() {
        itemsShown = settingsItems
        tableView.reloadData()
    }
    @objc func tappedButton(sender: UITapGestureRecognizer) {
        let cell = sender.view?.superview?.superview as! SettingsButtonTableViewCell
       
        let buttonTapped = cell.buttonLabel
        
        if buttonTapped?.text == "How App Works" {
            itemsShown = []
            let prompt = createPromptFor(promptType: .showHowAppWorksSettings)
            for segment in prompt.itemSegments {
                for item in segment {
                   
                        itemsShown.append(item)
                    
                }
            }
            tableView.reloadData()
//            dismiss(animated: true, completion: nil)

//            chatManager.pendingQueue.insert(.showHowAppWorks, at: 0)
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "switchToChatVC"), object: nil)

        } else if buttonTapped?.text == "See All Global Commands" {
            itemsShown = []
            let prompt = createPromptFor(promptType: .showAllGlobalCommandsList)
            for segment in prompt.itemSegments {
                for item in segment {
                    
                    itemsShown.append(item)
                    
                }
            }
            tableView.reloadData()
        }
        
        if buttonTapped?.text == "Tweet Me" {
            let urlString = "https://twitter.com/intent/tweet?text=@iankohlert"
            let svc = SFSafariViewController(url: NSURL(string: urlString)! as URL)
            self.present(svc, animated: true, completion: nil)
        } else if buttonTapped?.text == "Email Me" {
            let mailComposeViewController = configuredMailComposeViewController()
            if MFMailComposeViewController.canSendMail() {
                self.present(mailComposeViewController, animated: true, completion: nil)
            } else {
                self.showSendMailErrorAlert()
            }
        } else if buttonTapped?.text == "My Site" {
            let urlString = "http://www.aestusfuturistics.com"
            let svc = SFSafariViewController(url: NSURL(string: urlString)! as URL)
            self.present(svc, animated: true, completion: nil)
        } else if buttonTapped?.text == "Rate The App" {
            SKStoreReviewController.requestReview()

        } else if buttonTapped?.text == "Go To Icons8" {
            let urlString = "https://icons8.com"
            let svc = SFSafariViewController(url: NSURL(string: urlString)! as URL)
            self.present(svc, animated: true, completion: nil)
        } else if buttonTapped?.text == "Go To Her Site" {
            let urlString = "https://www.emilyonly.net"
            let svc = SFSafariViewController(url: NSURL(string: urlString)! as URL)
            self.present(svc, animated: true, completion: nil)
        }
     
}
}
