//
//  Expo1900 - ExpositionUniverselle.swift
//  Created by Christy, Rhode.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct ExpositionUniverselle: Decodable {
    let title: String
    let visitorCount: Int
    let location: String
    let duration: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case visitorCount = "visitors"
        case location
        case duration
        case description
    }
}
