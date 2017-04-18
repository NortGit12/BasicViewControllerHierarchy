//
//  Planet+CoreDataProperties.swift
//  BasicViewControllerHierarchy
//
//  Created by Jeff Norton on 4/18/17.
//  Copyright © 2017 Jeff Norton. All rights reserved.
//

import Foundation
import CoreData


extension Planet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Planet> {
        return NSFetchRequest<Planet>(entityName: "Planet")
    }

    @NSManaged public var distancefromSunInMillionsofKMs: Float
    @NSManaged public var imageData: NSData
    @NSManaged public var name: String
    @NSManaged public var revolutionPeriodDurationInDays: Float
    @NSManaged public var rotationPeriodDurationInDays: Float
    @NSManaged public var sequenceID: Int16
    @NSManaged public var symbolData: NSData

}
