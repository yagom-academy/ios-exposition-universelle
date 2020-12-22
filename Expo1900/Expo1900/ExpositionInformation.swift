//
//  ParsingData.swift
//  Expo1900
//
//  Created by iluxsm on 2020/12/21.
//

import Foundation

struct ExpositionInformation: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case title, visitors, location, duration, description
    }
    
    init(from decoder: Decoder) throws {
        let requiredInformations = try decoder.container(keyedBy: CodingKeys.self)
        title = (try? requiredInformations.decode(String.self, forKey: .title)) ?? ""
        visitors = (try? requiredInformations.decode(Int.self, forKey: .visitors)) ?? 0
        location = (try? requiredInformations.decode(String.self, forKey: .location)) ?? ""
        duration = (try? requiredInformations.decode(String.self, forKey: .duration)) ?? ""
        description = (try? requiredInformations.decode(String.self, forKey: .description)) ?? ""
    }
}

