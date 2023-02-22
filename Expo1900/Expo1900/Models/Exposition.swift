//
//  Exposition.swift
//  Expo1900
//
//  Created by 세홍, 송준, 무리 on 2023/02/20.
//

import Foundation

struct Exposition: Decodable {
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
