//
//  Exposition.swift
//  Expo1900
//
//  Created by 임성민 on 2020/12/22.
//

import Foundation

struct Exposition: Decodable {
    let title: String
    let visitorsNumber: Int
    let location: String
    let duration: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case title, location, duration, description
        case visitorsNumber = "visitors"
    }
}
