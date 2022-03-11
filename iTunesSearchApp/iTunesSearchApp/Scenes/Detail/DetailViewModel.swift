//
//  DetailViewModel.swift
//  iTunesSearchApp
//
//  Created by Erdem on 11.03.2022.
//

import Foundation

class DetailViewModel: NSObject {
    // MARK: - Properties
    private var id: String!
    private var detailResponse: DetailModel.Response!
    
    // MARK: - Notify Controller
    var notifyDetailResponse: () -> Void = { }
        
    // MARK: - Service Methods
    func getDetailsFromService() {
        API.shared.getDetail(id: self.id) { rm in
            guard let rm = rm else { return }
            self.detailResponse = rm
            self.notifyDetailResponse()
        }
    }    
    
    // MARK: - Getter & Setter Methods
    func setId(_ id: String) {
        self.id = id
    }
    func getId() -> String {
        return id
    }
    func getDetailResponse() -> DetailModel.Response {
        return self.detailResponse
    }
}
