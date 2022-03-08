//
//  SearchView.swift
//  iTunesSearchApp
//
//  Created by Erdem on 8.03.2022.
//

import Foundation
import UIKit

class SearchView: BaseView<SearchViewProtocol> {
    // MARK: - Properties
    
    // MARK: - View Elements
    private lazy var searchTextfield = SearchTextfield(tag: 0, placeholder: "Film, Müzik veya Kitap Ara")
    private lazy var informationView = InformationView(image: .searchWaiting!, info: "Henüz aranılacak birşey yok...")
    private lazy var searchTableView = UITableView(inset: .init(top: 0, left: 0, bottom: 30, right: 0), delegate: self, dataSource: self)
    
    // MARK: - Constructor Method
    override func loadView() {
        super.loadView()
        
        checkSearchBar()
        searchTableView.alpha = 0
    }
    override func setConstraints() {
        super.setConstraints()
        
        addSubviews(searchTextfield, informationView, searchTableView)
        searchTextfield
            .topTo(layoutMarginsGuide.topAnchor, value: 20)
            .width(value: boundsWidth * 0.9)
            .centerXTo(centerXAnchor)
            .height(value: textfieldHeigh)
        
        informationView
            .centerYTo(centerYAnchor)
            .minHeight(value: boundsHeight * 0.4)
            .centerXTo(centerXAnchor)
            .width(value: boundsWidth * 0.8)
        
        searchTableView
            .topTo(searchTextfield.bottomAnchor, value: 12)
            .bottomTo(bottomAnchor)
            .centerXTo(centerXAnchor)
            .width(value: boundsWidth * 0.9)
    }
    
    // MARK: - Custom Methods
    private func checkSearchBar() {
        searchTextfield.textUpdateFinished = { searchString in
            let isInformationHidden = searchString != ""
            self.informationView.setViewHidden(isInformationHidden, animated: true) {
                self.searchTableView.setTableViewHidden(!isInformationHidden, animated: true)
            }
        }
    }
}

extension SearchView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // TODO: -
        return cell
    }
}
