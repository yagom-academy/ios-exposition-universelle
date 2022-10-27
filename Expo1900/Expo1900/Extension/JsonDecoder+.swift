//
//  JsonDecoder+.swift
//  Expo1900
//
//  Copyright (c) 2022 Minii All rights reserved.

import UIKit

extension JSONDecoder {
    func decode<T: Decodable>(fileName: String) throws -> T {
        guard let json = NSDataAsset(name: fileName) else {
            throw DecodingError.notFoundFile
        }
        
        let data = json.data
        
        guard let result = try? self.decode(T.self, from: data) else {
            throw DecodingError.canNotDecode
        }
        
        return result
    }
}
