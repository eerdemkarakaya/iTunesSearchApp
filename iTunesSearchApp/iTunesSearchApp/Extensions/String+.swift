//
//  String+.swift
//  iTunesSearchApp
//
//  Created by Erdem on 9.03.2022.
//

import Foundation

extension String {
    func removeExtraSpaces() -> String {
        return replacingOccurrences(of: "[\\s\n]+", with: " ", options: .regularExpression, range: nil)
    }
}
