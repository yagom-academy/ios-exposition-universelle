//
//  Model.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/11.
//

import UIKit

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    static func getInfo() throws -> Exposition {
        let expoInfo = try Exposition.decode(with: "exposition_universelle_1900")
        return expoInfo
    }
}
