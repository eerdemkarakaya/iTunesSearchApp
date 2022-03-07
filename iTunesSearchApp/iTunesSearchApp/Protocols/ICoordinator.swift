//
//  CoordinatorProtocol.swift
//  FinansCase
//
//  Created by Erdem on 7.03.2022.
//

import Foundation

protocol Coordinator: AnyObject {
    func start()
    func coordinate(to coordinator: Coordinator)
}
