//
//  EpisodeModel.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 29/06/2022.
//

import Foundation

class EpisodeModel {
    
    var delegate: EpisodeModelDelegate?
    
    func getEpisodes() {
        
        print("Get episodes method was called")
        
        // Create a URL object
        let url = URL(string: Constants.EPISODES_API_URL)
        
        guard url != nil  else {
            print("URL is nil")
            return
        }
        
        // Create a URL Session
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were errors
            if error != nil || data == nil {
                return
            }
            
            do {
                
                // Parse the data into character objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(EpisodeResponse.self, from: data!)
                
                // Ensure response.items is not nill to prevent crashes
                if response.items != nil {
                    
                    // Call the main thread to pass the function through it
                    DispatchQueue.main.async {
                        
                        // Call the "charactersFetched" method of the delegate
                        self.delegate?.episodesFetched(response.items!)
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
