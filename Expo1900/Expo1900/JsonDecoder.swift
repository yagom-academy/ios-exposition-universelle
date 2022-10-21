//
//  JsonDecoder.swift
//  Expo1900
//
//  Created by 유제민 on 2022/10/21.
//

import UIKit

extension JSONDecoder {
    
    func decodeData<T: Decodable>(from file: String, to: T) -> T? {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: file) else { return nil }
        do {
            return try self.decode(T.self, from: dataAsset.data)
        } catch {
            return nil
        }
    }
}
