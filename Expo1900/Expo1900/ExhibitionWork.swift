//
//  ExhibitionWork.swift
//  Expo1900
//
//  Created by iluxsm on 2020/12/22.
//

import UIKit

struct ExhibitionWork: Decodable {
    let name: String?
    private let imageName: String?
    let shortDescription: String?
    let description: String?
    var image: UIImage? {
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
