//
//  Character.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 24/06/2022.
//

import Foundation

struct Character : Decodable {
    
    var characterId = 0
    var name = ""
    var status = ""
    var species = ""
    var gender = ""
    var homePlanet = ""
    var imageUrl = ""
    
    var episodes = [String]()
    
    enum CodingKeys: String, CodingKey {
        
        case characterId = "id"
        case name
        case status
        case species
        case gender
        case imageUrl = "image"
        
        case episodes = "episode"
        
        case origin
        
    }
    
    enum CodingKeysOrigin: String, CodingKey {
        
        case homePlanet = "name"
        
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.characterId = try container.decode(Int.self, forKey: .characterId)
        
        self.name = try container.decode(String.self, forKey: .name)
        
        self.status = try container.decode(String.self, forKey: .status)
        
        self.species = try container.decode(String.self, forKey: .species)
        
        self.gender = try container.decode(String.self, forKey: .gender)
        
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
        
        let originContainer = try container.nestedContainer(keyedBy: CodingKeysOrigin.self, forKey: .origin)
        
        self.homePlanet = try originContainer.decode(String.self, forKey: .homePlanet)
        
        self.episodes = try container.decode([String].self, forKey: .episodes)
    }
    
}
