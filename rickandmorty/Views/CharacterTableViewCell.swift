//
//  TableViewCell.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 24/06/2022.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var speciesLabel: UILabel!
    
    var character: Character?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ passedCharacter: Character) {
        
        self.character = passedCharacter
        
        // Ensure that we the character object is not null to prevent crashes
        guard self.character != nil else {
            return
        }
        
        // Set char name
        self.nameLabel.text = character!.name
        self.genderLabel.text = character!.gender
        self.speciesLabel.text = "\(character!.species) - \(character!.status)"
        
        // Load image with custom class
        ImageLoader.loadImage(from: character!.imageUrl, into: characterImage)
        
    }

}
