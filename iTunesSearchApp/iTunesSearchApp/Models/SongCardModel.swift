//
//  SongCardModel.swift
//  iTunesSearchApp
//
//  Created by Erdem on 10.03.2022.
//

import Foundation

struct SongCardModel: Decodable {
    enum SongCardVariable { case id, price, songName, songDetail, imageURL }
    private var id,
                price,
                songName,
                songDetail,
                imageURL: String
    
    // MARK: - Getter & Setter Methods
    init(id: String, price: String, songName: String, songDetail: String, imageURL: String) {
        self.id = id
        self.price = price
        self.songName = songName
        self.songDetail = songDetail
        self.imageURL = imageURL
    }
    func getStringValue(_ of: SongCardVariable) -> String {
        switch of {
        case .id         : return id
        case .price      : return price
        case .songName   : return songName
        case .songDetail : return songDetail
        case .imageURL   : return imageURL
        }
    }
}
