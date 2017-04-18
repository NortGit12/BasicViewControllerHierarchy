//
//  PlanetController.swift
//  BasicViewControllerHierarchy
//
//  Created by Jeff Norton on 4/18/17.
//  Copyright © 2017 Jeff Norton. All rights reserved.
//

import Foundation

class PlanetController {
    
    //==================================================
    // MARK: - _Properties
    //==================================================
    
    var planets = [Planet]()
    static let shared = PlanetController()
    
    //==================================================
    // MARK: - Initializers
    //==================================================
    
    init() {
        
        self.planets = createData()
    }
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    private func createData() -> [Planet] {
        
        let sun = Planet(distancefromSunInMillionsofKMs: 0.0, image: "image_sun", name: "Sun", revolutionPeriodDurationInDays: 0.0, rotationPeriodDurationInDays: 0.0, symbolImage: "symbol_sun")
        let mercury = Planet(distancefromSunInMillionsofKMs: 57.9, image: "image_mercury", name: "Mercury", revolutionPeriodDurationInDays: 87.97, rotationPeriodDurationInDays: 58.6, symbolImage: "symbol_mercury")
        let venus = Planet(distancefromSunInMillionsofKMs: 108.2, image: "image_venus", name: "Venus", revolutionPeriodDurationInDays: 224.7, rotationPeriodDurationInDays: 243, symbolImage: "symbol_venus")
        let earth = Planet(distancefromSunInMillionsofKMs: 149.6, image: "image_earth", name: "Earth", revolutionPeriodDurationInDays: 365.26, rotationPeriodDurationInDays: 0.99, symbolImage: "symbol_earth")
        let moon = Planet(distancefromSunInMillionsofKMs: 0.0, image: "image_moon", name: "Moon", revolutionPeriodDurationInDays: 0.0, rotationPeriodDurationInDays: 0.0, symbolImage: "symbol_moon")
        let mars = Planet(distancefromSunInMillionsofKMs: 227.9, image: "image_mars", name: "Mars", revolutionPeriodDurationInDays: 686.2, rotationPeriodDurationInDays: 1.03, symbolImage: "symbol_mars")
        let jupiter = Planet(distancefromSunInMillionsofKMs: 778.6, image: "image_jupiter", name: "Jupiter", revolutionPeriodDurationInDays: 4328.9, rotationPeriodDurationInDays: 0.41, symbolImage: "symbol_jupiter")
        let saturn = Planet(distancefromSunInMillionsofKMs: 1433.5, image: "image_saturn", name: "Saturn", revolutionPeriodDurationInDays: 10752.9, rotationPeriodDurationInDays: 0.45, symbolImage: "symbol_saturn")
        let uranus = Planet(distancefromSunInMillionsofKMs: 2872.5, image: "image_uranus", name: "Uranus", revolutionPeriodDurationInDays: 30663.65, rotationPeriodDurationInDays: 0.72, symbolImage: "symbol_uranus")
        let neptune = Planet(distancefromSunInMillionsofKMs: 4495.1, image: "image_neptune", name: "Neptune", revolutionPeriodDurationInDays: 60148.35, rotationPeriodDurationInDays: 0.67, symbolImage: "symbol_neptune")
        let pluto = Planet(distancefromSunInMillionsofKMs: 5906.4, image: "image_pluto", name: "Pluto", revolutionPeriodDurationInDays: 90735.35, rotationPeriodDurationInDays: 6.39, symbolImage: "symbol_pluto")
        
        return [sun, mercury, venus, earth, moon, mars, jupiter, saturn, uranus, neptune, pluto]
    }
}









