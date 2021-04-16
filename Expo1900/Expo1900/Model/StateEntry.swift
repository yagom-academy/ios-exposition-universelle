//
//  StateEntry.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/05.
//

import Foundation

struct StateEntry: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = (try? container.decode(String.self, forKey: .name)) ?? ""
        self.imageName = (try? container.decode(String.self, forKey: .imageName)) ?? ""
        self.shortDescription = (try? container.decode(String.self, forKey: .shortDescription)) ?? ""
        self.description = (try? container.decode(String.self, forKey: .description)) ?? ""
    }
    
    init(name: String, imageName: String, shortDescription: String, description: String) {
        self.name = name
        self.imageName = imageName
        self.shortDescription = shortDescription
        self.description = description
    }
}

extension StateEntry: Equatable {
    static func == (lhs: StateEntry, rhs: StateEntry) -> Bool {
        return lhs.name == rhs.name &&
            lhs.imageName == rhs.imageName &&
            lhs.shortDescription == rhs.shortDescription &&
            lhs.description == rhs.description
    }
}
