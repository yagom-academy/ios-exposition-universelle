//
//  ExpoItems.swift
//  Expo1900
//
//  Created by Seul Mac on 2021/12/07.
//

import Foundation

typealias ExpoItems = [ExpoItem]

struct ExpoItem: Codable {
    let name: String
    let imageName: String
    let summary: String
    let explanation: String

    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case summary = "short_desc"
        case explanation = "desc"
    }
}
