//
//  UILabel+Init.swift
//  iTunesSearchApp
//
//  Created by Erdem on 8.03.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String = "",
                     size: FontSize = .body,
                     numberOfLines: Int = 1,
                     fontType: Font = .regular,
                     textColor: UIColor = .black,
                     alignment: NSTextAlignment = .left) {
        self.init(frame: .zero)
        
        self.text = text
        self.textColor = textColor
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines
        self.font = UIFont(name: fontType.rawValue, size: size.rawValue)
    }
}
