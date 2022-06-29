//
//  LocationsViewController.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 29/06/2022.
//

import UIKit

class LocationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, LocationModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    var model = LocationModel()
    
    var locations = [Location]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set table view data source and delegate as the viewcontroller(self)
        tableView.dataSource = self
        tableView.delegate = self

        // Set model delegate as viewcontroller(self)
        model.delegate = self
        
        // Invoke fetch data method of models
        model.getLocations()
    }
    
    
    // MARK: - Network call response methods
    
    func locationsFetched(_ locations: [Location]) {
        
        // Set the returned locations to our locations property
        self.locations = locations
        
        // Refresh tableview
        tableView.reloadData()
    }

    
    // MARK: - TableView methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.LOCATION_CELL_ID, for: indexPath) as! LocationTableViewCell
        
        
        // Configure the cell with the data
        
        // Get title for current video
        let location = self.locations[indexPath.row]
        
        cell.setCell(location)
        
        // Return the cell for displaying
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
