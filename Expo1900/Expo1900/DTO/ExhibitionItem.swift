//
//  ExhibitionItem.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/06/26.
//

import Foundation

struct ExhibitionItem: Decodable, Identifiable {
    let id: UUID = UUID()
    
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
}

extension ExhibitionItem: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
