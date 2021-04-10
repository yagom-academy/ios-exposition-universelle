//
//  ExpoInfo.swift
//  Expo1900
//
//  Created by kio on 2021/04/09.
//

import Foundation

struct ExpoInfo: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
}
