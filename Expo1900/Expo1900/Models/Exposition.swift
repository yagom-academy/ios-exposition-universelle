//
//  Exposition.swift
//  Expo1900
//
//  Created by 재재, 보리사랑 on 2022/06/13.
//

import Foundation

// MARK: - Exposition
struct Exposition: Codable {
    let title: String
    let visitors: Int
    let location, duration, expositionDescription: String

    enum CodingKeys: String, CodingKey {
        case title, visitors, location, duration
        case expositionDescription = "description"
    }
}
