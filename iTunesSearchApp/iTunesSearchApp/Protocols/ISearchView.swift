//
//  ISearchView.swift
//  iTunesSearchApp
//
//  Created by Erdem on 8.03.2022.
//

import Foundation

protocol SearchViewProtocol: AnyObject {
    func searchTapped(pageNumber: Int, limit: Int, searchString: String)
    func itemSelected(_ id: String)
}
