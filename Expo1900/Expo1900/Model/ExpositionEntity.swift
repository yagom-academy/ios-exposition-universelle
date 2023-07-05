//
//  ExpositionEntity.swift
//  Expo1900
//
//  Created by Max, Whales on 2023/06/27.
//

struct ExpositionEntity: Decodable, Equatable {
    let title: String
    let visitors: UInt
    let location: String
    let duration: String
    let description: String
}
