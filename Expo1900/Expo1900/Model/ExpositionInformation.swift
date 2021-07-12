//
//  Exposition.swift
//  Expo1900
//
//  Created by WANKI KIM on 2021/07/06.
//

import Foundation

struct ExpositionInformation: Decodable {
    let title: String
    let visitors: UInt
    let location: String
    let duration: String
    let description: String
}
