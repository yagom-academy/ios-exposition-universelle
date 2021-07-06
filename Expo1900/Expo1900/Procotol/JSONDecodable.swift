//
//  Decoder.swift
//  Expo1900
//
//  Created by kjs on 2021/07/06.
//

import UIKit

enum DecoderError: Error {
    case invaildFileName
}

protocol JSONDecodable {
    associatedtype T: Decodable
}

extension JSONDecodable {
    func decodeJSON(fileName: String) throws -> T {
        guard let convertedAsset = NSDataAsset(name: fileName) else {
            throw DecoderError.invaildFileName
        }
        
        do {
            let decoder = JSONDecoder()
            
            return try decoder.decode(T.self, from: convertedAsset.data)
        } catch {
            throw error
        }
    }
}

