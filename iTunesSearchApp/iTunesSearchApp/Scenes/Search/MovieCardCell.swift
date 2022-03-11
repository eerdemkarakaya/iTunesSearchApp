//
//  MovieCardCell.swift
//  iTunesSearchApp
//
//  Created by Erdem on 10.03.2022.
//

import UIKit
import Kingfisher

class MovieCardCell: UITableViewCell {
    // MARK: - Properties
    
    // MARK: - View Elements
    private lazy var containerView = UIView()
    private lazy var movieImageView = UIImageView(image: nil, contentMode: .scaleAspectFit)
    private lazy var movieNameLabel = UILabel(size: .subhead, numberOfLines: 0, fontType: .medium, textColor: .black)
    private lazy var movieCategoryLabel = UILabel(size: .footnote, numberOfLines: 0, fontType: .medium, textColor: .darkGray)
    private lazy var movieDateLabel = UILabel(size: .footnote, numberOfLines: 0, fontType: .medium, textColor: .darkGray)
    
    // MARK: - Constructor Method
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .white
        setConstraints()
        movieImageView.backgroundColor = .black
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setConstraints() {
        contentView.addSubview(containerView)
        containerView.addSubviews(movieImageView, movieNameLabel, movieCategoryLabel, movieDateLabel)
        
        containerView
            .topTo(contentView.topAnchor, value: 10)
            .bottomTo(contentView.bottomAnchor, value: -10)
            .leadingTo(contentView.leadingAnchor)
            .trailingTo(contentView.trailingAnchor)
            .minHeight(value: 70)
        
        movieImageView
            .centerYTo(containerView.centerYAnchor)
            .leadingTo(containerView.leadingAnchor)
            .width(value: 80)
            .aspectSize(ratio: 1)
        
        movieNameLabel
            .topTo(containerView.topAnchor)
            .leadingTo(movieImageView.trailingAnchor, value: 10)
            .trailingTo(containerView.trailingAnchor, value: -6)
        
        movieCategoryLabel
            .topTo(movieNameLabel.bottomAnchor)
            .leadingTo(movieImageView.trailingAnchor, value: 10)
            .trailingTo(containerView.trailingAnchor, value: -6)

        movieDateLabel
            .topTo(movieCategoryLabel.bottomAnchor)
            .bottomTo(containerView.bottomAnchor)
            .leadingTo(movieImageView.trailingAnchor, value: 10)
            .trailingTo(containerView.trailingAnchor, value: -6)
    }
    
    // MARK: - Setter Methods
    func setCell(_ item: MovieCardModel) {
        movieImageView.kf.setImage(with: URL(string: item.getStringValue(.imageURL))!)
        movieNameLabel.text = item.getStringValue(.movieName)
        movieCategoryLabel.text = item.getStringValue(.movieCategory)
        movieDateLabel.text = item.getStringValue(.movieDate).toDate(.defaultType).toString(.d_m_y_h_m_short)
    }
}
