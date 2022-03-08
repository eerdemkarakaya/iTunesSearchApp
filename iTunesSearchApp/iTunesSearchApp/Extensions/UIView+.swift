//
//  UIView+.swift
//  FinansCase
//
//  Created by Erdem on 8.03.2022.
//

import UIKit

extension UIView {
    /// This method adds the shadow.
    func addShadow() {
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.14
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
    }
    
    /**
     This method adds the view items.
     
    - parameters:
        - views: UIView... (Variadic)
     */
    func addSubviews(_ views: UIView...) {
        views.forEach({ addSubview($0) })
    }
    
    /// This method hides the keyboard.
    func hideKeyboard() {
        self.addTapGesture(self, #selector(endEditing(_:)))
    }
    
    /**
     This method add the tap gesture.
     
     - Parameters:
        - target:
        - selector:
     */
    func addTapGesture(_ target: Any, _ selector: Selector) {
        let tapGesture = UITapGestureRecognizer(target: target, action: selector)
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGesture)
    }
    
    /**
     This method adds completion with animation by duration.
     
     - Parameters:
        - startDuration:
        - startCompletion:
        - endDuration:
        - endCompletion:
     */
    func animate(startDuration: CGFloat, startCompletion: @escaping (() -> Void),
                 endDuration: CGFloat, endCompletion: @escaping (() -> Void)) {
        UIView.animate(withDuration: startDuration) {
            startCompletion()
        } completion: { isFinished in
            UIView.animate(withDuration: endDuration) { endCompletion() }
        }

    }
    
    /**
     This method hides View with alpha value animation.
     
     - Parameters:
        - hidden:
        - animated:
        - completion?:
     */
    func setViewHidden(_ hidden: Bool, animated: Bool, completion: (() -> Void)? = nil) {
        let duration = animated ? 0.3 : 0
        UIView.animate(withDuration: duration) {
            self.alpha = hidden ? 0 : 1
        } completion: { _ in
            if let completion = completion {
                completion()
            }
        }
    }
}
