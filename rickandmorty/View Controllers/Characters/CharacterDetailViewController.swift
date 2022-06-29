//
//  DetailViewController.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 29/06/2022.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var episodesLabel: UILabel!
    
    @IBOutlet weak var homePlanetLabel: UILabel!
    
    
    var character: Character?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Hide tab bar in this view
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Clear previous text
        genderLabel.text = ""
        statusLabel.text = ""
        episodesLabel.text = ""
        homePlanetLabel.text = ""
        
        
        // Check if there is character passed
        guard character != nil else {
            return
        }
        
        // Set title
        title = character!.name
        
        // Set other fields
        genderLabel.text = character!.gender
        statusLabel.text = character!.status
        episodesLabel.text = "\(character!.episodes.count) Episode(s)"
        homePlanetLabel.text = character!.homePlanet
        
        // Load image
        ImageLoader.loadImage(from: character!.imageUrl, into: characterImageView)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        // Restore tab bar
        self.tabBarController?.tabBar.isHidden = false
        
    }

}
