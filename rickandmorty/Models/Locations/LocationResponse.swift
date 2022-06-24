//
//  LocationResponse.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 24/06/2022.
//

import Foundation

struct LocationResponse: Decodable {
    
    var items: [Location]?
    
    enum CodingKeys: String, CodingKey {
        
        case items = "results"
        
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Location].self, forKey: .items)
        
    }
    
}
