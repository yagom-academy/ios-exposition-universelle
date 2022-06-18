//
//  JSONFile.swift
//  Expo1900
//
//  Created by Derrick kim on 2022/06/18.
//

import Foundation

enum JSONFile {
    case expositionPost
    case entryEntity
}

extension JSONFile {
    var name: String {
        switch self {
        case .expositionPost:
            return "ExpositionPost"
        case .entryEntity:
            return "EntryEntity"
        }
    }
}
