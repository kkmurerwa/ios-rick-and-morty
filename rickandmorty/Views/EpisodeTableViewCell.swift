//
//  EpisodeTableViewCell.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 29/06/2022.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var episodeNameLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var dateAiredLabel: UILabel!
    
    var episode: Episode?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ passedEpisode: Episode) {
        
        // Clear previous values on reused cell
        self.episodeNameLabel.text = ""
        self.numberLabel.text = ""
        self.dateAiredLabel.text = ""
        
        
        self.episode = passedEpisode
        
        // Ensure that we the character object is not null to prevent crashes
        guard self.episode != nil else {
            return
        }
        
        // Set char name
        self.episodeNameLabel.text = episode!.name
        self.numberLabel.text = episode!.episodeTitle
        self.dateAiredLabel.text = episode!.dateAired
        
    }

}
