//
//  ExhibitModel.swift
//  Expo1900
//
//  Created by sookim on 2021/04/07.
//

import Foundation

struct Exhibits: Decodable {
    let name: String
    let image_name: String
    let short_desc: String
    let desc: String
    
    private enum Codingkeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Codingkeys.self)
        name = (try? values.decode(String.self, forKey: .name)) ?? ""
        image_name = (try? values.decode(String.self, forKey: .imageName)) ?? ""
        short_desc = (try? values.decode(String.self, forKey: .shortDescription)) ?? ""
        desc = (try? values.decode(String.self, forKey: .description)) ?? ""
    }
}
