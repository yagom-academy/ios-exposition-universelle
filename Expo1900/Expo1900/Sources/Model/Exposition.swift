//
//  Exposition.swift
//  Expo1900
//
//  Created by Gundy, Dragon on 2022/10/18.
//

struct Exposition: Codable {
    let title: String
    let numberOfVisitors: Int
    let location: String
    let duration: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case title, location, duration, description
        case numberOfVisitors = "visitors"
    }
}
