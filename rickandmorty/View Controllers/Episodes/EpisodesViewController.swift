//
//  EpisodesViewController.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 29/06/2022.
//

import UIKit

class EpisodesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, EpisodeModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = EpisodeModel()
    
    var episodes = [Episode]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set table view data source and delegate as the viewcontroller(self)
        tableView.dataSource = self
        tableView.delegate = self

        // Set model delegate as viewcontroller(self)
        model.delegate = self
        
        // Initial network call
        model.getEpisodes()
    }
    
    
    // MARK: - Network call response methods
    
    func episodesFetched(_ episodes: [Episode]) {
        
        // Set the returned characters to our characters property
        self.episodes = episodes
        
        // Update table view
        tableView.reloadData()
        
    }
    
    
    // MARK: - TableView methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.EPISODE_CELL_ID, for: indexPath) as! EpisodeTableViewCell


        // Configure the cell with the data

        // Get title for current video
        let episode = self.episodes[indexPath.row]

        cell.setCell(episode)

        // Return the cell for displaying
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    

}
