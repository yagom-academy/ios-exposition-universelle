//
//  ExpoItem.swift
//  Expo1900
//
//  Created by 이성노 on 2021/04/08.
//

import Foundation

class ExpoItem: Decodable {
    let name: String
    let imageName: String
    let shortDesc: String
    let desc: String
    
    private enum CodingKeys: String, CodingKey {
        case name, desc
        case imageName = "image_name"
        case shortDesc = "short_desc"
    }
    
    required init(from decoder: Decoder) throws {
        let expoItemContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.name = (try expoItemContainer.decode(String?.self, forKey: .name)) ?? ""
        self.imageName = (try expoItemContainer.decode(String?.self, forKey: .imageName)) ?? ""
        self.shortDesc = (try expoItemContainer.decode(String?.self, forKey: .shortDesc)) ?? ""
        self.desc = (try expoItemContainer.decode(String?.self, forKey: .desc)) ?? ""
    }
    
}
