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
    let desc: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case visitors
        case location
        case duration
        case desc = "description"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = (try? container.decode(String.self, forKey: .title)) ?? ""
        self.visitors = (try? container.decode(UInt.self, forKey: .visitors)) ?? 0
        self.location = (try? container.decode(String.self, forKey: .location)) ?? ""
        self.duration = (try? container.decode(String.self, forKey: .duration)) ?? ""
        self.desc = (try? container.decode(String.self, forKey: .desc)) ?? ""
    }
}
