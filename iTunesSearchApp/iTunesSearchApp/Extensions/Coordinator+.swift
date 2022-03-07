//
//  Coordinator+.swift
//  FinansCase
//
//  Created by Erdem on 7.03.2022.
//

import Foundation

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
