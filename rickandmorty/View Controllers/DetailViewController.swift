//
//  DetailViewController.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 29/06/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var episodesLabel: UILabel!
    
    @IBOutlet weak var homePlanetLabel: UILabel!
    
    
    var character: Character?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Clear previous text
        nameLabel.text = ""
        genderLabel.text = ""
        statusLabel.text = ""
        episodesLabel.text = ""
        homePlanetLabel.text = ""
        
        
        // Check if there is character passed
        guard character != nil else {
            return
        }
        
        nameLabel.text = character!.name
        genderLabel.text = character!.gender
        statusLabel.text = character!.status
        episodesLabel.text = "\(character!.episodes.count) Episode(s)"
        homePlanetLabel.text = character!.homePlanet
        
        // Load image
        ImageLoader.loadImage(from: character!.imageUrl, into: characterImageView)
        
    }

}
