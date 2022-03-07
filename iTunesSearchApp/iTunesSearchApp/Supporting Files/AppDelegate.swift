//
//  AppDelegate.swift
//  iTunesSearchApp
//
//  Created by Erdem on 8.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    var window: UIWindow?
    private var appCoordinator: AppCoordinator!

    // MARK: - Life Cycle Methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        startApp()
        return true
    }
    
    // MARK: - Custom Methods
    private func startApp() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        appCoordinator = AppCoordinator(window!)
        appCoordinator?.start()
    }
}

