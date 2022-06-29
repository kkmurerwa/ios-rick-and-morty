//
//  LocationsViewController.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 29/06/2022.
//

import UIKit

class LocationsViewController: UIViewController, LocationModelDelegate {

    var model = LocationModel()
    
    var locations = [Location]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set model delegate as viewcontroller(self)
        model.delegate = self
        
        // Invoke fetch data method of models
        model.getLocations()
    }
    
    
    // MARK: - Network call response methods
    
    func locationsFetched(_ locations: [Location]) {
        
        // Set the returned locations to our locations property
        self.locations = locations
        
    }

}
