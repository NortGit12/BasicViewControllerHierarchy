//
//  PlanetViewController.swift
//  BasicViewControllerHierarchy
//
//  Created by Jeff Norton on 4/18/17.
//  Copyright © 2017 Jeff Norton. All rights reserved.
//

import UIKit

class PlanetViewController: UIViewController {

    //==================================================
    // MARK: - _Properties
    //==================================================
    
    // Misc
    var planet: Planet? {
        didSet {
            updateViews()
        }
    }
    
    // Outlets
    @IBOutlet weak var distanceFromSunLabel: UILabel!
    @IBOutlet weak var lengthOfYearLabel: UILabel!
    @IBOutlet weak var planetImageView: UIImageView!
    @IBOutlet weak var planetNameLabel: UILabel!
    @IBOutlet weak var planetSymbolImageView: UIImageView!
    
    //==================================================
    // MARK: - General
    //==================================================
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateViews()
    }
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    private func updateViews() {
        
        if let planet = planet {
            
            if isViewLoaded {
                
                distanceFromSunLabel.text = "\(planet.distancefromSunInMillionsofKMs)"
                lengthOfYearLabel.text = "\(planet.revolutionPeriodDurationInDays) days"
                planetImageView.image = UIImage(data: planet.imageData as Data)
                planetNameLabel.text = planet.name
                planetSymbolImageView.image = UIImage(data: planet.symbolData as Data)
            }
        }
    }
}
