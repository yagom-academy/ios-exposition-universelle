//
//  EntryDTO.swift
//  Expo1900
//
//  Created by Yejin Hong on 3/7/24.
//

struct EntryDTO: Decodable {
    let name: String
    let imageName: String
    let description: String
    let shortDescription: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case description = "desc"
        case shortDescription = "short_desc"
    }
}

extension EntryDTO {
    func toModel() -> Entry {
        return .init(imageName: imageName,
                     name: name,
                     shortDescription: shortDescription)
    }
    
    func toModel() -> EntryDetail {
        return .init(name: name,
                     imageName: imageName,
                     description: description)
    }
}
