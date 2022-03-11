//
//  Date+.swift
//  iTunesSearchApp
//
//  Created by Erdem on 11.03.2022.
//

import Foundation

extension Date {
    func dateProcess(_ date:  Date = Date(), _ value: Int) -> Date? {
        return Calendar.current.date(byAdding: .day, value: value, to: date)
    }
    func toString(_ format: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.locale = Locale(identifier: "tr")
        
        return dateFormatter.string(from: self)
    }
}

extension String {
    func toDate(_ currentFormat: DateFormat) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = currentFormat.rawValue
        dateFormatter.locale = Locale(identifier: "tr")
        
        return dateFormatter.date(from: self)  ?? Date()
    }
}
