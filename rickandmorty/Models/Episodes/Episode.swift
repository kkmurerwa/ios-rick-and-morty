//
//  Episode.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 29/06/2022.
//

import Foundation

struct Episode: Decodable {
    
    var episodeId = 0
    var name = ""
    var episodeTitle = ""
    var dateAired = ""
    
    var characters = [String]()
    
    enum CodingKeys: String, CodingKey {
        
        case eposodeId = "id"
        case name
        case episodeTitle = "episode"
        case characters
        
        case dateAired = "air_date"
        
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.episodeId = try container.decode(Int.self, forKey: .eposodeId)
        
        self.name = try container.decode(String.self, forKey: .name)
        
        self.episodeTitle = try container.decode(String.self, forKey: .episodeTitle)
        
        self.dateAired = try container.decode(String.self, forKey: .dateAired)
        
        self.characters = try container.decode([String].self, forKey: .characters)
        
    }
    
}
