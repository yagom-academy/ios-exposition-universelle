//
//  StateEntry.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/05.
//

import Foundation

struct StateEntry: Decodable {
    var name: String
    var imageName: String
    var shortDescription: String
    var description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = (try? container.decode(String.self, forKey: .name)) ?? ""
        self.imageName = (try? container.decode(String.self, forKey: .imageName)) ?? ""
        self.shortDescription = (try? container.decode(String.self, forKey: .shortDescription)) ?? ""
        self.description = (try? container.decode(String.self, forKey: .description)) ?? ""
    }
}
