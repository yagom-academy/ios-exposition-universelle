//
//  ParsingData.swift
//  Expo1900
//
//  Created by iluxsm on 2020/12/21.
//

import Foundation

struct ExpositionInformation: Decodable {
    let title: String?
    let visitors: Int?
    let location: String?
    let duration: String?
    let description: String?
    
    private enum CodingKeys: String, CodingKey {
        case title, visitors, location, duration, description
    }
}
