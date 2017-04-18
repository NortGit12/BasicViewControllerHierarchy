//
//  PersonController.swift
//  BasicViewControllerHierarchy
//
//  Created by Jeff Norton on 4/17/17.
//  Copyright © 2017 Jeff Norton. All rights reserved.
//

import UIKit

public class PersonController {
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    static func createPerson(firstName: String, lastName: String, imageData: NSData? = nil, notes: String? = nil) {
        
        let _ = Person(firstName: firstName, lastName: lastName, imageData: imageData, notes: notes)
        PersistenceController.saveContext()
    }
    
    static func deletePerson(_ person: Person) {
        
        PersistenceController.moc.delete(person)
        PersistenceController.saveContext()
    }
    
    static func updatePerson(_ person: Person, firstName: String, lastName: String, imageData: NSData? = nil, notes: String? = nil) {
        
        person.firstName = firstName
        person.lastName = lastName
        person.imageData = imageData
        person.notes = notes
        
        PersistenceController.saveContext()
    }
}
