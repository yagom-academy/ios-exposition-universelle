//
//  Item.swift
//  Expo1900
//
//  Created by dhoney96 on 2022/06/13.
//

import Foundation

struct Entry: Codable, Identifiable {
    var id = UUID()
    let name: String
    let imageName: String
    let shortDesc: String
    let desc: String
}

