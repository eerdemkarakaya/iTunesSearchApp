//
//  SearchCoordinator.swift
//  iTunesSearchApp
//
//  Created by Erdem on 8.03.2022.
//

import UIKit

class SearchCoordinator: Coordinator {
    // MARK: - Properties
    private let navigationController: UINavigationController
    
    // MARK: - Constructor Method
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Methods
    func start() {
        let searchController = SearchController()
        searchController.coordinator = self
                
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(searchController, animated: true)        
    }
}

// MARK: - Extension / Search Flow Protocol
extension SearchCoordinator: SearchFlow {
    
}
