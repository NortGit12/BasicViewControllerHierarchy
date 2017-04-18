//
//  PeopleTableViewController.swift
//  BasicViewControllerHierarchy
//
//  Created by Jeff Norton on 4/17/17.
//  Copyright © 2017 Jeff Norton. All rights reserved.
//

import CoreData
import UIKit

class PeopleTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    //==================================================
    // MARK: - _Properties
    //==================================================
    
    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>?
    
    //==================================================
    // MARK: - View Lifecycle
    //==================================================

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeFetchedResultsController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        refreshFetchedResults()
        tableView.reloadData()
    }
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    func initializeFetchedResultsController() {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        request.sortDescriptors = [NSSortDescriptor(key: "firstName", ascending: true)
            , NSSortDescriptor(key: "lastName", ascending: true)]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request
            , managedObjectContext: PersonController.moc, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController?.delegate = self
        
        refreshFetchedResults()
    }
    
    func refreshFetchedResults() {
        
        do {
            try fetchedResultsController?.performFetch()
        } catch let error as NSError {
            NSLog("Error fetching people: \(error.localizedDescription)")
        }
    }

    //==================================================
    // MARK: - Table view data source
    //==================================================

    override func tableView(_ tableView: UITableView
        , numberOfRowsInSection section: Int) -> Int {
        
        return fetchedResultsController?.fetchedObjects?.count ?? 0
    }

    override func tableView(_ tableView: UITableView
        , cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleListCell", for: indexPath)
        
        if let person = fetchedResultsController?.object(at: indexPath) as? Person {
            cell.textLabel?.text = "\(person.firstName) \(person.lastName)"
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView
        , commit editingStyle: UITableViewCellEditingStyle
        , forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
        
            if let person = fetchedResultsController?.object(at: indexPath) as? Person {
                PersonController.deletePerson(person)
            }
        }
    }
    
    //==================================================
    // MARK: - NSFetchedResultsControllerDelegate
    //==================================================
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController<NSFetchRequestResult>
        , didChangeSection sectionInfo: NSFetchedResultsSectionInfo
        , atIndex sectionIndex: Int
        , forChangeType type: NSFetchedResultsChangeType) {
        
        switch type {
        case .delete:
            self.tableView.deleteSections(NSIndexSet(index: sectionIndex) as IndexSet, with: .automatic)
        case .insert:
            self.tableView.insertSections(NSIndexSet(index: sectionIndex) as IndexSet, with: .automatic)
        case .move:
            self.tableView.deleteSections(NSIndexSet(index: sectionIndex) as IndexSet, with: .automatic)
            self.tableView.insertSections(NSIndexSet(index: sectionIndex) as IndexSet, with: .automatic)
        case .update:
            self.tableView.reloadSections(NSIndexSet(index: sectionIndex) as IndexSet, with: .automatic)
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>
        , didChange anObject: Any
        , at indexPath: IndexPath?
        , for type: NSFetchedResultsChangeType
        , newIndexPath: IndexPath?) {
        
        switch type {
        case .delete:
            self.tableView.deleteRows(at: [indexPath! as IndexPath], with: .automatic)
        case .insert:
            self.tableView.insertRows(at: [newIndexPath! as IndexPath], with: .fade)
        case .move:
            self.tableView.moveRow(at: indexPath! as IndexPath, to: newIndexPath! as IndexPath)
        case .update:
            self.tableView.reloadRows(at: [indexPath! as IndexPath], with: .automatic)
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }

    //==================================================
    // MARK: - Navigation
    //================================================== 

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationNavC = segue.destination as? UINavigationController
            , let personDetailViewController = destinationNavC.viewControllers.first as? PersonDetailViewController
            , let indexPath = tableView.indexPathForSelectedRow {
            
            if let person = fetchedResultsController?.object(at: indexPath) as? Person {
                personDetailViewController.person = person
            }
        }
    }

}









