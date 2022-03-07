//
//  UIActivityIndicator+.swift
//  iTunesSearchApp
//
//  Created by Erdem on 8.03.2022.
//

import UIKit

extension UIActivityIndicatorView {
    convenience init(color: UIColor = .darkGray, styleType: Style) {
        self.init(frame: .zero)
        
        self.color = color
        self.style = styleType
    }
}
