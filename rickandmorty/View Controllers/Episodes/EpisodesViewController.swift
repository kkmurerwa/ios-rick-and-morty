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
    
    var currentPage = 1
    
    var refreshTime: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set table view data source and delegate as the viewcontroller(self)
        tableView.dataSource = self
        tableView.delegate = self

        // Set model delegate as viewcontroller(self)
        model.delegate = self
        
        // Initial network call
        model.getEpisodes(page: currentPage)
    }
    
    
    // MARK: - Network call response methods
    
    func episodesFetched(_ episodes: [Episode]) {
        
        // Set the returned characters to our characters property
        self.episodes.append(contentsOf: episodes)
        
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pos = scrollView.contentOffset.y
        
        if pos > tableView.contentSize.height - scrollView.frame.size.height{
            
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
        model.getEpisodes(page: currentPage)
        
    }
    

}
