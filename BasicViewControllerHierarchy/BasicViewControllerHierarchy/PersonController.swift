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
    // MARK: - _Properties
    //==================================================
    
    static let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    static func createPerson(firstName: String, lastName: String, notes: String? = nil) {
        
        let _ = Person(firstName: firstName, lastName: lastName, notes: notes)
        PersonController.saveContext()
    }
    
    static func deletePerson(_ person: Person) {
        
        PersonController.moc.delete(person)
        PersonController.saveContext()
    }
    
    //==================================================
    // MARK: - Persistence Methods
    //==================================================
    
    private static func saveContext() {
        
        do {
            try PersonController.moc.save()
        } catch let error as NSError {
            NSLog("Error saving the context: \(error.localizedDescription)")
        }
    }
}
