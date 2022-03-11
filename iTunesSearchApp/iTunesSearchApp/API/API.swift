//
//  API.swift
//  iTunesSearchApp
//
//  Created by Erdem on 9.03.2022.
//

import Alamofire

class API: SearchService {
    // MARK: - Properties
    static let shared = API()
    private let baseURL = "https://itunes.apple.com/"
    
    // MARK: - Custom Methods
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
}
