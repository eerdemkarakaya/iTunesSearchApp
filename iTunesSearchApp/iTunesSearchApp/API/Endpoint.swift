//
//  Endpoint.swift
//  iTunesSearchApp
//
//  Created by Erdem on 9.03.2022.
//

import Foundation

enum Endpoint: String {
    case search = "search?"
    
    var url: String {
        let baseURL = "https://itunes.apple.com/"
        return baseURL + self.rawValue
    }
}
