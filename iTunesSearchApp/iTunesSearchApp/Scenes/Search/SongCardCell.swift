//
//  SongCardCell.swift
//  iTunesSearchApp
//
//  Created by Erdem on 10.03.2022.
//

import UIKit
import Kingfisher

class SongCardCell: UITableViewCell {
    // MARK: - Properties
    
    // MARK: - View Elements
    private lazy var containerView = UIView()
    private lazy var songImageView = UIImageView(image: nil, contentMode: .scaleAspectFit)
    private lazy var songNameLabel = UILabel(size: .subhead, numberOfLines: 0, fontType: .medium, textColor: .black)
    private lazy var songDetailLabel = UILabel(size: .footnote, numberOfLines: 0, fontType: .medium, textColor: .darkGray)
    
    private lazy var priceView = UIView(cornerRadius: 12, borderColor: .blue, borderWidth: 1)
    private lazy var priceLabel = UILabel(size: .footnote, numberOfLines: 1, fontType: .bold, textColor: .blue, alignment: .center)
    
    // MARK: - Constructor Method
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        backgroundColor = .white
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setConstraints() {
        addSubview(containerView)
        containerView.addSubviews(songImageView, songNameLabel, songDetailLabel, priceView)
        priceView.addSubview(priceLabel)
        
        containerView
            .topTo(topAnchor, value: 10)
            .bottomTo(bottomAnchor, value: -10)
            .leadingTo(leadingAnchor)
            .trailingTo(trailingAnchor)
        
        songImageView
            .centerYTo(containerView.centerYAnchor)
            .leadingTo(containerView.leadingAnchor)
            .width(value: 30)
            .aspectSize(ratio: 1)
        
        songNameLabel
            .topTo(containerView.topAnchor)
            .leadingTo(songImageView.trailingAnchor, value: 10)
            .trailingTo(priceView.leadingAnchor, value: -6)
        
        songDetailLabel
            .topTo(songNameLabel.bottomAnchor)
            .bottomTo(containerView.bottomAnchor)
            .leadingTo(songImageView.trailingAnchor, value: 10)
            .trailingTo(priceView.leadingAnchor, value: -6)
        
        priceView
            .centerYTo(containerView.centerYAnchor)
            .trailingTo(containerView.trailingAnchor, value: -4)
            .width(value: boundsWidth * 0.15)
        
        priceLabel
            .topTo(priceView.topAnchor, value: 4)
            .bottomTo(priceView.bottomAnchor, value: -4)
            .leadingTo(priceView.leadingAnchor, value: 4)
            .trailingTo(priceView.trailingAnchor, value: -4)
    }
    
    // MARK: - Setter Methods
    func setCell(_ item: SongCardModel) {
        songImageView.kf.setImage(with: URL(string: item.getStringValue(.imageURL))!)
        songNameLabel.text = item.getStringValue(.songName)
        songDetailLabel.text = item.getStringValue(.songDetail)
        
        let price = item.getStringValue(.price)
        priceLabel.text = "₺ \(price)"
        
        if Double(price)! <= 0 {
            priceView.removeFromSuperview()
            songNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -4).isActive = true
            songDetailLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -4).isActive = true
        }
    }
}
