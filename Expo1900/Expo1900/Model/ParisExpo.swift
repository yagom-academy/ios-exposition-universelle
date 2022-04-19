//  ParisExpo.swift
//  Expo1900
//  Created by LIMGAUI on 2022/04/11

import Foundation

struct ParisExpo: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    static func parse(fileName: String) throws -> Self {
        guard let data = try? Self.convert(from: fileName) else {
            throw DecoderError.decodeFail
        }
        return data
    }
}
