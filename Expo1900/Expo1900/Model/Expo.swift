//
//  Expo.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/05.
//

import Foundation

struct Expo: Decodable {
    let title: String
    let visitors: UInt
    let location: String
    let duration: String
    let description: String
    
    private enum CodingKeys: CodingKey {
        case title, visitors, location, duration, description
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = (try? container.decode(String.self, forKey: .title)) ?? ""
        self.visitors = (try? container.decode(UInt.self, forKey: .visitors)) ?? 0
        self.location = (try? container.decode(String.self, forKey: .location)) ?? ""
        self.duration = (try? container.decode(String.self, forKey: .duration)) ?? ""
        self.description = (try? container.decode(String.self, forKey: .description)) ?? ""
    }
    
    init(title: String, visitors: UInt, location: String, duration: String, description: String) {
        self.title = title
        self.visitors = visitors
        self.location = location
        self.duration = duration
        self.description = description
    }
}

extension Expo: Equatable {
    static func == (lhs: Expo, rhs: Expo) -> Bool {
        return lhs.title == rhs.title &&
            lhs.visitors == rhs.visitors &&
            lhs.location == rhs.location &&
            lhs.duration == rhs.duration &&
            lhs.description == rhs.description
    }
}
