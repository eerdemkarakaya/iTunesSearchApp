//
//  UIView+Layout.swift
//  FinansCase
//
//  Created by Erdem on 8.03.2022.
//

import UIKit

extension UIView {
    @discardableResult
    func topTo(_ anchor: NSLayoutYAxisAnchor, value: CGFloat = 0) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: anchor, constant: value).isActive = true
        return self
    }
    
    @discardableResult
    func bottomTo(_ anchor: NSLayoutYAxisAnchor, value: CGFloat = 0) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: anchor, constant: value).isActive = true
        return self
    }
    
    @discardableResult
    func leadingTo(_ anchor: NSLayoutXAxisAnchor, value: CGFloat = 0) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: anchor, constant: value).isActive = true
        return self
    }
    
    @discardableResult
    func trailingTo(_ anchor: NSLayoutXAxisAnchor, value: CGFloat = 0) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.trailingAnchor.constraint(equalTo: anchor, constant: value).isActive = true
        return self
    }
    
    @discardableResult
    func centerXTo(_ anchor: NSLayoutXAxisAnchor, value: CGFloat = 0) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: anchor, constant: value).isActive = true
        return self
    }
    
    @discardableResult
    func centerYTo(_ anchor: NSLayoutYAxisAnchor, value: CGFloat = 0) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: anchor, constant: value).isActive = true
        self.centerYAnchor.constraint(equalTo: anchor, constant: value).identifier = "centerY"
        return self
    }
    
    @discardableResult
    func centerInParent(_ view: UIView) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        centerXTo(view.centerXAnchor)
        centerYTo(view.centerYAnchor)
        return self
    }
    
    @discardableResult
    func width(value: CGFloat) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: value).isActive = true
        return self
    }
    
    @discardableResult
    func maxWidth(value: CGFloat) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(lessThanOrEqualToConstant: value).isActive = true
        return self
    }
    
    @discardableResult
    func height(value: CGFloat) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: value).isActive = true
        return self
    }
    
    @discardableResult
    func minHeight(value: CGFloat) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(greaterThanOrEqualToConstant: value).isActive = true
        return self
    }
    
    @discardableResult
    func aspectSize(ratio: CGFloat) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: ratio).isActive = true
        return self
    }
}
