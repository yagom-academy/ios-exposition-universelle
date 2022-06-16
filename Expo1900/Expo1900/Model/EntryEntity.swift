//
//  EntryEntity.swift
//  Expo1900
//
//  Created by Derrick kim on 2022/06/13.
//
import UIKit

struct EntryEntity: Decodable {
    let name: String
    private let imageName: String
    let shortDescription: String
    let description: String
    
    init(name: String, imageName: String, shortDescription: String, description: String) {
        self.name = name
        self.imageName = imageName
        self.shortDescription = shortDescription
        self.description = description
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}

extension EntryEntity {
    var image: UIImage? {
        let uiImage = UIImage(named: self.imageName)
        return uiImage
    }
}
