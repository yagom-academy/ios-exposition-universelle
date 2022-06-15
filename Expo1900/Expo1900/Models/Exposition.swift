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
    let location: String
    let duration: String
    let expositionDescription: String
    let visitors: Int

    enum CodingKeys: String, CodingKey {
        case title
        case location
        case duration
        case expositionDescription = "description"
        case visitors
    }
}
