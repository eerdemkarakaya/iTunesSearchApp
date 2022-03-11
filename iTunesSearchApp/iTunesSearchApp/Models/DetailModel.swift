//
//  DetailModel.swift
//  iTunesSearchApp
//
//  Created by Erdem on 11.03.2022.
//

import Foundation

struct DetailModel: Codable {
    struct Response: Decodable {
        private var resultCount: Int
        private var results: [DetailResultModel]
        
        // MARK: - Getter Method
        func getResult() -> DetailResultModel {
            return results[0]
        }
        
        struct DetailResultModel: Decodable {
            enum DetailResultVariable { case artistName, collectionName, trackName, trackPrice, artworkUrl100 }
            private var trackName,
                        artistName,
                        artworkUrl100,
                        collectionName: String?
            
            private var trackPrice: Double
                        
            // MARK: - Getter & Setter Methods
            func getStringValue(_ of: DetailResultVariable) -> String {
                switch of {
                case .artistName    : return artistName ?? ""
                case .collectionName: return collectionName ?? ""
                case .trackName     : return trackName ?? ""
                case .trackPrice    : return "₺ \(trackPrice)"
                case .artworkUrl100 : return artworkUrl100 ?? ""
                }
            }
        }
    }
}
