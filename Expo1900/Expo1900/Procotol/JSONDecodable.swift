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
    associatedtype JSONModel: Decodable
}

extension JSONDecodable {
    func decodeJSON(fileName: String) throws -> JSONModel {
        guard let convertedAsset = NSDataAsset(name: fileName) else {
            throw DecoderError.invaildFileName
        }
        
        do {
            let decoder = JSONDecoder()
            
            return try decoder.decode(JSONModel.self, from: convertedAsset.data)
        } catch {
            throw error
        }
    }
}

