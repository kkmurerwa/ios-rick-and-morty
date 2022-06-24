//
//  ImageCacheManager.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 24/06/2022.
//

import Foundation

class ImageCacheManager {
    
    static var cache = [String:Data]()
    
    static func setImageCache(_ url: String, _ data: Data?) {
        
        // Store the image data and use the url as the key
        cache[url] = data
        
    }
    
    static func getImageCache(_ url: String) -> Data? {
        
        // Try to get the data for the specified url
        return cache[url]
        
    }
    
}
