//
//  Planet.swift
//  BasicViewControllerHierarchy
//
//  Created by Jeff Norton on 4/18/17.
//  Copyright © 2017 Jeff Norton. All rights reserved.
//

import Foundation

struct Planet {
    
    //==================================================
    // MARK: - _Properties
    //==================================================
    
    let distancefromSunInMillionsofKMs: Float
    let image: String
    let name: String
    let revolutionPeriodDurationInDays: Float
    let rotationPeriodDurationInDays: Float
    let symbolImage: String
}

func == (lhs: Planet, rhs: Planet) -> Bool {
    
    return lhs.name == rhs.name
}
