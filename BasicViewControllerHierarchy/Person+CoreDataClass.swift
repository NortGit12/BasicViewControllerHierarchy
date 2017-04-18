//
//  Person+CoreDataClass.swift
//  BasicViewControllerHierarchy
//
//  Created by Jeff Norton on 4/17/17.
//  Copyright © 2017 Jeff Norton. All rights reserved.
//

import CoreData
import UIKit


public class Person: NSManagedObject {
    
    //==================================================
    // MARK: - _Properties
    //==================================================
    
    
    //==================================================
    // MARK: - Initializers
    //==================================================
    
    convenience init?(firstName: String
        , lastName: String
        , notes: String? = nil
        , context: NSManagedObjectContext = PersonController.moc) {
        
        // Only get "Song" Entities
        guard let entity = NSEntityDescription.entity(forEntityName: "Person"
            , in: context) else { return nil }
        
        // Identify the context we want to put the "Song" Entity in
        self.init(entity: entity, insertInto: context)
        
        self.firstName = firstName
        self.lastName = lastName
        self.notes = notes
        
    }

}
