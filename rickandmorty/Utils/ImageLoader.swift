//
//  ImageLoader.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 24/06/2022.
//

import Foundation
import UIKit

class ImageLoader {
    
    static func getLoadedImage(imageUrl: String) -> UIImage? {
        
        var uiImage: UIImage?
        
        // Check image cache before downloading data
        if let cachedData = ImageCacheManager.getImageCache(imageUrl) {
            
            // Return the thumbnailImageView from cache
            uiImage = UIImage(data: cachedData)
        } else {
            
            // Download the thumbnail data
            let thumbnailUrl = URL(string: imageUrl)
            
            // Get the shared url session object
            let session = URLSession.shared
            
            // Create Data task
            let dataTask = session.dataTask(with: thumbnailUrl!) { (data, response, error) in
                
                if error == nil && data != nil {
                    // Check that downloaded URL matches the video thumbnail url
                    if thumbnailUrl!.absoluteString != imageUrl {
                        // Video cell has been recycled for another video and no longer matches downloaded url
                        return
                    }
                    
                    // Create the image object
                    let image = UIImage(data: data!)
                    
                    ImageCacheManager.setImageCache(thumbnailUrl!.absoluteString, data)
                    
                    // Set the image object to imageview in main thread
                    DispatchQueue.main.async {
                        uiImage = image
                    }
                } else {
                    DispatchQueue.main.async {
                        uiImage = nil
                    }
                }
                
            }
            
            // Initialize data task
            dataTask.resume()
            
        }
        
        return uiImage
        
    }
    
}
