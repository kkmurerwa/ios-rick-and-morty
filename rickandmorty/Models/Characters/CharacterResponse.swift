//
//  CharacterResponse.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 24/06/2022.
//

import Foundation

struct CharacterResponse: Decodable {
    
    var items: [Character]?
    
    enum CodingKeys: String, CodingKey {
        
        case items = "results"
        
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Character].self, forKey: .items)
        
    }
    
}
