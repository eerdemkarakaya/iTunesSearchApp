//
//  DetailCoordinator.swift
//  iTunesSearchApp
//
//  Created by Erdem on 11.03.2022.
//

import UIKit

class DetailCoordinator: Coordinator {
    // MARK: - Properties
    private let id: String!
    private let navigationController: UINavigationController
    
    // MARK: - Constructor Method
    init(navigationController: UINavigationController, id: String) {
        self.id = id
        self.navigationController = navigationController
    }
    
    // MARK: - Methods
    func start() {
        let detailController = DetailController(id: id)
        detailController.coordinator = self
                
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(detailController, animated: true)
    }
}

// MARK: - Extension / Search Flow Protocol
extension DetailCoordinator: DetailFlow {
    
}
