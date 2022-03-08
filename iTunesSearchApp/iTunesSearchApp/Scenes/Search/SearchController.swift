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
    
    // MARK: - Custom Methods
}

// MARK: - Extension / SearchView Protocol
extension SearchController: SearchViewProtocol {
    
}

