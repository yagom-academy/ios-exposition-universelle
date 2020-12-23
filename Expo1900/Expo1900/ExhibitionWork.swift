//
//  ExhibitionWork.swift
//  Expo1900
//
//  Created by iluxsm on 2020/12/22.
//

import UIKit

struct ExhibitionWork: Decodable {
    let name: String
    private let imageName: String
    let shortDescription: String
    let description: String
    var image: UIImage? {
        return UIImage(named: self.imageName)
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
    
    init(from decoder: Decoder) throws {
        let requiredInformations = try decoder.container(keyedBy: CodingKeys.self)
        name = (try? requiredInformations.decode(String.self, forKey: .name)) ?? ""
        imageName = (try? requiredInformations.decode(String.self, forKey: .imageName)) ?? ""
        shortDescription = (try? requiredInformations.decode(String.self, forKey: .shortDescription)) ?? ""
        description = (try? requiredInformations.decode(String.self, forKey: .description)) ?? ""
    }
    
}
