//
//  EpisodeResponse.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 29/06/2022.
//

import Foundation

struct EpisodeResponse: Decodable {
    
    var items: [Episode]?
    
    enum CodingKeys: String, CodingKey {
        
        case items = "results"
        
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Episode].self, forKey: .items)
        
    }
        
}
