//
//  SplashCoordinator.swift
//  FinansCase
//
//  Created by Erdem on 7.03.2022.
//

import UIKit

class SplashCoordinator: Coordinator {
    // MARK: - Properties
    private let navigationController: UINavigationController
    
    // MARK: - Constructor Method
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Methods
    func start() {
        let splashController = SplashController()
        splashController.coordinator = self
        navigationController.pushViewController(splashController, animated: true)
    }
}

// MARK: - Extension / Splash Flow Protocol
extension SplashCoordinator: SplashFlow {
    func coordinateToSearch() {
        let searchCoordinator = SearchCoordinator(navigationController: navigationController)
        coordinate(to: searchCoordinator)
    }
}
