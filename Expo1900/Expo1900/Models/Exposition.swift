//
//  Exposition.swift
//  Expo1900
//
//  Created by 김호준 on 2020/12/21.
//

import UIKit

struct Exposition: Codable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    var posterImage: UIImage {
        UIImage(named: "poster") ?? UIImage()
    }
}
