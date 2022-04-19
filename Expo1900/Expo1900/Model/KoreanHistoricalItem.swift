//
//  ProductArtWork.swift
//  Expo1900
//
//  Created by 김태현 on 2022/04/11.
//

import Foundation

struct KoreanHistoricalItem: Decodable {
    let name: String
    let imageName: String
    let shortDesciption: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDesciption = "short_desc"
        case description = "desc"
    }
}

extension Array where KoreanHistoricalItem == Array.Element {
    static func parse(fileName: String) throws -> Self {
        guard let data = try? Self.convert(from: fileName) else {
            throw DecoderError.decodeFail
        }
        return data
    }
}
