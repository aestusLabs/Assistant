//
//  SubscriptionService.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-03-29.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
import StoreKit
class SubscriptionService: NSObject {
    
    static let sessionIdSetNotification = Notification.Name("SubscriptionServiceSessionIdSetNotification")
    static let optionsLoadedNotification = Notification.Name("SubscriptionServiceOptionsLoadedNotification")
    static let restoreSuccessfulNotification = Notification.Name("SubscriptionServiceRestoreSuccessfulNotification")
    static let purchaseSuccessfulNotification = Notification.Name("SubscriptionServiceRestoreSuccessfulNotification")
    
    
    static let shared = SubscriptionService()
    
    var hasReceiptData: Bool {
        return loadReceipt() != nil
    }
    
    var currentSessionId: String? {
        didSet {
            NotificationCenter.default.post(name: SubscriptionService.sessionIdSetNotification, object: currentSessionId)
        }
    }
    
    var currentSubscription: PaidSubscription?
    
    var options: [Subscription]? {
        didSet {
            NotificationCenter.default.post(name: SubscriptionService.optionsLoadedNotification, object: options)
            print(options)
            
        }
    }
    
    func loadSubscriptionOptions() {
       let subscription = "sub.premiumSubscription"
        
        let productIDs = Set([subscription])
        
        let request = SKProductsRequest(productIdentifiers: productIDs)
        request.delegate = self as SKProductsRequestDelegate
        request.start()
        
    }
    
    func purchase(subscription: Subscription) {
        // TODO: Create payment
    }
    
    func restorePurchases() {
        // TODO: Initiate restore
    }
    
    func uploadReceipt(completion: ((_ success: Bool) -> Void)? = nil) {
//        if let receiptData = loadReceipt() {
//            SelfieService.shared.upload(receipt: receiptData) { [weak self] (result) in
//                guard let strongSelf = self else { return }
//                switch result {
//                case .success(let result):
//                    strongSelf.currentSessionId = result.sessionId
//                    strongSelf.currentSubscription = result.currentSubscription
//                    completion?(true)
//                case .failure(let error):
//                    print("🚫 Receipt Upload Failed: \(error)")
//                    completion?(false)
//                }
//            }
//        }
    }
    
    private func loadReceipt() -> Data? {
        // TODO: Load the receipt data from the device
        return nil
    }
}
extension SubscriptionService: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        options = response.products.map { Subscription(product: $0) }
        print(response.products)
        
        
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        if request is SKProductsRequest {
            print("Subscription Options Failed Loading: \(error.localizedDescription)")
        }
    }
}
