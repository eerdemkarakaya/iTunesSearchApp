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
                     seperatorInset: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0),
                     seperatorStyle: UITableViewCell.SeparatorStyle = .none) {
        self.init(frame: .zero, style: .plain)
        translatesAutoresizingMaskIntoConstraints = false
        
        self.contentInset = inset
        self.delegate = delegate
        self.dataSource = dataSource
        self.backgroundColor = bgColor
        self.separatorInset = seperatorInset
        self.separatorStyle = seperatorStyle
        
        self.allowsSelection = true
        self.allowsSelectionDuringEditing = true
        
        self.allowsMultipleSelection = false
        self.allowsMultipleSelectionDuringEditing = false
        
    }
}
