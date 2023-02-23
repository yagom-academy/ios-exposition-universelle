//
//  ExpositionInfo.swift
//  Expo1900
//
//  Created by 혜모리, Andrew on 2023/02/20.
//

struct ExpositionInfo: Decodable {
    let title: String
    let numberOfVisitors: Int
    let location: String
    let duration: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case numberOfVisitors = "visitors"
        case location
        case duration
        case description
    }
}
