//
//  HealthKitSetUpAssistant.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-26.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
import HealthKit
class HealthKitSetupAssistant {
    
    private enum HealthkitSetupError: Error {
        case notAvailableOnDevice
        case dataTypeNotAvailable
    }
    
    class func authorizeHealthKit(completion: @escaping (Bool, Error?) -> Swift.Void) {
        
        //1. Check to see if HealthKit Is Available on this device
        guard HKHealthStore.isHealthDataAvailable() else {
            completion(false, HealthkitSetupError.notAvailableOnDevice)
            return
        }
        guard   let mindfulType = HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.mindfulSession) else {
                
                completion(false, HealthkitSetupError.dataTypeNotAvailable)
                return
        }
        let healthKitTypesToWrite: Set<HKSampleType> = [mindfulType]

        HKHealthStore().requestAuthorization(toShare: healthKitTypesToWrite,
                                             read: healthKitTypesToWrite) { (success, error) in
                                                completion(success, error)
        }
    }
    
    
}

