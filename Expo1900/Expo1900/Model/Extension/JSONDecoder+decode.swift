//
//  JsonDecoder.swift
//  Expo1900
//
//  Created by Jeremy, 준호 on 2022/10/21.
//

import UIKit

extension JSONDecoder {
    
    func decode<T: Decodable>(from fileName: String, to: T) -> T? {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: fileName) else { return nil }
        do {
            return try self.decode(T.self, from: dataAsset.data)
        } catch {
            return nil
        }
    }
}
