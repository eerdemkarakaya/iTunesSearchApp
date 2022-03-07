//
//  BaseView.swift
//  FinansCase
//
//  Created by Erdem on 7.03.2022.
//

import Foundation
import UIKit

class BaseView<P>: UIView {
    // MARK: - Properties
    weak var delegate: AnyObject?
        
    // MARK: - Constructor Method
    init(_ delegate: AnyObject) {
        super.init(frame: .zero)
        
        backgroundColor = .white
        self.delegate = delegate
        loadView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Methods
    func loadView() {
        setConstraints()
    }
    func setConstraints() {
        
    }
}
