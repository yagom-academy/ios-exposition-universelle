//
//  KoreaItems.swift
//  Expo1900
//
//  Created by Brad, Groot on 2022/06/14.
//

import UIKit

struct KoreaItems: Decodable {
    private var name: String
    private var imageName: String
    private var shortDesc: String
    private var desc: String
    
    func getName() -> String {
        return name
    }
    
    func getImageName() -> String {
        return imageName
    }
    
    func getShortDesc() -> String {
        return shortDesc
    }
    
    func getDesc() -> String {
        return desc
    }
    
    func getImage() -> UIImage? {
        return UIImage(named: imageName)
    }
    
    private enum CodingKeys: String, CodingKey {
        case name, desc
        case imageName = "image_name"
        case shortDesc = "short_desc"
    }
}
