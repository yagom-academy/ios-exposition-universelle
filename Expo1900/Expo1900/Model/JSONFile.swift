//
//  JSONFile.swift
//  Expo1900
//
//  Created by idinaloq, hoon on 2023/06/30.
//

enum JSONFile: CustomStringConvertible {
    case exposition
    case items
    
    var description: String {
        switch self {
        case .exposition:
            return "exposition_universelle_1900"
        case .items:
            return "items"
        }
    }
}
