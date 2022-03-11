//
//  SearchSection.swift
//  iTunesSearchApp
//
//  Created by Erdem on 12.03.2022.
//

import Foundation

enum SearchSection: String {
    case song           = "song"
    case podcast        = "podcast"
    case feature_movie  = "feature-movie"
    case tv_episode     = "tv-episode"
    case music_video    = "music-video"
    
    func getTitle() -> String {
        switch self {
        case .song          : return "Şarkı"
        case .podcast       : return "Ses Dosyası"
        case .feature_movie : return "Uzun Metrajlı Film"
        case .tv_episode    : return "TV Bölümü"
        case .music_video   : return "Videolu Müzik"
        }
    }
}
