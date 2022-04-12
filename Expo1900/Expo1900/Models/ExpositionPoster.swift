//
//  exposition.swift
//  Expo1900
//
//  Created by 김동욱 on 2022/04/12.
//

import Foundation
import UIKit

struct ExpositionPoster: Codable {
    let title: String?
    let visitors: Int?
    let location: String?
    let duration: String?
    let description: String?
    
    static func parse() -> ExpositionPoster? {
        guard let asset = NSDataAsset(name: "exposition_universelle_1900") else {
            return nil
        }
        let posterData = try? JSONDecoder().decode(ExpositionPoster.self, from: asset.data)
        
        return posterData
    }
}
