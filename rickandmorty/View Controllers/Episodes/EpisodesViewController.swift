//
//  EpisodesViewController.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 29/06/2022.
//

import UIKit

class EpisodesViewController: UIViewController, EpisodeModelDelegate {
    
    var model = EpisodeModel()
    
    var episodes = [Episode]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set model delegate as viewcontroller(self)
        model.delegate = self
        
        // Initial network call
        model.getEpisodes()
    }
    
    
    // MARK: - Network call response methods
    
    func episodesFetched(_ episodes: [Episode]) {
        
        // Set the returned characters to our characters property
        self.episodes = episodes
        
//        charactersTableView.reloadData()
        
    }
    
    
    // MARK: - TableView methods
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return episodes.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CHARACTER_CELL_ID, for: indexPath) as! CharacterTableViewCell
//
//
//        // Configure the cell with the data
//
//        // Get title for current video
//        let character = self.characters[indexPath.row]
//
//        cell.setCell(character)
//
//        // Return the cell for displaying
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
    

}
