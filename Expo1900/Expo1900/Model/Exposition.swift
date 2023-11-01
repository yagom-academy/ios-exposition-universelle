//
//  exposition.swift
//  Expo1900
//
//  Created by Hisop on 2023/10/31.
//

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let explanation: String
    
    enum CodingKeys: String, CodingKey {
        case title, visitors, location, duration
        case explanation = "description"
    }
}
