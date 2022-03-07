//
//  SplashView.swift
//  FinansCase
//
//  Created by Erdem on 7.03.2022.
//

import Foundation
import UIKit

class SplashView: BaseView<SplashViewProtocol> {
    // MARK: - Properties
    
    // MARK: - View Elements
    private lazy var logoView = UIView()
    private lazy var logoImageView = UIImageView(image: .itunesLogo)
    private lazy var appNameLabel = UILabel(text: "iTunes Search", size: .title2, fontType: .bold, textColor: .darkGray, alignment: .center)
    private lazy var loadingIndicator = UIActivityIndicatorView(color: .darkGray, styleType: .medium)
    
    // MARK: - Constructor Method
    override func loadView() {
        super.loadView()
        
        loadingIndicator.startAnimating()
    }
    override func setConstraints() {
        super.setConstraints()
        
        addSubview(logoView)
        logoView.addSubviews(logoImageView, appNameLabel, loadingIndicator)
        
        logoView
            .centerXTo(centerXAnchor)
            .centerYTo(centerYAnchor)
                        
        logoImageView
            .topTo(logoView.topAnchor)
            .centerXTo(logoView.centerXAnchor)
            .height(value: boundsHeight * 0.2)
            .aspectSize(ratio: 1)
        
        appNameLabel
            .topTo(logoImageView.bottomAnchor, value: 30)
            .centerXTo(logoView.centerXAnchor)
            .width(value: boundsWidth * 0.9)
                
        loadingIndicator
            .topTo(appNameLabel.bottomAnchor, value: 14)
            .bottomTo(logoView.bottomAnchor)
            .centerXTo(logoView.centerXAnchor)
            .height(value: 24)
            .aspectSize(ratio: 1)
    }
    
    // MARK: - Custom Methods
}
