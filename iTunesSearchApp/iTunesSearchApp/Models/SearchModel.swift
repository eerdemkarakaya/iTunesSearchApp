//
//  SearchModel.swift
//  iTunesSearchApp
//
//  Created by Erdem on 9.03.2022.
//

import Foundation

struct SearchModel: Codable {
    struct Response: Decodable {
        let resultCount: Int
        let results: [SearchGeneralModel]
        
        struct SearchGeneralModel: Decodable {
            enum SearchModelVariable {
                case wrapperType, artistName, artworkUrl30, artworkUrl60, artworkUrl100, primaryGenreName, collectionName, kind, trackName, trackPrice, trackId
            }
            
            // Common Variables
            private let wrapperType,
                        artistName,
                        artworkUrl30,
                        artworkUrl60,
                        artworkUrl100,
                        country,
                        currency: String
            
            private let releaseDate,
                        artistViewUrl,
                        collectionName,
                        primaryGenreName: String?
            private let collectionPrice: Double?
            
            private let trackId,
                        trackCount: Int?

            // Track Variables
            private let kind,
                        trackName: String?
            
            private let trackNumber: Int?
            private let trackPrice: Double?
            
            // AudiBook Variables
            private let description: String?
            
            // MARK: - Getter & Setter Methods
            func getStringValue(typeOf: SearchModelVariable) -> String {
                switch typeOf {
                case .wrapperType: return wrapperType
                case .artistName: return artistName
                case .artworkUrl30: return artworkUrl30
                case .artworkUrl60: return artworkUrl60
                case .artworkUrl100: return artworkUrl100
                case .collectionName: return collectionName ?? "-"
                case .primaryGenreName: return primaryGenreName ?? "?genre?"
                case .kind: return kind ?? "-"
                case .trackName: return trackName ?? "-"
                case .trackPrice: return "\(trackPrice ?? 0.0)"
                case .trackId: return "\(trackId ?? 0)"
                }
            }
            
            func getSongCardModel() -> SongCardModel {
                return SongCardModel(id:  "\(trackId ?? 0)",
                                     price: "\(trackPrice ?? 0)",
                                     songName: trackName ?? "?name?",
                                     songDetail: "\(artistName) - \(collectionName ?? "?collectionName?")",
                                     imageURL: artworkUrl30)
            }
            func getMovieCardModel() -> MovieCardModel {
                return MovieCardModel(id: "\(trackId ?? 0)",
                                      movieName: trackName ?? "?name?",
                                      movieCategory: primaryGenreName ?? "?genre?",
                                      movieDate: releaseDate ?? "",
                                      imageURL: artworkUrl100)
            }
        }
    }
}

