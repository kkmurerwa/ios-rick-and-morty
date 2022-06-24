//
//  Location.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 24/06/2022.
//

import Foundation

struct Location: Decodable {
    
    var locationId = 0
    var name = ""
    var type = ""
    var dimension = ""
    var imageUrl = ""
    
    enum CodingKeys: String, CodingKey {
        
        case locationId = "id"
        case name
        case type
        case dimension
        case imageUrl = "url"
        
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.locationId = try container.decode(Int.self, forKey: .locationId)
        
        self.name = try container.decode(String.self, forKey: .name)
        
        self.type = try container.decode(String.self, forKey: .type)
        
        self.dimension = try container.decode(String.self, forKey: .dimension)
        
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
        
    }
    
}
