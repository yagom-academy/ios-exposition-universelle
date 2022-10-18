//
//  Exposition.swift
//  Expo1900
//
//  Created by 임지연 on 2022/10/18.
//

import Foundation

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
}
