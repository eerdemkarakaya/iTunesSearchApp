//
//  SearchTextfield.swift
//  iTunesSearchApp
//
//  Created by Erdem on 8.03.2022.
//

import UIKit

class SearchTextfield: UITextField {
    // MARK: - Properties
    var textUpdateFinished: (String) -> Void = { _ in }
    private lazy var padding = UIEdgeInsets(top: 0, left: 48, bottom: 0, right: 12)
    
    // MARK: - View Elements
    private lazy var iconImageView = UIImageView(image: .search!, tintColor: .darkGray)
    
    // MARK: - Constructor Methods
    init(tag: Int, placeholder: String = "***") {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        self.textColor = .darkGray
        self.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                        attributes: [.foregroundColor: UIColor.lightGray])
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        
        self.delegate = self
        self.returnKeyType = .search
        
        self.addShadow()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setConstraints() {
        addSubview(iconImageView)
        
        iconImageView
            .topTo(topAnchor, value: 4)
            .bottomTo(bottomAnchor, value: -4)
            .leadingTo(leadingAnchor, value: 12)
            .width(value: textfieldHeigh * 0.4)
    }
    
    // MARK: - Custom Methods
    func addEditBorder() {
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.borderWidth = 1
    }
    func removeEditBorder() {
        self.layer.borderWidth = 0
    }
    func iconTappedAnimate() {
        iconImageView.tappedAnimate()
    }
    
    // MARK: - Paddings
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

// MARK: - Extension / UITextfield Delegate
extension SearchTextfield: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        addEditBorder()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        removeEditBorder()
        self.textUpdateFinished(textField.text ?? "")
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        iconTappedAnimate()        
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
    
}
