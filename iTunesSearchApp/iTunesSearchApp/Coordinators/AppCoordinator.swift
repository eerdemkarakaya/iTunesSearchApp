//
//  AppCoordinator.swift
//  FinansCase
//
//  Created by Erdem on 7.03.2022.
//

import UIKit

class AppCoordinator: Coordinator {
    // MARK: - Properties
    private let window: UIWindow
    private let navigationController = UINavigationController()
    
    // MARK: - Constructor Method
    init(_ window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Methods
    func start() {
        navigationController.setNavigationBarHidden(true, animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        lazy var splashCoordinator = SplashCoordinator(navigationController: navigationController)
        coordinate(to: splashCoordinator)
    }
}
