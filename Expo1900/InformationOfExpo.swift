//
//  Exposition.swift
//  Expo1900
//
//  Created by tae hoon park on 2021/07/06.
//

import Foundation

struct InformationOfExpo: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
}
