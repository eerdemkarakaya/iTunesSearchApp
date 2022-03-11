//
//  UIView+Init.swift
//  iTunesSearchApp
//
//  Created by Erdem on 10.03.2022.
//

import UIKit

extension UIView {
    convenience init(bgColor: UIColor = .white, cornerRadius: CGFloat = 0, borderColor: UIColor = .clear, borderWidth: CGFloat = 0) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
                
        self.backgroundColor = bgColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        
        self.clipsToBounds = true
    }
}
