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
    private lazy var pageNumber = 0
    private lazy var isSearching = false // Eski/Yeni aramada tekrar kullanıcı scroll yaptığında tekrar arama yapmasını engellemek için
    private lazy var isStartBottom = false // Eski sayfaya gittiğinde scroll sayfanın en altından başlaması gerektiğini bildirmek için
    private lazy var searchResults = [String: [SearchModel.Response.SearchGeneralModel]]()
    
    // MARK: - View Elements
    private lazy var searchTextfield = SearchTextfield(tag: 0, placeholder: "Film, Müzik veya Kitap Ara")
    private lazy var informationView = InformationView(image: .searchWaiting!, info: "Henüz aranılacak birşey yok...")
    private lazy var searchTableView = UITableView(inset: .init(top: 0, left: 0, bottom: 30, right: 0), delegate: self, dataSource: self, seperatorStyle: .singleLine)
    
    // MARK: - Constructor Method
    override func loadView() {
        super.loadView()
        
        checkSearchBarChanges()
        searchTableView.alpha = 0
        searchTableView.register(SongCardCell.self, forCellReuseIdentifier: "SongCell")
        searchTableView.register(MovieCardCell.self, forCellReuseIdentifier: "MovieCardCell")
        
        searchTableView.isUserInteractionEnabled = true
        searchTableView.delegate = self
        searchTableView.dataSource = self
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
    
    // MARK: - Setter Methods
    func updateView(_ searchResults: [String: [SearchModel.Response.SearchGeneralModel]]) {
        self.isSearching = false
        
        guard searchResults.count > 0 else {
            setViewForDataNotFound()
            return
        }
        self.searchResults = searchResults
        searchTableView.reloadData()
        
        let bottomOffset = CGPoint(x: 0, y: searchTableView.contentSize.height - searchTableView.bounds.size.height)
        searchTableView.contentOffset.y = isStartBottom ? bottomOffset.y : 0
        isStartBottom = false

        UIView.animate(withDuration: 0.5) {
            self.searchTableView.alpha = 1
        }
    }
    
    // MARK: - Getter Methods
    func getHeaderCount() -> Int {
        return searchResults.keys.count
    }
    func getHeader(_ section: Int) -> String {
        return Array(searchResults.keys)[section]
    }
    
    func getRowCount(_ section: Int) -> Int {
        return Array(searchResults.values)[section].count
    }
    func getRowItems(_ section: Int) -> [SearchModel.Response.SearchGeneralModel] {
        return Array(searchResults.values)[section]
    }
    
    // MARK: - Custom Methods
    private func checkSearchBarChanges() {
        searchTextfield.textUpdateFinished = { [self] searchString in
            pageNumber = 0
            let isCanSearch = searchString != ""
            setViewHiddens(isCanSearch)
            self.informationView.setInformation(image: .searchWaiting!, description: "Henüz aranılacak birşey yok...")
            if isCanSearch { (delegate as! SearchViewProtocol).searchTapped(pageNumber: pageNumber, limit: 25, searchString: searchString) }
        }
    }
    private func getDictionaryCount() -> Int {
        return self.searchResults.values.flatMap({ $0.count }).reduce(0, +)
    }
    
    private func setViewForDataNotFound() {
        self.searchResults = [:]
        self.searchTableView.reloadData()
        
        self.setViewHiddens(searchResults.count > 0)
        self.informationView.setInformation(image: .searchNotFound!, description: "Aramaya ait bir sonuç bulunamadı.")
    }
    private func setViewHiddens(_ isCanSearch: Bool) {
        self.informationView.setViewHidden(isCanSearch, animated: true) {
            self.searchTableView.setTableViewHidden(!isCanSearch, animated: true)
        }
    }
    private func getNewPage() {
        guard getDictionaryCount() == 25 else { return } // 25 data varsa devamı vardır, 25'ten küçük ise zaten son dataları çekmiştir.
        self.isSearching = true
        
        UIView.animate(withDuration: 0.5) {
            self.searchTableView.alpha = 0
        } completion: { [self] _ in
            pageNumber += 1
            searchTableView.contentOffset.y = 0
            searchResults.removeAll()
            searchTableView.reloadData()
            (delegate as! SearchViewProtocol).searchTapped(pageNumber: pageNumber, limit: 25, searchString: searchTextfield.text!)
        }
    }
    private func getOldPage() {
        guard pageNumber > 0 else { return } // 0'dan büyükse sayfa hala geri gelebilir. 0 ise zaten ilk sayfadadır.
        self.isSearching = true
        
        UIView.animate(withDuration: 0.5) {
            self.searchTableView.alpha = 0
        } completion: { [self] _ in
            pageNumber -= 1
            isStartBottom = true
            searchResults.removeAll()
            searchTableView.reloadData()
            (delegate as! SearchViewProtocol).searchTapped(pageNumber: pageNumber, limit: 25, searchString: searchTextfield.text!)
        }
    }
}

// MARK: - Extension / UITableView Methods
extension SearchView: UITableViewDelegate, UITableViewDataSource {
    // FOR HEADER
    func numberOfSections(in tableView: UITableView) -> Int {
        return getHeaderCount()
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = getHeader(section)
        let title = SearchSection(rawValue: header)?.getTitle() ?? header
        
        lazy var headerView = UIView()
        lazy var titleLabel = UILabel(text: title, size: .title3, numberOfLines: 0, fontType: .bold, textColor: .black)
        headerView.addSubview(titleLabel)
        titleLabel
            .topTo(headerView.topAnchor, value: 8)
            .bottomTo(headerView.bottomAnchor, value: -8)
            .leadingTo(headerView.leadingAnchor, value: 10)
            .trailingTo(headerView.trailingAnchor)
        
        headerView.backgroundColor = .white
        return headerView
    }
    // FOR CELL
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getRowCount(section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = getHeader(indexPath.section)
        let item = getRowItems(indexPath.section)[indexPath.row]
                
        if section == "song" || section == "podcast" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell") as! SongCardCell
            cell.setCell(item.getSongCardModel())
            return cell
        }
        
        if section == "feature-movie" || section == "tv-episode" || section == "music-video" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCardCell") as! MovieCardCell
            cell.setCell(item.getMovieCardModel())
            return cell
        }
        return UITableViewCell()
    }
    // FOR DID SELECT
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = Array(searchResults.values)[indexPath.section][indexPath.row]
        (delegate as! SearchViewProtocol).itemSelected(selectedItem.getStringValue(typeOf: .trackId))
    }
    // FOR SCROLL PAGINATION
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        endEditing(true)
        guard isSearching == false else { return }
        if scrollView.contentOffset.y < -boundsHeight * 0.2 { // Sayfanın başından ekran boyu %15 yukarı çekilirse -> Eski sayfayı çeker
            getOldPage()
        } else if (scrollView.contentOffset.y - boundsHeight * 0.2) >= (scrollView.contentSize.height - scrollView.frame.size.height) { // Sayfanın sonundan ekran boyu %15 aşağı çekilirse -> Yeni sayfayı çeker
            getNewPage()
        }
    }
}
