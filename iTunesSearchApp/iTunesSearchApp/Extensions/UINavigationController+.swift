//
//  UINavigationController+.swift
//  iTunesSearchApp
//
//  Created by Erdem on 8.03.2022.
//

import UIKit

extension UIViewController {
    func hideLeftButton() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: nil, style: .done, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem?.tintColor = .clear
    }
//    func setLeftBackButton() {
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: .back, style: .plain, target: self, action: #selector(back))
//        self.navigationItem.leftBarButtonItem?.tintColor = .white
//    }
//    @objc func back() {
//        self.navigationController?.popViewController(animated: true)
//    }
}


