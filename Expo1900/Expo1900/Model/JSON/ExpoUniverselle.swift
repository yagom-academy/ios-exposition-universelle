//
//  ExpoUniverselle.swift
//  Expo1900
//
//  Created by 리지, Rowan on 2023/02/20.
//

struct ExpoUniverselle: Decodable {
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
