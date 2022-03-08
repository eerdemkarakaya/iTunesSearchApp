//
//  UITableView+Init.swift
//  iTunesSearchApp
//
//  Created by Erdem on 8.03.2022.
//

import UIKit

extension UITableView {
    convenience init(bgColor: UIColor = .clear,
                     inset: UIEdgeInsets = .zero,
                     delegate: UITableViewDelegate,
                     dataSource: UITableViewDataSource,
                     seperatorStyle: UITableViewCell.SeparatorStyle = .none) {
        self.init(frame: .zero, style: .plain)
        
        self.contentInset = inset
        self.delegate = delegate
        self.dataSource = dataSource
        self.backgroundColor = bgColor
        self.separatorStyle = seperatorStyle
    }
}
