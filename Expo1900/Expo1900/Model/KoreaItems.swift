//
//  KoreaItems.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/05.
//

import Foundation

struct KoreaItems: Decodable {
    var name: String
    var imageName: String
    var shortDesc: String
    var desc: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDesc = "short_desc"
        case desc
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = (try? container.decode(String.self, forKey: .name)) ?? ""
        self.imageName = (try? container.decode(String.self, forKey: .imageName)) ?? ""
        self.shortDesc = (try? container.decode(String.self, forKey: .shortDesc)) ?? ""
        self.desc = (try? container.decode(String.self, forKey: .desc)) ?? ""
    }
}
