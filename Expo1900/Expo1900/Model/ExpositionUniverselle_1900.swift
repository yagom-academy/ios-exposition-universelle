//
//  ExpositionUniverselle_1900.swift
//  Expo1900
//
//  Created by 오인탁 on 2021/04/05.
//

import Foundation

struct ExpoItem: Decodable {
    enum JsonKey: String, CodingKey {
        case title, visitors, location, duration, description
    }
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: JsonKey.self)
        title = (try? container.decode(String.self, forKey: .title)) ?? ""
        visitors = (try? container.decode(Int.self, forKey: .visitors)) ?? 0
        location = (try? container.decode(String.self, forKey: .location)) ?? ""
        duration = (try? container.decode(String.self, forKey: .duration)) ?? ""
        description = (try? container.decode(String.self, forKey: .description)) ?? ""
    }
}
