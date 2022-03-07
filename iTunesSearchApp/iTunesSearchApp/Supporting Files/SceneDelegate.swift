//
//  SceneDelegate.swift
//  iTunesSearchApp
//
//  Created by Erdem on 8.03.2022.
//

import UIKit

@available(iOS 13, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - Properties
    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    // MARK: - Life Cycle Methods
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        startApp(scene)
    }
    
    // MARK: - Custom Methods
    private func startApp(_ scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()

        guard window != nil else { return }
        appCoordinator = AppCoordinator(window!)
        appCoordinator?.start()
    }
}

