//
//  Session+CoreDataProperties.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-03-26.
//  Copyright © 2018 aestusLabs. All rights reserved.
//
//

import Foundation
import CoreData


extension Session {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Session> {
        return NSFetchRequest<Session>(entityName: "Session")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var sessionType: String?
    @NSManaged public var durationInS: Int16
    @NSManaged public var inhaleLength: Int16
    @NSManaged public var exhaleLength: Int16
    @NSManaged public var fullSustainLength: Int16
    @NSManaged public var emptySustainLength: Int16
    @NSManaged public var numberOfCycles: Int16
    @NSManaged public var cycleBreakLength: Int16
    @NSManaged public var numberOfBreathsPerCycle: Int16

}
