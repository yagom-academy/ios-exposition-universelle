//
//  JsonFileName.swift
//  Expo1900
//
//  Created by Ellen on 2021/07/14.
//

import Foundation

enum JsonFileName: CustomStringConvertible {
    case exposition_universelle_1900
    case items
    
    var description: String {
        switch self {
        case .exposition_universelle_1900:
            return "exposition_universelle_1900"
        case .items:
            return "items"
            
        }
    }
}
