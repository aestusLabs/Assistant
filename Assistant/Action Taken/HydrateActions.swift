//
//  HydrateActions.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-13.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation

struct HydrateActions {
    func addWater(userInput: String) {
        let amountToAdd = myConvert.liquidAmount(userInput: userInput)
        hydrateManager.addWater(amount: amountToAdd)
        print("It wor98y98ked \(hydrateManager.interval1Total)")
        
    }
}
