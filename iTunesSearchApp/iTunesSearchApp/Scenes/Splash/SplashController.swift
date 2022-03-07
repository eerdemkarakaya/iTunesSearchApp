//
//  SplashController.swift
//  FinansCase
//
//  Created by Erdem on 7.03.2022.
//

import Foundation
import UIKit

class SplashController: UIViewController {
    // MARK: - Properties
    var coordinator: SplashCoordinator?
    private var viewModel = SplashViewModel()
    
    // MARK: - View Elements
    private lazy var view_ = SplashView(self)
    
    // MARK: - Constructor Methods
    override func loadView() {
        super.loadView()
        
        view = view_
    }
    
    // MARK: - Custom Methods
}

// MARK: - Extension / SplashView Protocol
extension SplashController: SplashViewProtocol {
    
}
