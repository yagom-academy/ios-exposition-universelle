//
//  ExpositionDTO.swift
//  Expo1900
//
//  Created by Jaehun Lee on 3/7/24.
//

struct ExpositionDTO: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
}

extension ExpositionDTO {
    func toModel() -> Exposition {
        return .init(title: title,
                     visitors: visitors,
                     location: location,
                     duration: duration,
                     description: description)
    }
}
