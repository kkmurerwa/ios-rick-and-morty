//
//  LocationModel.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 24/06/2022.
//

import Foundation

class LocationModel {
    
    var delegate: LocationModelDelegate?
    
    func getLocations() {
        
        print("Get locations method was called")
        
        // Create a URL object
        let url = URL(string: Constants.LOCATIONS_API_URL)
        
        guard url != nil  else {
            print("URL is nil")
            return
        }
        
        // Create a URL session
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were errors
            if error != nil || data == nil {
                return
            }
            
            do {
                
                // Parse the data into character objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(LocationResponse.self, from: data!)
                
                // Ensure response.items is not nil to prevent crashes
                if response.items != nil {
                    
                    // Call the main thread to pass the function through it
                    DispatchQueue.main.async {
                        
                        // Call the "charactersFetched" method of the delegate
                        self.delegate?.locationsFetched(response.items!)
                    }
                
                }
                
                dump(response)
                
            } catch {
                
                // Print error message
                print("The following error was encountered: \(error)")
            }
            
            
        }
        
        // Initailized the data task
        dataTask.resume()

    }
    
}
