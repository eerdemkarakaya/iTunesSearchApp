//
//  NSObject+.swift
//  iTunesSearchApp
//
//  Created by Erdem on 8.03.2022.
//

import Foundation

extension NSObject {
    func asyncronize(_ completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            completion()
        }
    }
    func delay(_ time: Double, _ completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            completion()
        }
    }
}
