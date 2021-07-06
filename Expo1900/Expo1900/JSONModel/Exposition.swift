//
//  Exposition.swift
//  Expo1900
//
//  Created by 홍정아 on 2021/07/05.
//

import Foundation

struct Exposition: Decodable {
    let title: String
    let visitors: UInt
    let location: String
    let duration: String
    let description: String
}
