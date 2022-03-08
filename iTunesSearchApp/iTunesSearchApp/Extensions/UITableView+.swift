//
//  UITableView.swift
//  iTunesSearchApp
//
//  Created by Erdem on 8.03.2022.
//

import UIKit

extension UITableView {
    /**
     This method hides UITableView with alpha value animation.
     
     - Parameters:
        - hidden:
        - animated:
        - completion?:
     */
    func setTableViewHidden(_ hidden: Bool, animated: Bool, completion: (() -> Void)? = nil) {
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
