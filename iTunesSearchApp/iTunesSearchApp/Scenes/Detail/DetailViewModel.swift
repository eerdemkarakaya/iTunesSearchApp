//
//  DetailViewModel.swift
//  iTunesSearchApp
//
//  Created by Erdem on 11.03.2022.
//

import Foundation

class DetailViewModel: NSObject {
    // MARK: - Properties
    private var id: String!
    
    // MARK: - Notify Controller
    
    
    // MARK: - Service Methods
    
    
    // MARK: - Getter & Setter Methods
    func setId(_ id: String) {
        self.id = id
    }
    func getId() -> String {
        return id
    }
}
