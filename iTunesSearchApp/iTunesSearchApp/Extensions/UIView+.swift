//
//  UIView+.swift
//  FinansCase
//
//  Created by Erdem on 8.03.2022.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({ addSubview($0) })
    }
}
