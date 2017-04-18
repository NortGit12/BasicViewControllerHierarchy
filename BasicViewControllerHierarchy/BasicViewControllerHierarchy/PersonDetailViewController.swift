//
//  PersonDetailViewController.swift
//  BasicViewControllerHierarchy
//
//  Created by Jeff Norton on 4/17/17.
//  Copyright © 2017 Jeff Norton. All rights reserved.
//

import UIKit

protocol PersonListUpdatedDelegate {
    
}

class PersonDetailViewController: UIViewController {
    
    //==================================================
    // MARK: - _Properties
    //==================================================
    
    // Model
    var person: Person?
    
    // Outlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var notesTextView: UITextView!
    
    //==================================================
    // MARK: - Actions
    //==================================================
    
    @IBAction func saveBarButtonItemTapped(_ sender: UIButton) {
        
        guard let firstName = firstNameTextField.text, firstName.characters.count > 0,
            let lastName = lastNameTextField.text, lastName.characters.count > 0
        else {
            let insufficientInfoAlertController = UIAlertController(title: "Missing"
                , message: "Required info missing.  Fill in all fields and try again."
                , preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            insufficientInfoAlertController.addAction(okAction)
            self.present(insufficientInfoAlertController, animated: true, completion: nil)
            return
        }
        
        PersonController.createPerson(firstName: firstName
            , lastName: lastName
            , notes: notesTextView.text)
        self.dismiss(animated: true, completion: nil)
    }
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    func updateWith(_ person: Person) {
        firstNameTextField.text = person.firstName
        lastNameTextField.text = person.lastName
        if let notes = person.notes {
            notesTextView.text = notes
        }
    }
    
    //==================================================
    // MARK: - View Lifecycle
    //==================================================

    override func viewDidLoad() {
        super.viewDidLoad()

        if let person = person {
            updateWith(person)
        }
    }

}









