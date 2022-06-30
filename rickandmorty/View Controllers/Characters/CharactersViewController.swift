//
//  ViewController.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 24/06/2022.
//

import UIKit

class CharactersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CharacterModelDelegate {
    
    @IBOutlet weak var charactersTableView: UITableView!
    
    var model = CharacterModel()
    
    var characters = [Character]()
    
    var currentPage = 1
    
    var refreshTime: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set table view data source and delegate as the viewcontroller(self)
        charactersTableView.dataSource = self
        charactersTableView.delegate = self
        
        
        // Set model delegate as viewcontroller(self)
        model.delegate = self
        
        // Invoke fetch data method of models
        model.getCharacters(page: currentPage)
        
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
        let detailViewController = segue.destination as! CharacterDetailViewController
        
        // Set the character property of the detail view controller
        detailViewController.character = selectedCharacter
        
    }
    
    // MARK: - Network call response methods
    
    func charactersFetched(_ characters: [Character]) {
        
        // Set the returned characters to our characters property
        self.characters.append(contentsOf: characters)
        
        // Reload data
        charactersTableView.reloadData()
        
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pos = scrollView.contentOffset.y
        
        if pos > charactersTableView.contentSize.height - scrollView.frame.size.height{
            
            print("End reached")
            
            // Check if refreshDate is null
            if refreshTime == nil {
                
                loadNextPage()
                
            } else  {
                let currentTime = Date()
                
                // Find time difference
                let timeDiff = Int(currentTime.timeIntervalSince1970 - refreshTime!.timeIntervalSince1970)
                
                print("Time Diff: \(timeDiff)")
                
                if timeDiff > 3 {
                    
                    loadNextPage()
                    
                }
                
            }
        }
    }
    
    func loadNextPage() {
        
        // Update refresh time
        refreshTime = Date()
        
        // Update page value
        currentPage += 1
        
        // Load next page
        model.getCharacters(page: currentPage)
        
    }
    
}

