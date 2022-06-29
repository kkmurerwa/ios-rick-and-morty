//
//  EpisodeModelDelegate.swift
//  rickandmorty
//
//  Created by Kenneth Murerwa on 29/06/2022.
//

import Foundation

protocol EpisodeModelDelegate {
    
    func episodesFetched(_ episodes: [Episode])
    
}
