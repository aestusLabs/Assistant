//
//  HydrateActionsHomeExtension.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-13.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation

extension ChildHomeViewController {
    func actOnHydration(action: ButtonAction, userInput: String) -> Bool {
        if action == .addWater {
            return true
        }
        return false
    }
}
