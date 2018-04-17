//
//  HydrateDay+CoreDataProperties.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-16.
//  Copyright © 2018 aestusLabs. All rights reserved.
//
//

import Foundation
import CoreData


extension HydrateDay {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HydrateDay> {
        return NSFetchRequest<HydrateDay>(entityName: "HydrateDay")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var intervalOneTotal: Int16
    @NSManaged public var intervalOneGoal: Int16
    @NSManaged public var intervalTwoGoal: Int16
    @NSManaged public var intervalTwoTotal: Int16
    @NSManaged public var intervalThreeGoal: Int16
    @NSManaged public var intervalThreeTotal: Int16
    @NSManaged public var intervalFourGoal: Int16
    @NSManaged public var intervalFourTotal: Int16
    @NSManaged public var dayTotal: Int16
    @NSManaged public var dayGoal: Int16

}
