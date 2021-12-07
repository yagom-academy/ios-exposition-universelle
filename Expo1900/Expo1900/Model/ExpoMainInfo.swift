//
//  ExpoMainInfo.swift
//  Expo1900
//
//  Created by Seul Mac on 2021/12/07.
//

import Foundation

struct ExpoMainInfo: Codable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let explanation: String

    enum CodingKeys: String, CodingKey {
        case title
        case visitors
        case location
        case duration
        case explanation = "description"
    }
}
