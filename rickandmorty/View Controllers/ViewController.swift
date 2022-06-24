//
//  ViewController.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 24/06/2022.
//

import UIKit

class ViewController: UIViewController, CharacterModelDelegate, LocationModelDelegate {
    
    var characterModel = CharacterModel()
    var locationModel = LocationModel()
    
    var characters = [Character]()
    var locations = [Location]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set model delegate as viewcontroller(self)
        characterModel.delegate = self
        
        // Get all details
        characterModel.getCharacters()
//        locationModel.getLocations()
        
    }
    
    func charactersFetched(_ characters: [Character]) {
        
        // Set the returned characters to our characters property
        self.characters = characters
        
    }
    
    func locationsFetched(_ locations: [Location]) {
        
        // Set the returned locations to our locations property
        self.locations = locations
    }


}

