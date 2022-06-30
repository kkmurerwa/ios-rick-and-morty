//
//  ViewController.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 24/06/2022.
//

import UIKit
import SkeletonView

class CharactersViewController: UIViewController, SkeletonTableViewDataSource, UITableViewDelegate, CharacterModelDelegate {
    
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
        charactersTableView.rowHeight = 120
        charactersTableView.estimatedRowHeight = 120
        
        // Set model delegate as viewcontroller(self)
        model.delegate = self
        
        // Invoke fetch data method of models
        self.model.getCharacters(page: self.currentPage)
        
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
        
        // Hide skeleton view
        charactersTableView.stopSkeletonAnimation()
        view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
        
        // Reload data
        charactersTableView.reloadData()
        
    }

    // MARK: - Skeleton view methods
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if characters.count > 0 {
            
            charactersTableView.stopSkeletonAnimation()
            view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
            
        } else {
            
            charactersTableView.isSkeletonable = true
            charactersTableView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .carrot), animation: nil, transition: .crossDissolve(0.25))
            
        }
        
        
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return Constants.CHARACTER_CELL_ID
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

