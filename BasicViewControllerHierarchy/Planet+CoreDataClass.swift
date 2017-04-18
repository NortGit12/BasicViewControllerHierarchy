//
//  Planet+CoreDataClass.swift
//  BasicViewControllerHierarchy
//
//  Created by Jeff Norton on 4/18/17.
//  Copyright © 2017 Jeff Norton. All rights reserved.
//

import Foundation
import CoreData


public class Planet: NSManagedObject {
    
    //==================================================
    // MARK: - _Properties
    //==================================================
    
    
    //==================================================
    // MARK: - Initializers
    //==================================================
    
    convenience init?(distancefromSunInMillionsofKMs: Float
        , imageData: NSData
        , name: String
        , revolutionPeriodDurationInDays: Float
        , rotationPeriodDurationInDays: Float
        , sequenceID: Int16
        , symbolData: NSData
        , context: NSManagedObjectContext = PersistenceController.moc) {
        
        // Only get "Planet" Entities
        guard let entity = NSEntityDescription.entity(forEntityName: "Planet"
            , in: context) else { return nil }
        
        // Identify the context we want to put the "Song" Entity in
        self.init(entity: entity, insertInto: context)
        
        self.distancefromSunInMillionsofKMs = distancefromSunInMillionsofKMs
        self.imageData = imageData
        self.name = name
        self.revolutionPeriodDurationInDays = revolutionPeriodDurationInDays
        self.rotationPeriodDurationInDays = rotationPeriodDurationInDays
        self.sequenceID = sequenceID
        self.symbolData = symbolData
        
    }

}

func == (lhs: Planet, rhs: Planet) -> Bool {
    
    return lhs.name == rhs.name
}









