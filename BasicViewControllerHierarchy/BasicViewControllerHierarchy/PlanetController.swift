//
//  PlanetController.swift
//  BasicViewControllerHierarchy
//
//  Created by Jeff Norton on 4/18/17.
//  Copyright © 2017 Jeff Norton. All rights reserved.
//

import UIKit

class PlanetController {
    
    //==================================================
    // MARK: - _Properties
    //==================================================
    
    static let shared = PlanetController()
    
    var dataCreated = false
    
    //==================================================
    // MARK: - Initializers
    //==================================================
    
    init() {
        
        if !dataCreated {
            createData()
        }
    }
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    private func createData() {
        
        let sunImageData = UIImagePNGRepresentation(UIImage(named: "image_sun")!)! as NSData
        let mercuryImageData = UIImagePNGRepresentation(UIImage(named: "image_mercury")!)! as NSData
        let venusImageData = UIImagePNGRepresentation(UIImage(named: "image_venus")!)! as NSData
        let earthImageData = UIImagePNGRepresentation(UIImage(named: "image_earth")!)! as NSData
        let moonImageData = UIImagePNGRepresentation(UIImage(named: "image_moon")!)! as NSData
        let marsImageData = UIImagePNGRepresentation(UIImage(named: "image_mars")!)! as NSData
        let jupiterImageData = UIImagePNGRepresentation(UIImage(named: "image_jupiter")!)! as NSData
        let saturnImageData = UIImagePNGRepresentation(UIImage(named: "image_saturn")!)! as NSData
        let uranusImageData = UIImagePNGRepresentation(UIImage(named: "image_uranus")!)! as NSData
        let neptuneImageData = UIImagePNGRepresentation(UIImage(named: "image_neptune")!)! as NSData
        let plutoImageData = UIImagePNGRepresentation(UIImage(named: "image_pluto")!)! as NSData
        
        
        let sunSymbolImageData = UIImagePNGRepresentation(UIImage(named: "symbol_sun")!)! as NSData
        let mercurySymbolImageData = UIImagePNGRepresentation(UIImage(named: "symbol_mercury")!)! as NSData
        let venusSymbolImageData = UIImagePNGRepresentation(UIImage(named: "symbol_venus")!)! as NSData
        let earthSymbolImageData = UIImagePNGRepresentation(UIImage(named: "symbol_earth")!)! as NSData
        let moonSymbolImageData = UIImagePNGRepresentation(UIImage(named: "symbol_moon")!)! as NSData
        let marsSymbolImageData = UIImagePNGRepresentation(UIImage(named: "symbol_mars")!)! as NSData
        let jupiterSymbolImageData = UIImagePNGRepresentation(UIImage(named: "symbol_jupiter")!)! as NSData
        let saturnSymbolImageData = UIImagePNGRepresentation(UIImage(named: "symbol_saturn")!)! as NSData
        let uranusSymbolImageData = UIImagePNGRepresentation(UIImage(named: "symbol_uranus")!)! as NSData
        let neptuneSymbolImageData = UIImagePNGRepresentation(UIImage(named: "symbol_neptune")!)! as NSData
        let plutoSymbolImageData = UIImagePNGRepresentation(UIImage(named: "symbol_pluto")!)! as NSData
        
        
        let _ = Planet(distancefromSunInMillionsofKMs: 0.0, imageData: sunImageData, name: "Sun", revolutionPeriodDurationInDays: 0.0, rotationPeriodDurationInDays: 0.0, sequenceID: 1, symbolData: sunSymbolImageData)
        let _ = Planet(distancefromSunInMillionsofKMs: 57.9, imageData: mercuryImageData, name: "Mercury", revolutionPeriodDurationInDays: 87.97, rotationPeriodDurationInDays: 58.6, sequenceID: 2, symbolData: mercurySymbolImageData)
        let _ = Planet(distancefromSunInMillionsofKMs: 108.2, imageData: venusImageData, name: "Venus", revolutionPeriodDurationInDays: 224.7, rotationPeriodDurationInDays: 243, sequenceID: 3, symbolData: venusSymbolImageData)
        let _ = Planet(distancefromSunInMillionsofKMs: 149.6, imageData: earthImageData, name: "Earth", revolutionPeriodDurationInDays: 365.26, rotationPeriodDurationInDays: 0.99, sequenceID: 4, symbolData: earthSymbolImageData)
        let _ = Planet(distancefromSunInMillionsofKMs: 0.0, imageData: moonImageData, name: "Moon", revolutionPeriodDurationInDays: 0.0, rotationPeriodDurationInDays: 0.0, sequenceID: 5, symbolData: moonSymbolImageData)
        let _ = Planet(distancefromSunInMillionsofKMs: 227.9, imageData: marsImageData, name: "Mars", revolutionPeriodDurationInDays: 686.2, rotationPeriodDurationInDays: 1.03, sequenceID: 6, symbolData: marsSymbolImageData)
        let _ = Planet(distancefromSunInMillionsofKMs: 778.6, imageData: jupiterImageData, name: "Jupiter", revolutionPeriodDurationInDays: 4328.9, rotationPeriodDurationInDays: 0.41, sequenceID: 7, symbolData: jupiterSymbolImageData)
        let _ = Planet(distancefromSunInMillionsofKMs: 1433.5, imageData: saturnImageData, name: "Saturn", revolutionPeriodDurationInDays: 10752.9, rotationPeriodDurationInDays: 0.45, sequenceID: 8, symbolData: saturnSymbolImageData)
        let _ = Planet(distancefromSunInMillionsofKMs: 2872.5, imageData: uranusImageData, name: "Uranus", revolutionPeriodDurationInDays: 30663.65, rotationPeriodDurationInDays: 0.72, sequenceID: 9, symbolData: uranusSymbolImageData)
        let _ = Planet(distancefromSunInMillionsofKMs: 4495.1, imageData: neptuneImageData, name: "Neptune", revolutionPeriodDurationInDays: 60148.35, rotationPeriodDurationInDays: 0.67, sequenceID: 10, symbolData: neptuneSymbolImageData)
        let _ = Planet(distancefromSunInMillionsofKMs: 5906.4, imageData: plutoImageData, name: "Pluto", revolutionPeriodDurationInDays: 90735.35, rotationPeriodDurationInDays: 6.39, sequenceID: 11, symbolData: plutoSymbolImageData)
        
        PersistenceController.saveContext()
        
        dataCreated = true
    }
}









