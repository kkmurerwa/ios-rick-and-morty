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
    var imageUrl = ""
    
    enum CodingKeys: String, CodingKey {
        
        case characterId = "id"
        case name
        case status
        case gender
        case imageUrl = "image"
        
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.characterId = try container.decode(Int.self, forKey: .characterId)
        
        self.name = try container.decode(String.self, forKey: .name)
        
        self.status = try container.decode(String.self, forKey: .status)
        
        self.gender = try container.decode(String.self, forKey: .gender)
        
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
    }
    
}
