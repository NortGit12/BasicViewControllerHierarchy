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

class PersonDetailViewController: UIViewController, UIImagePickerControllerDelegate {
    
    //==================================================
    // MARK: - _Properties
    //==================================================
    
    // Model
    var person: Person?
    
    // Misc
    var imagePicker = UIImagePickerController()
    
    // Outlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var selectImageButton: UIButton!
    
    //==================================================
    // MARK: - Actions
    //==================================================
    
    @IBAction func cancelBarButtonItemTapped(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBarButtonItemTapped(_ sender: UIBarButtonItem) {
        
        guard let firstName = firstNameTextField.text, firstName.characters.count > 0
            , let lastName = lastNameTextField.text, lastName.characters.count > 0
        else {
            let insufficientInfoAlertController = UIAlertController(title: "Missing"
                , message: "Required info missing.  Fill in all fields and try again."
                , preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            insufficientInfoAlertController.addAction(okAction)
            self.present(insufficientInfoAlertController, animated: true, completion: nil)
            return
        }
        
        var imageData: NSData? = nil
        if let personImage = personImageView.image {
            imageData = UIImagePNGRepresentation(personImage) as NSData?
        }
        
        var notes: String? = nil
        if let notesText = notesTextView.text, notesText.characters.count > 0 {
            notes = notesText
        }
        
        if let person = person {
            
            PersonController.updatePerson(person, firstName: firstName, lastName: lastName, imageData: imageData, notes: notes)
            
        } else {
            
            PersonController.createPerson(firstName: firstName
                , lastName: lastName
                , imageData: imageData
                , notes: notesTextView.text)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectImageButtonTapped(_ sender: UIButton) {
        
        print("Select Image button tapped")
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









