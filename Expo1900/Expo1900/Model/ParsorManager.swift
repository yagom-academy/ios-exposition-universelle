//
//  ParsorManager.swift
//  Expo1900
//
//  Created by 김태현 on 2022/04/19.
//

enum ParsorManager<T: Decodable> {
    static func parse(fileName: String) throws -> T {
        guard let data = try? T.convert(from: fileName) else {
            throw DecoderError.decodeFail
        }
        return data
    }
}
