//
//  Expo.swift
//  Expo1900
//
//  Created by 이성노 on 2021/04/08.
//

import Foundation

class ExpoInfo: Decodable {
    enum JsonKey: String, CodingKey {
            case title, visitors, location, duration, description
        }
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    required init(from decoder: Decoder) throws {
        let expoInfoContainer = try decoder.container(keyedBy: JsonKey.self)
        self.title = (try expoInfoContainer.decode(String?.self, forKey: .title)) ?? ""
        self.visitors = (try expoInfoContainer.decode(Int?.self, forKey: .visitors)) ?? 0
        self.location = (try expoInfoContainer.decode(String?.self, forKey: .location)) ?? ""
        self.duration = (try expoInfoContainer.decode(String?.self, forKey: .duration)) ?? ""
        self.description = (try expoInfoContainer.decode(String?.self, forKey: .description)) ?? ""
    }
}
