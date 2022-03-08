//
//  InformationView.swift
//  iTunesSearchApp
//
//  Created by Erdem on 8.03.2022.
//

import UIKit

class InformationView: UIView {
    // MARK: - Properties
    
    // MARK: - View Elements
    private lazy var infoImageView = UIImageView(image: nil,  contentMode: .scaleAspectFit)
    private lazy var infoLabel = UILabel(size: .body, numberOfLines: 0, fontType: .medium, textColor: .darkGray, alignment: .center)
    
    // MARK: - Constructor Method
    init(image: UIImage, info: String) {
        super.init(frame: .zero)
        
        self.infoImageView.image = image
        self.infoLabel.text = info
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setConstraints() {
        addSubviews(infoImageView, infoLabel)
        
        infoLabel
            .bottomTo(bottomAnchor)
            .leadingTo(leadingAnchor)
            .trailingTo(trailingAnchor)
        
        infoImageView
            .topTo(topAnchor)
            .bottomTo(infoLabel.bottomAnchor, value: -12)
            .leadingTo(leadingAnchor)
            .trailingTo(trailingAnchor)
        
    }
    
    // MARK: - Custom Methods
}
