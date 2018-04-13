//
//  SubscriptionHomeVCExtension.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-13.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation

extension ChildHomeViewController {
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
    
}
