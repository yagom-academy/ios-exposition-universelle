//
//  ExpoData.swift
//  Expo1900
//
//  Created by james on 2021/04/06.
//

import Foundation

struct Expo: Codable {
    var title: String
    var visitors: Int
    var location: String
    var duration: String
    var description: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
            title = (try? container.decode(String.self, forKey: .title)) ?? ""
            visitors = (try? container.decode(Int.self, forKey: .visitors)) ?? 0
            location = (try? container.decode(String.self, forKey: .location)) ?? ""
            duration = (try? container.decode(String.self, forKey: .duration)) ?? ""
            description = (try? container.decode(String.self, forKey: .description)) ?? ""
    }
}
