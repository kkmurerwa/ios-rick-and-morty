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
    
    var characters = [String]()
    
    enum CodingKeys: String, CodingKey {
        
        case eposodeId = "id"
        case name
        case episodeTitle = "episode"
        case characters
        
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.episodeId = try container.decode(Int.self, forKey: .eposodeId)
        
        self.name = try container.decode(String.self, forKey: .name)
        
        self.episodeTitle = try container.decode(String.self, forKey: .episodeTitle)
        
        self.characters = try container.decode([String].self, forKey: .characters)
        
    }
    
}
