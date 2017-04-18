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
    
    // Dispatch Queues
//    let saveQueue = dispatch_queue_create("saveQueue", DISPATCH_QUEUE_PRIORITY_BACKGROUND)
    
    // Model
    var person: Person?
    
    // Misc
    var image: UIImage?
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
    
    @IBAction func deleteImageButtonTapped(_ sender: UIButton) {
        self.image = nil
        personImageView.image = nil
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
        if let personImage = self.image {
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
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    func updateWith(_ person: Person) {
        firstNameTextField.text = person.firstName
        lastNameTextField.text = person.lastName
        
        if let imageData = person.imageData {
            
            let image = UIImage(data: imageData as Data)
            self.image = image
            personImageView.image = image
        }
        
        if let notes = person.notes {
            notesTextView.text = notes
        }
    }
    
    //==================================================
    // MARK: - View Lifecycle
    //==================================================

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePickerSetup()

        if let person = person {
            updateWith(person)
        }
    }

}

extension PersonDetailViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerSetup() {
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
//        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
//            NSLog("Error selecting image.")
//            return
//        }
//        self.image = image
        self.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        if let image = self.image {
            personImageView.image = image
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}









