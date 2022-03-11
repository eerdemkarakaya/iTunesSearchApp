//
//  SearchController.swift
//  iTunesSearchApp
//
//  Created by Erdem on 8.03.2022.
//

import Foundation
import UIKit

class SearchController: UIViewController {
    // MARK: - Properties
    var coordinator: SearchCoordinator?
    private var viewModel = SearchViewModel()
    
    // MARK: - View Elements
    private lazy var view_ = SearchView(self)
    
    // MARK: - Constructor Methods
    override func loadView() {
        super.loadView()
        
        view = view_
    }
    
    // MARK: - Life Cycle Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

// MARK: - Extension / SearchView Protocol
extension SearchController: SearchViewProtocol {
    func searchTapped(pageNumber: Int, limit: Int, searchString: String) {
        viewModel.search(pageNumber: pageNumber, limit: limit, searchString: searchString)
        viewModel.notifySearchResult = { [self] in
            view_.updateView(viewModel.getSearchResults())
        }
    }
    func itemSelected(_ id: String) {
        coordinator?.coordinateToDetail(id: id)
    }
}

