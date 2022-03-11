//
//  IDetailService.swift
//  iTunesSearchApp
//
//  Created by Erdem on 12.03.2022.
//

import Foundation

protocol DetailService: AnyObject {
    func getDetail(id: String, completion: @escaping (DetailModel.Response?) -> Void)
}
