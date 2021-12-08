//
//  ParisExpoInformation.swift
//  Expo1900
//
//  Created by 박병호 on 2021/12/06.
//

import Foundation

struct ParisExpoInformation: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String

    enum CodingKeys: CodingKey {
        case title
        case visitors
        case location
        case duration
        case description
    }
}

