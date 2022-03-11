//
//  API.swift
//  iTunesSearchApp
//
//  Created by Erdem on 9.03.2022.
//

import Alamofire

class API: SearchService, DetailService {
    // MARK: - Properties
    static let shared = API()
    
    // MARK: - Search Service Methods
    func search(searchString: String, limit: Int, page: Int, completion: @escaping (SearchModel.Response?) -> Void) {
        let parameters: [String : Any] = ["term": searchString.removeExtraSpaces().replacingOccurrences(of: " ", with: "+"),
                                          "limit": limit,
                                          "offset": page,
                                          "lang": "tr",
                                          "country": "tr"]        
        AF.request(Endpoint.search.url, parameters: parameters).validate().responseDecodable(of: SearchModel.Response.self) { response in
            completion(response.value)
        }
    }
    
    // MARK: - Detail Service Methods
    func getDetail(id: String, completion: @escaping (DetailModel.Response?) -> Void) {
        let parameters: [String: Any] = ["id": id, "country": "tr"]
        AF.request(Endpoint.detail.url, parameters: parameters).validate().responseDecodable(of: DetailModel.Response.self) { response in
            completion(response.value)
        }
        
    }
}
