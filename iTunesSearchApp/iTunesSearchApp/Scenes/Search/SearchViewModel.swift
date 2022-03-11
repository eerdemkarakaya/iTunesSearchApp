//
//  SearchViewModel.swift
//  iTunesSearchApp
//
//  Created by Erdem on 8.03.2022.
//

import Foundation

class SearchViewModel: NSObject {
    // MARK: - Properties
    private var searchResponseModel: SearchModel.Response?
    private var groupedSearchResult: [String: [SearchModel.Response.SearchGeneralModel]] = [:]
    
    // MARK: - Notify Controller
    var notifySearchResult: () -> Void = { }
    
    // MARK: - Service Methods
    func search(pageNumber: Int, limit: Int = 25, searchString: String) {
        API.shared.search(searchString: searchString, limit: limit, page: pageNumber) { rm in
            guard let rm = rm else { return }
            self.searchResponseModel = rm
            self.notifySearchResult()                        
        }
    }
    
    // MARK: - Getter & Setter Methods
    func getSearchResults() -> [String: [SearchModel.Response.SearchGeneralModel]] {
        var groupByWrapperType = Dictionary(grouping: searchResponseModel!.results, by: { $0.getStringValue(typeOf: .wrapperType) }) // Örnek: -> track, audibook ...
                
        if let tracks = groupByWrapperType["track"] { // WrapperType track içeriyorsa eğer track grubunu kind türüne göre grupluyor ve eski track grubununu siliyor. Örnek: -> audibook, song, tv-episode (track silindi) ...
            var groupedTracks = Dictionary(grouping: tracks, by: { $0.getStringValue(typeOf: .kind) })
            groupByWrapperType.removeValue(forKey: "track")
            
            groupedTracks.forEach({
                groupByWrapperType.updateValue($0.value, forKey: $0.key)
            })
            groupedTracks.removeAll()
        }

        self.groupedSearchResult = groupByWrapperType
        return groupByWrapperType
    }
}
