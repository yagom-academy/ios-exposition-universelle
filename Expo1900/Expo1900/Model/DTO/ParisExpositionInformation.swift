//
//  ParisExpositionInformation.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/06/26.
//

struct ParisExpositionInformation: Decodable {
    let title: String
    let visitors: UInt
    let location: String
    let duration: String
    let description: String
}
