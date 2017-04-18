//
//  PlanetsPageViewController.swift
//  BasicViewControllerHierarchy
//
//  Created by Jeff Norton on 4/18/17.
//  Copyright © 2017 Jeff Norton. All rights reserved.
//

import CoreData
import UIKit

class PlanetsPageViewController: UIPageViewController, NSFetchedResultsControllerDelegate {

    //==================================================
    // MARK: - _Properties
    //==================================================
    
    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>?
    var orderedViewControllers = [UIViewController]()
    
    //==================================================
    // MARK: - General
    //==================================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assign this instance as the UIPageViewControllerDataSource's data source
        dataSource = self
        
        initializeFetchedResultsController()
        
//        // Create the view controller instances
//        for planet in PlanetController.shared.planets {
//            
//            let PlanetViewController = createNewViewControllerForPlanet(planet)
//            
//            orderedViewControllers.append(PlanetViewController)
//        }
        
        if let firstPlanetViewController = orderedViewControllers.first {
            
            setViewControllers([firstPlanetViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    private func createNewViewControllerForPlanet(_ planet: Planet) -> UIViewController {
        
        let PlanetViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlanetViewController") as! PlanetViewController
        PlanetViewController.planet = planet
        //        PlanetViewController.view.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height)
        
        return PlanetViewController
    }
    
    func initializeFetchedResultsController() {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Planet")
        request.sortDescriptors = [NSSortDescriptor(key: "sequenceID", ascending: true)]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request
            , managedObjectContext: PersistenceController.moc, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController?.delegate = self
        
        refreshFetchedResults()
    }
    
    func refreshFetchedResults() {
        
        do {
            try fetchedResultsController?.performFetch()
        } catch let error as NSError {
            NSLog("Error fetching planets: \(error.localizedDescription)")
        }
    }
    
    func viewControllerAtIndex(_ index: Int) -> PlanetViewController? {
        
        if (orderedViewControllers.count == 0) || (index >= orderedViewControllers.count) {
            
            NSLog("The array is empty or the index \(index) is out of range.")
            return nil
        }
        
        let PlanetViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlanetViewController") as! PlanetViewController
//        PlanetViewController.planet = PlanetController.shared.planets[index]
        PlanetViewController.planet = fetchedResultsController?.fetchedObjects?[index] as? Planet
        
        return PlanetViewController
    }
    
    func indexOfViewController(_ viewController: PlanetViewController) -> Int? {
        
        guard let planet = viewController.planet else {
            
            NSLog("Error unwrapping a planet.")
            return nil
        }
        
//        let index = PlanetController.shared.planets.index(where: {$0 == planet})  // This required the model to conform to the Equatable protocol
        
        return Int(planet.sequenceID)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        
//        return PlanetController.shared.planets.count
        return fetchedResultsController?.fetchedObjects?.count ?? 0
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        guard let firstPlanetViewController = viewControllers?.first
            , let firstPlanetViewControllerIndex = orderedViewControllers.index(where: { $0 == firstPlanetViewController }) else {
                
                NSLog("Error identifying the presentation index.")
                return 0
        }
        
        return firstPlanetViewControllerIndex
    }
}

extension PlanetsPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = indexOfViewController((viewController as? PlanetViewController)!) else {
            
            NSLog("Error casing the view controller as a PlanetViewController")
            return nil
        }
        
        let beforeIndex = (index == 0) ? (orderedViewControllers.count - 1) : (index - 1) 
        
        return viewControllerAtIndex(beforeIndex) 
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = indexOfViewController((viewController as? PlanetViewController)!) else {
            
            NSLog("Error casing the view controller as a PlanetViewController")
            return nil
        }
        
        let afterIndex = (index == (orderedViewControllers.count - 1)) ? 0 : (index + 1)
        
        return viewControllerAtIndex(afterIndex)
    }

}









