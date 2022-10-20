//
//  Exposition.swift
//  Expo1900
//
//  Created by Gundy, Dragon on 2022/10/18.
//

struct Exposition: Codable {
    private let title: String
    private let numberOfVisitors: Int
    private let location: String
    private let duration: String
    private let description: String
    
    enum CodingKeys: String, CodingKey {
        case title, location, duration, description
        case numberOfVisitors = "visitors"
    }
}
