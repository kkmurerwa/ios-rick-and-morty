//
//  ViewController.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 24/06/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CharacterModelDelegate, LocationModelDelegate {
    
    @IBOutlet weak var charactersTableView: UITableView!
    
    var characterModel = CharacterModel()
    var locationModel = LocationModel()
    
    var characters = [Character]()
    var locations = [Location]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set table view data source and delegate as the viewcontroller(self)
        charactersTableView.dataSource = self
        charactersTableView.delegate = self
        
        
        // Set model delegate as viewcontroller(self)
        characterModel.delegate = self
        
        // Invoke fetch data method of models
        characterModel.getCharacters()
        
    }
    
    // MARK: - Segue methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Make sure that a character was selected
        guard charactersTableView.indexPathForSelectedRow != nil else {
            return
        }
        
        // Get a reference to the character that was tapped on
        let selectedCharacter = characters[charactersTableView.indexPathForSelectedRow!.row]
        
    
        // Get a reference to the detail view controller
        let detailViewController = segue.destination as! DetailViewController
        
        
        // Set the character property of the detail view controller
        detailViewController.character = selectedCharacter
        
    }
    
    // MARK: - Network call response methods
    
    func charactersFetched(_ characters: [Character]) {
        
        // Set the returned characters to our characters property
        self.characters = characters
        
        charactersTableView.reloadData()
        
    }
    
    func locationsFetched(_ locations: [Location]) {
        
        // Set the returned locations to our locations property
        self.locations = locations
    }

    // MARK: - TableView methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CHARACTER_CELL_ID, for: indexPath) as! CharacterTableViewCell
        
        
        // Configure the cell with the data
        
        // Get title for current video
        let character = self.characters[indexPath.row]
        
        cell.setCell(character)
        
        // Return the cell for displaying
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

