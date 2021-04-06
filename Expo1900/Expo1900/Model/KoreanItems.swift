//
//  KoreaItem.swift
//  Expo1900
//
//  Created by 오인탁 on 2021/04/05.
//

import Foundation

struct KoreanItems: Decodable {
    enum CodingKeys: String, CodingKey {
        case name, desc
        case imageName = "image_name"
        case shortDesc = "short_desc"
    }
    let name: String
    let imageName: String
    let shortDesc: String
    let desc: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = (try? container.decode(String.self, forKey: .name)) ?? ""
        imageName = (try? container.decode(String.self, forKey: .imageName)) ?? ""
        shortDesc = (try? container.decode(String.self, forKey: .shortDesc)) ?? ""
        desc = (try? container.decode(String.self, forKey: .desc)) ?? ""
    }
}
