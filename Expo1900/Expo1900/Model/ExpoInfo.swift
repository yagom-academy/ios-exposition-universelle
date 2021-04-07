//
//  ExpoInfo.swift
//  Expo1900
//
//  Created by 배은서 on 2021/04/06.
//

import Foundation

struct ExpoInfo: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
}
