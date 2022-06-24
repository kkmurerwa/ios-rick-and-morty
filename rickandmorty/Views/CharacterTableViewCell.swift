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
        self.speciesLabel.text = "\(character!.gender) - \(character!.status)"
        
        // Load and display image
        // Check image cache before downloading data
        if let cachedData = ImageCacheManager.getImageCache(self.character!.imageUrl) {
            
            // Set the thumbnailImageView from cache
            self.characterImage.image = UIImage(data: cachedData)
            
            return
        }
        
        // Download the thumbnail data
        let thumbnailUrl = URL(string: self.character!.imageUrl)
        
        // Get the shared url session objetc
        let session = URLSession.shared
        
        // Create Data task
        let dataTask = session.dataTask(with: thumbnailUrl!) { (data, response, error) in
            
            if error == nil && data != nil {
                // Check that downloaded URL matches the video thumbnail url
                if thumbnailUrl!.absoluteString != self.character?.imageUrl {
                    // Video cell has been recycled for another video and no longer matches downloaded url
                    return
                }
                
                // Create the image object
                let image = UIImage(data: data!)
                
                ImageCacheManager.setImageCache(thumbnailUrl!.absoluteString, data)
                
                // Set the image object to imageview in main thread
                DispatchQueue.main.async {
                    self.characterImage.image = image
                }
            }
            
        }
        
        // Initialize data task
        dataTask.resume()
    }

}
