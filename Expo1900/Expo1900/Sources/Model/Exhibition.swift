//
//  Exhibition.swift
//  Expo1900
//
//  Created by Gundy, Dragon on 2022/10/18.
//

struct Exhibition: Codable {
    private let name: String
    private let imageName: String
    private let shortDescription: String
    private let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
