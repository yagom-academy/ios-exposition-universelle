//
//  JSONFile.swift
//  Expo1900
//
//  Created by idinaloq, hoon on 2023/06/30.
//

enum JSONFile {
    case exposition
    case items
    
    var name: String {
        switch self {
        case .exposition:
            return "exposition_universelle_1900"
        case .items:
            return "items"
        }
    }
}
