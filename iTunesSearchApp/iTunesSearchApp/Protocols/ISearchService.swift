//
//  ISearchService.swift
//  iTunesSearchApp
//
//  Created by Erdem on 9.03.2022.
//

import Foundation

protocol SearchService: AnyObject {
    func search(searchString: String, limit: Int, page: Int, completion: @escaping (SearchModel.Response?) -> Void)    
}
