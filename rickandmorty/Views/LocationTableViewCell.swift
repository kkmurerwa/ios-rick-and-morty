//
//  LocationTableViewCell.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 29/06/2022.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var locationTypeLabel: UILabel!
    
    @IBOutlet weak var dimensionLabel: UILabel!
    
    var location: Location?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ passedLocation: Location) {
        
        self.location = passedLocation
        
        // Ensure that we the character object is not null to prevent crashes
        guard self.location != nil else {
            return
        }
        
        // Set char name
        self.nameLabel.text = location!.name
        self.locationTypeLabel.text = location!.type
        self.dimensionLabel.text = location!.dimension
        
    }

}
