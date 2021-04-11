//
//  ExhibitDescription.swift
//  Expo1900
//
//  Created by sookim on 2021/04/07.
//

import Foundation

struct Expo1900Information: Decodable {
    let title: String
    let visitors: UInt
    let location: String
    let duration: String
    let description: String
}
