//
//  JSONDecoder+.swift
//  Expo1900
//
//  Created by Yejin Hong on 3/8/24.
//
import UIKit

extension JSONDecoder {
    func decode<T>(from fileName: String, to type: T.Type) -> T? where T : Decodable {
        guard let data = NSDataAsset(name: fileName),
              let decodedData = try? self.decode(type, from: data.data) else {
            return nil
        }
        return decodedData
    }
}
