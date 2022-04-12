//
//  exposition.swift
//  Expo1900
//
//  Created by malrang, cathy on 2022/04/12.
//

import Foundation

struct ExpositionPoster: Codable, JsonDecoder {
    let title: String?
    let visitors: Int?
    let location: String?
    let duration: String?
    let description: String?
}
