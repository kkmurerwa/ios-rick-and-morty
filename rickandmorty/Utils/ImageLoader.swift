//
//  ImageLoader.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 24/06/2022.
//

import Foundation
import UIKit

class ImageLoader {
    
    static func loadImage(from url: String, into imageView: UIImageView) {
        print("Download Started")
        
        // Check image cache before downloading data
        if let cachedData = ImageCacheManager.getImageCache(url) {
            
            // Return the thumbnailImageView from cache
            imageView.image = UIImage(data: cachedData)
        } else {
            // Convert Url string to URL object
            let imageUrl = URL(string: url)
            
            // Get the shared url session object
            let session = URLSession.shared
            
            // Create Data task
            let dataTask = session.dataTask(with: imageUrl!) { (data, response, error) in
                
                if error == nil && data != nil {
                    // Check that downloaded URL matches the video thumbnail url
                    if imageUrl!.absoluteString != url {
                        // Video cell has been recycled for another video and no longer matches downloaded url
                        return
                    }
                    
                    ImageCacheManager.setImageCache(imageUrl!.absoluteString, data)
                    
                    // Set the image object to imageview in main thread
                    DispatchQueue.main.async {
                        imageView.image = UIImage(data: data!)
                    }
                }
                
            }
            
            // Initialize data task
            dataTask.resume()
            
        }
    }
    
}
