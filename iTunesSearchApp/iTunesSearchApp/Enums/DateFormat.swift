//
//  DateFormat.swift
//  iTunesSearchApp
//
//  Created by Erdem on 11.03.2022.
//

import Foundation

enum DateFormat: String {
    case d_m_y_short = "dd.MM.yyyy"
    case d_m_y_h_m_short = "dd.MM.yyyy  HH:mm"
    case d_m_y_h_m_s_short = "dd.MM.yyyy  HH:mm:ss"
    case d_m_y_long = "dd MMM yyyy"
    case defaultType = "yyyy-MM-dd'T'HH:mm:ssZ"
}
