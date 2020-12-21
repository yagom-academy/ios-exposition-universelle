//
//  ExhibitionWork.swift
//  Expo1900
//
//  Created by iluxsm on 2020/12/22.
//

import UIKit

struct ExhibitionWork: Decodable {
    private let name: String?
    private let imageName: String?
    private let shortDescription: String?
    private let description: String?
    private var image: UIImage? {
        if let imageName = self.imageName {
            return UIImage(named: imageName)
        }
        return nil
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
