//
//  UIImageView+Init.swift
//  iTunesSearchApp
//
//  Created by Erdem on 8.03.2022.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage,
                     contentMode: ContentMode = .scaleAspectFit,
                     tintColor: UIColor? = nil) {
        self.init(frame: .zero)
        
        self.contentMode = contentMode
        guard let tintColor = tintColor else {
            self.image = image
            return
        }
        
        self.tintColor = tintColor
        self.image = image.withRenderingMode(.alwaysTemplate)

    }
}
