//
//  MovieCardModel.swift
//  iTunesSearchApp
//
//  Created by Erdem on 10.03.2022.
//

import Foundation

struct MovieCardModel {
    enum MovieCardVariable { case id, movieName, movieCategory, movieDate, imageURL }
    private var id,
                movieName,
                movieCategory,
                movieDate,
                imageURL: String
    
    // MARK: - Getter & Setter Methods
    init(id: String, movieName: String, movieCategory: String, movieDate: String, imageURL: String) {
        self.id = id
        self.movieName = movieName
        self.movieCategory = movieCategory
        self.movieDate = movieDate
        self.imageURL = imageURL
    }
    func getStringValue(_ of: MovieCardVariable) -> String {
        switch of {
        case .id            : return id
        case .movieName     : return movieName
        case .movieCategory : return movieCategory
        case .movieDate     : return movieDate
        case .imageURL      : return imageURL
        }
    }
}
