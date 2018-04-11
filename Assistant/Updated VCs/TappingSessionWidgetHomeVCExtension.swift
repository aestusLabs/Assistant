//
//  TappingSessionWidgetHomeVCExtension.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-21.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

extension ChildHomeViewController {
    
    @objc func tappedSessionWidget(sender: UITapGestureRecognizer) {
        if let cell = sender.view?.superview?.superview?.superview as? BreatheSessionTableViewCell {
    
            
            cell.populateSessionManager()
            clearQueue()
            chatManager.pendingQueue.append(.session)
            transitionToChat()
        }
        
    }
}
