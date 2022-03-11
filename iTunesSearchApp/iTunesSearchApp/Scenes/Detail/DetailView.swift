//
//  DetailView.swift
//  iTunesSearchApp
//
//  Created by Erdem on 11.03.2022.
//

import UIKit

class DetailView: BaseView<DetailViewProtocol> {
    // MARK: - Properties
    
    // MARK: - View Elements
    private lazy var scrollView = UIScrollView()
    private lazy var detailImageView = UIImageView(image: nil, contentMode: .scaleAspectFit)
    private lazy var artistLabel = UILabel(size: .body, numberOfLines: 0, fontType: .bold, textColor: .black, alignment: .center)
    private lazy var detailLabel = UILabel(size: .body, numberOfLines: 0, fontType: .regular, textColor: .darkGray, alignment: .center)
    
    private lazy var priceView = UIView(bgColor: .white, cornerRadius: 12, borderColor: .blue, borderWidth: 1)
    private lazy var priceLabel = UILabel(size: .body, numberOfLines: 0, fontType: .medium, textColor: .blue, alignment: .center)
    
    // MARK: - Constructor Method
    override func setConstraints() {
        super.setConstraints()
        
        addSubview(scrollView)
        scrollView.addSubviews(detailImageView, artistLabel, detailLabel, priceView)
        priceView.addSubview(priceLabel)
        
        scrollView
            .topTo(layoutMarginsGuide.topAnchor)
            .bottomTo(bottomAnchor)
            .leadingTo(leadingAnchor)
            .trailingTo(trailingAnchor)
        
        detailImageView
            .topTo(scrollView.topAnchor, value: 25)
            .centerXTo(centerXAnchor)
            .width(value: boundsWidth * 0.4)
            .aspectSize(ratio: 1)
        
        artistLabel
            .topTo(detailImageView.bottomAnchor, value: 20)
            .centerXTo(centerXAnchor)
            .width(value: boundsWidth * 0.9)
        
        detailLabel
            .topTo(artistLabel.bottomAnchor, value: 12)
            .centerXTo(centerXAnchor)
            .width(value: boundsWidth * 0.9)
        
        priceView
            .topTo(detailLabel.bottomAnchor, value: 20)
            .bottomTo(scrollView.bottomAnchor)
            .centerXTo(centerXAnchor)
        
        priceLabel
            .topTo(priceView.topAnchor, value: 10)
            .bottomTo(priceView.bottomAnchor, value: -10)
            .leadingTo(priceView.leadingAnchor, value: 10)
            .trailingTo(priceView.trailingAnchor, value: -10)
    }
    
    // MARK: - Setter Methods
    func updateView(_ model: DetailModel.Response.DetailResultModel) {
        detailImageView.kf.setImage(with: URL(string: model.getStringValue(.artworkUrl100)))
        artistLabel.text = model.getStringValue(.artistName)
        detailLabel.text = "\(model.getStringValue(.trackName)) - \(model.getStringValue(.collectionName))"
        priceLabel.text = model.getStringValue(.trackPrice)
    }
    
}
